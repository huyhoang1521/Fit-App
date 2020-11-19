import 'package:fit_app/models/user_workout.dart';
import 'package:fit_app/providers/workout_exercises.dart';
import 'package:fit_app/screens/workout/cool_down.dart';
import 'package:fit_app/screens/workout/exercise_page.dart';
import 'package:fit_app/providers/exercise_counter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    final exerciseCounter = Provider.of<ExerciseCounter>(context);
    final exerciseList = Provider.of<WorkoutExercises>(context);
    // Build the widget with data.
    if (exerciseCounter.exerciseCount < exerciseList.exercises.length) {
      return new ExercisePage();
    } else {
      return CoolDown();
    }
  }
}
