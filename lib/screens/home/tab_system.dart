import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_app/models/user_workout.dart';
import 'workout_overview.dart';
import 'package:flutter/material.dart';
import '../../algorithms/create_workout.dart';

final User user = auth.currentUser;
final workoutDoc =
    FirebaseFirestore.instance.collection('Workouts').doc(user.uid);

class TabSystem extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TabSystemState();
}

class _TabSystemState extends State<TabSystem> {
  @override
  void initState() {
    super.initState();

    /*Future.delayed(Duration.zero, () {
      getUserWorkout();
    });*/
  }

  @override
  Widget build(BuildContext context) => FutureBuilder(
        future: fetchUserWorkout(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            debugPrint('Step 3, build widget');
            // Build the widget with data.
            return WorkoutOverview(workout: snapshot.data);
          } else {
            // We can show the loading view until the data comes back.
            debugPrint('Step 1, build loading widget');
            return CircularProgressIndicator();
          }
        },
      );

  Future<UserWorkout> fetchUserWorkout() =>
      Future.delayed(Duration(seconds: 1), () async {
        debugPrint('Step 2, fetch data');
        UserWorkout workout;
        await workoutDoc.get().then((DocumentSnapshot userData) {
          if (userData.exists) {
            List<Map<String, int>> exerciseList = new List();
            List<int> warmupList = new List.from(userData.data()['warmup']);

            List<Map<String, int>>.from(
                userData.data()["exercises"].map((item) {
              exerciseList.add({
                "exerciseID": item["exerciseID"],
                "progressionID": item["progressionID"]
              });
            }));
            workout = new UserWorkout(
              userData.data()['uid'],
              userData.data()['length'],
              userData.data()['goal'],
              userData.data()['restTime'],
              userData.data()['coolDown'],
              exerciseList,
              warmupList,
            );
          }
        });
        return workout;
      });
}
