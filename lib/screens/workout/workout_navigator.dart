import 'package:fit_app/models/user_workout.dart';
import 'package:fit_app/screens/workout/warmup.dart';
import 'package:flutter/material.dart';

bool warmup = true;
bool push = false;
bool pull = false;
bool coolDown = false;

class WorkoutNavigator extends StatefulWidget {
  final UserWorkout workout;

  const WorkoutNavigator({Key key, this.workout}) : super(key: key);

  @override
  _WorkoutNavigatorState createState() =>
      new _WorkoutNavigatorState(workout: this.workout);
}

class _WorkoutNavigatorState extends State<WorkoutNavigator> {
  UserWorkout workout;
  _WorkoutNavigatorState({this.workout});

  @override
  Widget build(BuildContext context) {
    if (warmup) {
      return WarmUp(workout: workout);
    } else if (pull) {
      return WarmUp(workout: workout);
    } else if (push) {
      return WarmUp(workout: workout);
    } else if (coolDown) {
      return WarmUp(workout: workout);
    } else {
      Navigator.of(context).popUntil((route) => route.isFirst);
    }
  }
}
