import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fit_app/algorithms/json/json_data.dart';
import 'package:fit_app/algorithms/workout/create_workout.dart';
import 'package:fit_app/models/fit_user.dart';
import 'package:fit_app/models/jsonWorkout.dart';
import 'package:fit_app/providers/workout_exercises.dart';
import 'package:fit_app/providers/workout_file_data.dart';
import 'package:flutter/material.dart';
import 'package:fit_app/components/general/buttons/rounded_button.dart';
import 'package:fit_app/components/general/appbar/custom_appbar.dart';
import 'package:provider/provider.dart';

class Finished extends StatefulWidget {
  final FitUser fitUser;

  const Finished({Key key, this.fitUser}) : super(key: key);

  @override
  _FinishedState createState() => new _FinishedState(fitUser: this.fitUser);
}

class _FinishedState extends State<Finished> {
  final FitUser fitUser;
  _FinishedState({this.fitUser});

  JsonData jsonData = new JsonData('workoutData.json');

  Future<JsonWorkout> createWorkout() =>
      Future.delayed(Duration(seconds: 1), () async {
        await FirebaseFirestore.instance
            .collection("Users")
            .doc(uid)
            .set(fitUser.toJson());

        JsonWorkout jsonWorkout = await CreateWorkout().createWorkout(fitUser);
        await Future.delayed(Duration(seconds: 1));

        return jsonWorkout;
      });

  @override
  Widget build(BuildContext context) => FutureBuilder(
      // Get the warmup and progression lists from their respective collections
      future: createWorkout(),
      builder: (context, snapshot) {
        if (snapshot.hasData &&
            snapshot.connectionState == ConnectionState.done) {
          WorkoutFileData workoutFileData =
              Provider.of<WorkoutFileData>(context, listen: false);
          WorkoutExercises workoutExercises =
              Provider.of<WorkoutExercises>(context, listen: false);

          jsonData.createFile(snapshot.data.toJson(), "workoutData.json");
          jsonData.writeToFile(snapshot.data.toJson(), "workoutData.json");

          return Scaffold(
            appBar: CustomAppBar(),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Finish"),
                  RoundedButton(
                    text: "Finish",
                    press: () async {
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
                      await Future.delayed(Duration(seconds: 1));
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    },
                  ),
                ],
              ),
            ),
          );
        } else {
          // We can show the loading view until the data comes back.
          return Scaffold(
            appBar: AppBar(
              title: Text('Fit With Nick'),
              elevation: 5,
            ),
            body: CircularProgressIndicator(),
          );
        }
      });
}
