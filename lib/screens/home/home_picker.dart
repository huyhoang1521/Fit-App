import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fit_app/algorithms/workout/create_workout.dart';
import 'package:fit_app/algorithms/json/json_data.dart';
import 'package:fit_app/components/general/drawer/app_drawer.dart';
import 'package:fit_app/models/user_workout.dart';
import 'package:fit_app/providers/workout_exercises.dart';
import 'package:fit_app/providers/workout_in_progress.dart';
import 'package:fit_app/screens/workout/workout_navigator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_page.dart';

List<Map<String, dynamic>> completeList = new List();

class HomePicker extends StatefulWidget {
  @override
  _HomePicker createState() => new _HomePicker();
}

class _HomePicker extends State<HomePicker> {
  JsonData jsonData = new JsonData('workoutData.json');
  DocumentSnapshot userDoc;

  @override
  Widget build(BuildContext context) => FutureBuilder(
        // Get the warmup and progression lists from their respective collections
        future: FirebaseFirestore.instance
            .collection('Workouts')
            .doc(user.uid)
            .get()
            .then((document) => {
                  if (document.exists) {userDoc = document}
                }),
        builder: (context, snapshot) {
          final workoutInProgress = Provider.of<WorkoutInProgress>(context);
          final workoutExercises =
              Provider.of<WorkoutExercises>(context, listen: false);
          if (snapshot.hasData && userDoc != null) {
            List<Map<String, dynamic>> exerciseList =
                new List.from(userDoc['exercises']);
            List<Map<String, dynamic>> progressionList =
                new List.from(userDoc['progressions']);
            List<Map<String, dynamic>> warmupList =
                new List.from(userDoc['warmup']);

            UserWorkout userWorkout = new UserWorkout(
                userDoc['uid'],
                userDoc['goal'],
                userDoc['length'],
                userDoc['restTime'],
                userDoc['coolDown'],
                exerciseList,
                progressionList,
                warmupList);

            completeList = userWorkout.warmup + userWorkout.progressions;

            workoutExercises.setExercises(completeList);
            jsonData.createFile(userWorkout.toJson(), "workoutData.json");
            jsonData.writeToFile(userWorkout.toJson(), "workoutData.json");

            // Build the widget with data.
            if (!workoutInProgress.workoutInProgressBool) {
              return HomePage();
            } else {
              return WorkoutNavigator();
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
