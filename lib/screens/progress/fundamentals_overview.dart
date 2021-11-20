import 'package:fit_app/components/general/appbar/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:fit_app/components/themes/constants.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:fit_app/components/workout/exercise_title.dart';
import 'package:fit_app/components/progress/exercise_info.dart';

class FundamentalsOverview extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FundamentalsOverviewState();
  }
}

class _FundamentalsOverviewState extends State<FundamentalsOverview> {
  @override
  Widget build(BuildContext context) {
    double width = (MediaQuery.of(context).size.width);
    return Scaffold(
      appBar: CustomAppBar(),
      body: ListView(
        children: [
          ExerciseTitle(
            name: 'Fundamental Name',
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
                    onPressed: () => _onButtonPressed(),
                  ),
                ),
              ],
            ),
          ),
          //Skill Specific exercises
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
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
                        'Progress',
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Wall Headstand',
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
                          'Wall Handstand',
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
                          'Wall Handstand + Kick-Up',
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

  String _descr =
      "Start in plank postion with arms straight and hands shoulder width apart and rings turned out with palms facing forward. Slowly lower body down by bending one arm while keeping the other arm as straight as possible. Lower until chest reaches hands and then push explosively until in starting position. Repeat and switch roles of arms. Keep body as straight as possible for duration of exercise by squezing glutes and keeping core engaged. ";
  // function that calls Exercise info
  void _onButtonPressed() {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        )),
        context: context,
        builder: (context) {
          return Container(
            child: ExerciseInfo(
              tier: 'Fundamentals',
              exerciseType: 'Push',
              movementType: 'Concentric',
              position: 'vertical',
              description: _descr,
            ),
          );
        });
  }
}
