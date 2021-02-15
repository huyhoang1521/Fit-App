import 'package:fit_app/components/general/appbar/custom_appbar.dart';
import 'package:fit_app/components/themes/constants.dart';
import 'package:fit_app/components/workout/exercise_title.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ExerciseOverview extends StatefulWidget {
  @override
  _ExerciseOverviewState createState() => new _ExerciseOverviewState();
}

class _ExerciseOverviewState extends State<ExerciseOverview> {
  @override
  Widget build(BuildContext context) {
    double width = (MediaQuery.of(context).size.width);
    return Scaffold(
      appBar: CustomAppBar(),
      body: ListView(
        children: [
          ExerciseTitle(
            name: 'Exercise Name',
          ),
          FittedBox(
            fit: BoxFit.fill,
            child: Stack(
              children: [
                Container(
                  width: width,
                  child: Image.asset(
                    'assets/images/pullup_up.png',
                  ),
                ),
                Center(
                  child: CircularPercentIndicator(
                    radius: width,
                    percent: .35,
                    progressColor: colorCustom,
                    lineWidth: 15,
                    backgroundColor: Colors.grey.withOpacity(.8),
                  ),
                ),
                Positioned(
                  right: width * 0.05,
                  child: IconButton(
                    icon: Icon(Icons.info_outlined),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            _descriptionDialog(context),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).shadowColor,
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: Offset(0, 2), // changes position of shadow
                    ),
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                //Listed below will be the progressions for the exercise
                //EX for Pull Up it goes Jump pull-ups -> Pull Up eccentrics -> bar Pull Up
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pre-Requisites',
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Jump Pull Ups',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      LinearPercentIndicator(
                        percent: 1.0,
                        progressColor: colorCustom,
                        lineHeight: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Pull Up Eccentrics',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      LinearPercentIndicator(
                        percent: 1,
                        progressColor: colorCustom,
                        lineHeight: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Bar Pull Ups',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      LinearPercentIndicator(
                        percent: 1,
                        progressColor: colorCustom,
                        lineHeight: 15,
                      ),
                      SizedBox(height: 15),
                    ]),
              ),
            ),
          ),
          //Skill Specific exercises
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).shadowColor,
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: Offset(0, 2), // changes position of shadow
                    ),
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                //Listed below will be the progressions for the exercise
                //EX for Pull Up it goes Jump pull-ups -> Pull Up eccentrics -> bar Pull Up
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Skill Specific',
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Weighted Pull Ups',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      LinearPercentIndicator(
                        percent: 1.0,
                        progressColor: colorCustom,
                        lineHeight: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'One Arm Pull Up Eccentrics',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      LinearPercentIndicator(
                        percent: 0.5,
                        progressColor: colorCustom,
                        lineHeight: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'One Arm Pull Up',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      LinearPercentIndicator(
                        percent: 0,
                        progressColor: colorCustom,
                        lineHeight: 15,
                      ),
                      SizedBox(height: 15),
                    ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _descriptionDialog(BuildContext context) {
  return new AlertDialog(
    title: const Text('Exercise Description'),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum maximus libero id odio tincidunt, ut maximus nisi congue. Donec pellentesque elit ex. Ut pulvinar massa ut risus suscipit, eget scelerisque lorem vulputate. Integer eget quam at tellus vulputate varius eget in mi. Nam nec enim maximus, pharetra orci non, ullamcorper nunc. Suspendisse at eleifend enim. Ut vitae augue eleifend, gravida augue sed, dignissim leo. Praesent eget malesuada leo."),
      ],
    ),
    actions: <Widget>[
      new FlatButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        textColor: Theme.of(context).primaryColor,
        child: const Text('Close'),
      ),
    ],
  );
}
