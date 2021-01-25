import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fit_app/models/fit_user.dart';
import 'package:fit_app/providers/provider_widget.dart';
//import 'package:fit_app/providers/workout_exercises.dart';
//import 'package:fit_app/providers/workout_file_data.dart';
import 'package:flutter/material.dart';
import 'package:fit_app/components/general/buttons/rounded_button.dart';
import 'package:fit_app/components/general/appbar/custom_appbar.dart';

class Finished extends StatefulWidget {
  final FitUser fitUser;

  const Finished({Key key, this.fitUser}) : super(key: key);

  @override
  _FinishedState createState() => new _FinishedState(fitUser: this.fitUser);
}

class _FinishedState extends State<Finished> {
  final FitUser fitUser;
  _FinishedState({this.fitUser});

  Future<void> setUserData() => Future.delayed(Duration(seconds: 1), () async {
        // save user data to firebase
        print(fitUser.progressions[0][0]);
        final uid = await ProviderWidget.of(context).auth.getCurrentUID();
        final db = FirebaseFirestore.instance;
        await Future.delayed(Duration(seconds: 1));
        await db.collection("Users").doc(uid).set(fitUser.toJson());
      });

  /*Future<void> createWorkout() =>
      Future.delayed(Duration(seconds: 6), () async {
        UserWorkout userWorkout = await CreateWorkout().createWorkout(fitUser);
        Future.delayed(Duration(seconds: 3), () async {
          JsonData jsonData = new JsonData('workoutData.json');
          jsonData.createFile(userWorkout.toJson(), "workoutData.json");
          jsonData.writeToFile(userWorkout.toJson(), "workoutData.json");
          WorkoutFileData workoutFileData;
          WorkoutExercises workoutExercises;
          workoutFileData =
              Provider.of<WorkoutFileData>(context, listen: false);
          workoutExercises =
              Provider.of<WorkoutExercises>(context, listen: false);
          workoutExercises.setExerciseList(
              List<Map<String, dynamic>>.from(userWorkout.exercises));
          workoutExercises.setProgressionList(
              List<Map<String, dynamic>>.from(userWorkout.progressions));
          workoutExercises.setWarmupList(
              List<Map<String, dynamic>>.from(userWorkout.warmup));
          workoutFileData.setDataWritten(true);
        });
      });*/

  @override
  Widget build(BuildContext context) => FutureBuilder(
      // Get the warmup and progression lists from their respective collections
      future: setUserData(),

      /*Future.wait([
        setUserData()
        //createWorkout(),
      ]),*/
      builder: (context, snapshot) {
        //if (snapshot.hasData) {
        /*return Scaffold(
            appBar: CustomAppBar(),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Finish"),
                  RoundedButton(
                    text: "Finish",
                    press: () {
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    },
                  ),
                ],
              ),
            ),
          );*/
        //print("future completed");
        //}
        if (snapshot.hasData &&
            snapshot.connectionState != ConnectionState.done) {
          print("done");
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
                    press: () {
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
