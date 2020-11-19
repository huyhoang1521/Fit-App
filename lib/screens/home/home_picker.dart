import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_app/algorithms/create_workout.dart';
import 'package:fit_app/algorithms/select_exercise.dart';
import 'package:fit_app/components/general/drawer/app_drawer.dart';
import 'package:fit_app/algorithms/fetch_workout.dart';
import 'package:fit_app/providers/workout_exercises.dart';
import 'package:fit_app/providers/workout_in_progress.dart';
import 'package:fit_app/screens/workout/workout_navigator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_page.dart';

final User user = auth.currentUser;
final workoutDoc =
    FirebaseFirestore.instance.collection('Workouts').doc(user.uid);
SelectExercise selectExercise = new SelectExercise();
List<Map<String, dynamic>> warmupList = new List();
List<Map<String, dynamic>> progressionList = new List();
FetchWorkout fetchWorkout = new FetchWorkout();

class HomePicker extends StatefulWidget {
  @override
  _HomePicker createState() => new _HomePicker();
}

class _HomePicker extends State<HomePicker> {
  @override
  Widget build(BuildContext context) => FutureBuilder(
        future: fetchWorkout.fetchUserWorkout(),
        builder: (context, snapshot) {
          final workoutInProgress = Provider.of<WorkoutInProgress>(context);
          final workoutExercises = Provider.of<WorkoutExercises>(context);
          if (snapshot.hasData) {
            List<Map<String, dynamic>> exerciseList =
                selectExercise.createExerciseList(fetchWorkout.getWarmupList(),
                    fetchWorkout.getProgressionList());
            workoutExercises.setExercises(exerciseList);

            // Build the widget with data.
            if (!workoutInProgress.workoutInProgressBool) {
              return HomePage(userWorkout: snapshot.data);
            } else {
              return WorkoutNavigator(workout: snapshot.data);
            }
          } else {
            // We can show the loading view until the data comes back.
            return Scaffold(
              appBar: AppBar(
                title: Text('Fit With Nick'),
                elevation: 5,
              ),
              drawer: AppDrawer(),
              body: CircularProgressIndicator(),
            );
          }
        },
      );
}
