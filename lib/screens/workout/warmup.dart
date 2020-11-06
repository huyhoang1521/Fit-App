import 'package:fit_app/models/user_workout.dart';
import 'package:fit_app/components/general/appbar/custom_appbar.dart';
import 'package:fit_app/screens/workout/rest.dart';
import 'package:fit_app/components/workout/buttons.dart';
import 'package:flutter/material.dart';

IconData pause = Icons.pause_circle_filled;
IconData play = Icons.play_circle_filled;
IconData button = play;
bool pressed = false;
int count = 0;

class WarmUp extends StatefulWidget {
  final UserWorkout workout;

  const WarmUp({Key key, this.workout}) : super(key: key);

  @override
  _WarmUpState createState() => new _WarmUpState(workout: this.workout);
}

class _WarmUpState extends State<WarmUp> {
  UserWorkout workout;
  _WarmUpState({this.workout});

  @override
  Widget build(BuildContext context) {
    double width = (MediaQuery.of(context).size.width);
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
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
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text('Pull Ups',
                        style: Theme.of(context).textTheme.headline2),
                  ),
                )),
          ),
          Image.asset(
            'assets/images/pullup_up.png',
            width: width * .75,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
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
                      padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Clusters:',
                              style: Theme.of(context).textTheme.headline2),
                          Text('2',
                              style: Theme.of(context).textTheme.headline2),
                        ],
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                  child: Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).accentColor,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                              color: Theme.of(context).shadowColor,
                              spreadRadius: 2,
                              blurRadius: 4,
                              offset:
                                  Offset(0, 2), // changes position of shadow
                            ),
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Set:',
                                style: Theme.of(context).textTheme.headline2),
                            Text('2/3',
                                style: Theme.of(context).textTheme.headline2),
                          ],
                        ),
                      )),
                ),
              ],
            ),
          ),
          Buttons(
            enabled: pressed,
            rWPressed: () {},
            fFPressed: () {
              if (count < workout.warmup.length) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RestPage()),
                  //MaterialPageRoute(builder: (context) => StartWorkout()),
                );
              }
            },
            pPPressed: () {
              setState(() {
                pressed = !pressed;
              });
            },
          ),
        ],
      ),
    );
  }
}
