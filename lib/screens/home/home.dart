import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_app/algorithms/create_workout.dart';
import 'package:fit_app/components/general/buttons/rounded_button.dart';
import 'package:fit_app/models/user_workout.dart';
import 'package:fit_app/components/general/drawer/app_drawer.dart';
import 'package:fit_app/screens/home/workout_summary.dart';
import 'package:fit_app/screens/workout/workout_navigator.dart';
import 'package:flutter/material.dart';
import 'package:fit_app/services/auth_service.dart';
import 'package:fit_app/components/general/provider/provider_widget.dart';

UserWorkout workout;
final User user = auth.currentUser;
final workoutDoc =
    FirebaseFirestore.instance.collection('Workouts').doc(user.uid);

class Home extends StatefulWidget {
  @override
  _WorkoutOverview createState() => new _WorkoutOverview();
}

class _WorkoutOverview extends State<Home> {
  Future<UserWorkout> fetchUserWorkout() =>
      Future.delayed(Duration(seconds: 1), () async {
        debugPrint('Step 2, fetch data');
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

  @override
  Widget build(BuildContext context) => FutureBuilder(
        future: fetchUserWorkout(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            debugPrint('Step 3, build widget');
            // Build the widget with data.
            return Scaffold(
              appBar: AppBar(
                title: Text('Fit With Nick'),
                elevation: 5,
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.undo),
                    color: Theme.of(context).iconTheme.color,
                    onPressed: () async {
                      try {
                        AuthService auth = ProviderWidget.of(context).auth;
                        await auth.signOut();
                        print("Signed Out!");
                      } catch (e) {
                        print(e);
                      }
                    },
                  )
                ],
              ),
              drawer: AppDrawer(),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                          child: WorkoutSummary(workout: workout),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: new RoundedButton(
                        color: Theme.of(context).buttonColor,
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WorkoutNavigator()),
                            //MaterialPageRoute(builder: (context) => StartWorkout()),
                          );
                        },
                        text: 'Start Workout',
                        //onLongPress: ,
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            // We can show the loading view until the data comes back.
            debugPrint('Step 1, build loading widget');
            return CircularProgressIndicator();
          }
        },
      );
}
