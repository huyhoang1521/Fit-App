import 'dart:ui';
import 'package:fit_app/algorithms/json/json_data.dart';
import 'package:fit_app/components/general/appbar/custom_appbar.dart';
import 'package:fit_app/components/general/drawer/app_drawer.dart';
import 'package:fit_app/components/themes/constants.dart';
import 'package:fit_app/models/exercise_structures.dart';
import 'package:fit_app/screens/test_screens/exercise_overview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:percent_indicator/percent_indicator.dart';

JsonData jsonData = new JsonData('workoutData.json');
List<Map<String, dynamic>> exerciseList = new List();
List<Map<String, dynamic>> progressionList = new List();
List<Map<String, dynamic>> exerciseMap = new List();
ExerciseStructures exerciseStructures = new ExerciseStructures();
List<int> percentList = new List();

class ProgressTest extends StatefulWidget {
  @override
  _ProgressTestState createState() => new _ProgressTestState();
}

bool _visible = true;
double _contHeight = 250;
double _contWidth = 175;
bool _textColor = true;
bool _imgColor = true;

const ColorFilter _invert = ColorFilter.matrix(<double>[
  0.2126,
  0.7152,
  0.0722,
  0,
  0,
  0.2126,
  0.7152,
  0.0722,
  0,
  0,
  0.2126,
  0.7152,
  0.0722,
  0,
  0,
  0,
  0,
  0,
  1,
  0,
]);

class _ProgressTestState extends State<ProgressTest> {
  Widget build(BuildContext context) {
    if (jsonData.getFileExists() == true && jsonData.getFileContent() != null) {
      exerciseList = List<Map<String, dynamic>>.from(
          jsonData.getFileContent()['exercises']);
      progressionList = List<Map<String, dynamic>>.from(
          jsonData.getFileContent()['progressions']);
      exerciseMap = List<Map<String, dynamic>>.from(
          jsonData.getFileContent()['exerciseMap']);

      for (int i = 0; i < exerciseMap.length; i++) {
        /*if (exerciseList[i]['f'] == "concentric") {
          percentList.add(
              ((progressionList[i]['level'] / exerciseList[i]['progressions']) *
                      100)
                  .floor());
        } else if (exerciseList[i]['f'] == "eccentric") {
          percentList.add(
              ((progressionList[i]['level'] / exerciseList[i]['progressions']) *
                      100)
                  .floor());
        } else {
          percentList.add(
              ((progressionList[i]['level'] / exerciseList[i]['progressions']) *
                      100)
                  .floor());
        }*/
        int length = exerciseStructures.concentricHypertrophy.length + 1;
        int maxLevel = exerciseMap[i]['maxProgressionLevel'] * length;
        int currentLevel = exerciseMap[i]['progressionLevel'] +
            exerciseMap[i]['subProgressionLevel'];
        percentList.add(((currentLevel / maxLevel) * 100).floor());
      }
    }

    double _width = (MediaQuery.of(context).size.width);
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 15, 8, 15),
              child: Text('Fundamentals',
                  style: Theme.of(context).textTheme.headline2),
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
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ExerciseOverview()),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Theme.of(context).accentColor,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                  color: Theme.of(context).shadowColor,
                                  spreadRadius: 2,
                                  blurRadius: 4,
                                  offset: Offset(
                                      0, 2), // changes position of shadow
                                ),
                              ]),
                          child: Stack(children: [
                            Positioned(
                              bottom: 5,
                              child: LinearPercentIndicator(
                                width: _contWidth,
                                lineHeight: 14.0,
                                percent: 0.5,
                                backgroundColor: Colors.grey,
                                progressColor: kPrimaryColor,
                              ),
                            ),
                            Center(
                              child: Image.asset(
                                'assets/images/pullup_up.png',
                                width: _contWidth,
                              ),
                            ),
                          ]),
                        ),
                      ),
                      SizedBox(width: 10),
                      ExercisePlate(percent: 0.8, visible: true),
                      SizedBox(width: 10),
                      ExercisePlate(percent: 0.99, visible: true),
                      SizedBox(width: 10),
                      RaisedButton(
                        onPressed: () {
                          setState(() {
                            _visible = !_visible;
                            _textColor = !_textColor;
                            _imgColor = !_imgColor;
                          });
                        },
                      ),
                      SizedBox(width: 10),
                      ExercisePlate(percent: 0.2, visible: true),
                    ],
                  ),
                ],
              ),
            ),
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
                // Positioned(
                //   bottom: 0,
                //   left: 0,
                //   child: BackdropFilter(
                //     filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                //     child: Container(
                //       height: 100,
                //       width: 100,
                //       color: Colors.black.withOpacity(0),
                //     ),
                //   ),
                // ),
                Positioned(
                  top: 15,
                  // left: 0,
                  right: 0,
                  bottom: 0,
                  child: AnimatedContainer(
                    width: _visible ? 0 : _width,
                    duration: Duration(milliseconds: 0),
                    child: Container(
                      color: Colors.grey.withOpacity(.1),
                      child: Center(
                          child: Text(
                        'Fundamentals Required',
                        style: Theme.of(context).textTheme.headline1,
                      )),
                    ),
                  ),
                ),
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
    return Container(
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
          child:
              // Text(
              //   '$percent %',
              //   style: TextStyle(
              //       color:
              //           visible ? kPrimaryLightColor : Colors.grey.withOpacity(.5)),
              // ),
              LinearPercentIndicator(
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
                : _invert,
            child: Image.asset(
              'assets/images/pullup_up.png',
              width: _contWidth,
            ),
          ),
        ),
      ]),
    );
  }
}
//Todo Change color of man/Text for locked Icons
//i.e. grey them out and have a locked symbol next to them
//Todo Clean up code
