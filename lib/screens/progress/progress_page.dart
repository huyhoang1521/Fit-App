import 'dart:ui';
import 'package:fit_app/algorithms/json/json_data.dart';
import 'package:fit_app/components/general/drawer/app_drawer.dart';
import 'package:fit_app/components/themes/constants.dart';
import 'package:fit_app/models/exercise_structures.dart';
import 'package:fit_app/screens/progress/fundamentals.dart';
import 'package:fit_app/screens/progress/exercise_overview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:percent_indicator/percent_indicator.dart';

JsonData jsonData = new JsonData('workoutData.json');
List<Map<String, dynamic>> exerciseList = new List();
List<Map<String, dynamic>> progressionList = new List();
List<Map<String, dynamic>> exerciseMap = new List();
String userGoal;
List<double> percentList = new List();

class ProgressPage extends StatefulWidget {
  @override
  _ProgressPageState createState() => new _ProgressPageState();
}

bool _visible = true;
double _contHeight = 250;
double _contWidth = 175;
bool _textColor = true;
bool _imgColor = true;
// Percent of Fundamentals Completed
double _fundPercent = 0.75;
// Converts Decimal to %
double _fundPercentText = _fundPercent * 100;

class _ProgressPageState extends State<ProgressPage> {
  Widget build(BuildContext context) {
    if (jsonData.getFileExists() == true && jsonData.getFileContent() != null) {
      exerciseList = List<Map<String, dynamic>>.from(
          jsonData.getFileContent()['exercises']);
      progressionList = List<Map<String, dynamic>>.from(
          jsonData.getFileContent()['progressions']);
      exerciseMap = List<Map<String, dynamic>>.from(
          jsonData.getFileContent()['exerciseMap']);
      userGoal = jsonData.getFileContent()['userGoal'];

      for (int i = 0; i < exerciseMap.length; i++) {
        // get current level of the progression
        int currentLevel = exerciseMap[i]['progressionLevel'] +
            exerciseMap[i]['subProgressionLevel'];
        int length;
        int maxLevel;

        // get max length of the progression
        if (progressionList[i]['movement'] == "Concentric") {
          if (userGoal == "Strength") {
            length = concentricStrength.length + 1;
            maxLevel = exerciseMap[i]['maxProgressionLevel'] * length;
          } else if (userGoal == "Hypertrophy") {
            length = concentricHypertrophy.length + 1;
            maxLevel = exerciseMap[i]['maxProgressionLevel'] * length;
          }
        } else if (progressionList[i]['movement'] == "Eccentric") {
          length = eccentric.length + 1;
          maxLevel = exerciseMap[i]['maxProgressionLevel'] * length;
        } else if (progressionList[i]['movement'] == "Isometric") {
          length = isometric.length + 1;
          maxLevel = exerciseMap[i]['maxProgressionLevel'] * length;
        }

        // calcuate percentage done of exercise
        percentList.add(((currentLevel / maxLevel)));
      }
    }

    double _width = (MediaQuery.of(context).size.width);
    return Scaffold(
      appBar: AppBar(
        title: Text('Fit With Nick'),
        elevation: 5,
        actions: [
          IconButton(
            icon: Icon(Icons.invert_colors),
            onPressed: () {
              setState(() {
                _visible = !_visible;
                _textColor = !_textColor;
                _imgColor = !_imgColor;
              });
            },
          )
        ],
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
              child: Stack(children: [
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(context).shadowColor,
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Fundamentals',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 25,
                                fontStyle: FontStyle.normal),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: _width * .8,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          'Must be completed prior to other levels.'),
                                      Text(
                                          'This is to prevent injury and ensure continual progress. '),
                                    ],
                                  ),
                                ),
                                Icon(Icons.arrow_forward_ios_outlined),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                            child: LinearPercentIndicator(
                              lineHeight: 15.0,
                              percent: _fundPercent,
                              backgroundColor: Colors.grey,
                              progressColor: kPrimaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                    left: 27 + (_fundPercent * _width * 0.8) + 15,
                    bottom: 18,
                    child: Text(
                      '$_fundPercentText%',
                      style: TextStyle(color: kPrimaryColor),
                    )),
                //Route to Fundamentals Page
                Container(
                  height: 167,
                  width: _width,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Fundamentals()),
                      );
                    },
                  ),
                ),
              ]),
            ),
            //Each "Max Progression" is displayed in the respected Difficulty
            Stack(
              children: [
                Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 15, 8, 15),
                        child: Text('Intermediate',
                            style: TextStyle(
                                fontSize: 26,
                                fontFamily: 'Montserrat',
                                fontStyle: FontStyle.normal,
                                color: _visible
                                    ? Theme.of(context).primaryColor
                                    : Colors.grey)),
                      ),
                      SizedBox(
                        height: _contHeight,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
                          children: [
                            Row(
                              children: [
                                SizedBox(width: 10),
                                ExercisePlate(percent: 0.2, visible: _visible),
                                SizedBox(width: 10),
                                ExercisePlate(percent: 0.8, visible: _visible),
                                SizedBox(width: 10),
                                ExercisePlate(percent: 0.99, visible: _visible),
                                SizedBox(width: 10),
                                ExercisePlate(percent: 0.1, visible: _visible),
                                SizedBox(width: 10),
                                ExercisePlate(percent: 0.2, visible: _visible),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 15, 8, 15),
                        child: Text('Expert',
                            style: TextStyle(
                                fontSize: 26,
                                fontFamily: 'Montserrat',
                                fontStyle: FontStyle.normal,
                                color: _visible
                                    ? Theme.of(context).primaryColor
                                    : Colors.grey)),
                      ),
                      SizedBox(
                        height: _contHeight,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
                          children: [
                            Row(
                              children: [
                                SizedBox(width: 10),
                                ExercisePlate(percent: 0.2, visible: _visible),
                                SizedBox(width: 10),
                                ExercisePlate(percent: 0.8, visible: _visible),
                                SizedBox(width: 10),
                                ExercisePlate(percent: 0.99, visible: _visible),
                                SizedBox(width: 10),
                                ExercisePlate(percent: 0.1, visible: _visible),
                                SizedBox(width: 10),
                                ExercisePlate(percent: 0.2, visible: _visible),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 15, 8, 15),
                        child: Text('Pro',
                            style: TextStyle(
                                fontSize: 26,
                                fontFamily: 'Montserrat',
                                fontStyle: FontStyle.normal,
                                color: _visible
                                    ? Theme.of(context).primaryColor
                                    : Colors.grey)),
                      ),
                      SizedBox(
                        height: _contHeight,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
                          children: [
                            Row(
                              children: [
                                SizedBox(width: 10),
                                ExercisePlate(percent: 0.2, visible: _visible),
                                SizedBox(width: 10),
                                ExercisePlate(percent: 0.8, visible: _visible),
                                SizedBox(width: 10),
                                ExercisePlate(percent: 0.99, visible: _visible),
                                SizedBox(width: 10),
                                ExercisePlate(percent: 0.1, visible: _visible),
                                SizedBox(width: 10),
                                ExercisePlate(percent: 0.2, visible: _visible),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ExercisePlate extends StatelessWidget {
  final double percent;
  final bool visible;
  const ExercisePlate({
    Key key,
    this.percent,
    this.visible,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ExerciseOverview()),
        );
      },
      child: Container(
        height: _contHeight,
        decoration: BoxDecoration(
            color: Theme.of(context).accentColor,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).shadowColor,
                spreadRadius: 2,
                blurRadius: 4,
                offset: Offset(0, 2), // changes position of shadow
              ),
            ]),
        child: Stack(children: [
          Positioned(
            bottom: 5,
            child: LinearPercentIndicator(
              width: _contWidth,
              lineHeight: 14.0,
              percent: percent,
              backgroundColor: Colors.grey,
              progressColor:
                  visible ? kPrimaryColor : Colors.black.withOpacity(0.25),
            ),
          ),
          Center(
            child: ColorFiltered(
              colorFilter: visible
                  ? ColorFilter.mode(Colors.transparent, BlendMode.color)
                  : invert,
              child: Image.asset(
                'assets/images/pullup_up.png',
                width: _contWidth,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
