import 'package:fit_app/providers/workout_exercises.dart';
import 'package:fit_app/screens/workout/cool_down.dart';
import 'package:fit_app/screens/workout/exercise_page.dart';
import 'package:fit_app/providers/exercise_counter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WorkoutNavigator extends StatefulWidget {
  @override
  _WorkoutNavigatorState createState() => new _WorkoutNavigatorState();
}

class _WorkoutNavigatorState extends State<WorkoutNavigator> {
  _WorkoutNavigatorState();

  @override
  Widget build(BuildContext context) {
    final exerciseCounter = Provider.of<ExerciseCounter>(context);
    final workoutExercises =
        Provider.of<WorkoutExercises>(context, listen: false);
    // Build the widget with data.
    if (exerciseCounter.exerciseCount < workoutExercises.exercises.length) {
      return new ExercisePage();
    } else {
      return CoolDown();
    }
  }
}
