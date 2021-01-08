import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fit_app/algorithms/workout/create_workout.dart';
import 'package:fit_app/algorithms/json/json_data.dart';
import 'package:fit_app/components/general/buttons/rounded_button.dart';
import 'package:fit_app/components/general/drawer/app_drawer.dart';
import 'package:fit_app/models/user_workout.dart';
import 'package:fit_app/providers/workout_file_data.dart';
import 'package:fit_app/providers/workout_exercises.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WorkoutSetter extends StatefulWidget {
  @override
  _HomePicker createState() => new _HomePicker();
}

class _HomePicker extends State<WorkoutSetter> {
  JsonData jsonData = new JsonData('workoutData.json');
  DocumentSnapshot userDoc;

  Future<UserWorkout> getUserWorkout(BuildContext context) =>
      Future.delayed(Duration(seconds: 1), () async {
        UserWorkout userWorkout;
        await FirebaseFirestore.instance
            .collection('Workouts')
            .doc(user.uid)
            .get()
            .then((document) => {
                  if (document.exists)
                    {
                      userWorkout = new UserWorkout(
                          document['uid'],
                          document['goal'],
                          document['length'],
                          document['restTime'],
                          document['coolDown'],
                          List.from(document['exercises']),
                          List.from(document['progressions']),
                          List.from(document['warmup']))
                    }
                });

        return userWorkout;
      });

  @override
  Widget build(BuildContext context) => FutureBuilder(
        // Get the warmup and progression lists from their respective collections
        future: getUserWorkout(context),
        builder: (context, snapshot) {
          final workoutFileData = Provider.of<WorkoutFileData>(context);
          final workoutExercises =
              Provider.of<WorkoutExercises>(context, listen: false);
          if (snapshot.hasData) {
            jsonData.createFile(snapshot.data.toJson(), "workoutData.json");
            jsonData.writeToFile(snapshot.data.toJson(), "workoutData.json");
            return Scaffold(
                appBar: AppBar(
                  title: Text('Fit With Nick'),
                  elevation: 5,
                ),
                drawer: AppDrawer(),
                body: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Workout Created"),
                    RoundedButton(
                      text: "Finish",
                      press: () {
                        workoutExercises.setExerciseList(
                            List<Map<String, dynamic>>.from(
                                snapshot.data.exercises));
                        workoutExercises.setProgressionList(
                            List<Map<String, dynamic>>.from(
                                snapshot.data.progressions));
                        workoutExercises.setWarmupList(
                            List<Map<String, dynamic>>.from(
                                snapshot.data.warmup));
                        workoutFileData.setDataWritten(true);
                      },
                    ),
                  ],
                )));
            // Build the widget with data.

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
