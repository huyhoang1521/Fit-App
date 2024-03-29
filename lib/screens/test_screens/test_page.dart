import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_app/algorithms/workout/create_workout.dart';
import 'package:fit_app/components/general/buttons/rounded_button.dart';
import 'package:fit_app/models/user_warmup.dart';
import 'package:fit_app/models/user_workout.dart';
import 'package:fit_app/components/general/appbar/custom_appbar.dart';
import 'package:fit_app/screens/form/days.dart';
import 'package:fit_app/screens/form/experience.dart';
import 'package:fit_app/screens/workout/max_test.dart';
import 'package:flutter/material.dart';
import 'package:fit_app/screens/test_screens/start_workout.dart';

UserWorkout workout;
final User user = auth.currentUser;
final workoutDoc =
    FirebaseFirestore.instance.collection('Workouts').doc(user.uid);

class TestPage extends StatefulWidget {
  TestPage() : super();
  @override
  _TestPageState createState() => _TestPageState();
}

@override
State<StatefulWidget> createState() {
  return _TestPageState();
}

class _TestPageState extends State<TestPage> {
  UserWarmup userWarmup;

  Future<UserWorkout> fetchUserWorkout() =>
      Future.delayed(Duration(seconds: 1), () async {
        debugPrint('Step 2, fetch data');
        await workoutDoc.get().then((DocumentSnapshot userData) {
          if (userData.exists) {
            List<Map<String, dynamic>> warmupList =
                new List.from(userData.get('warmup'));
            List<Map<String, dynamic>> exerciseList =
                new List.from(userData.get('exercises'));

            workout = new UserWorkout(
              userData.get('uid'),
              userData.get('length'),
              userData.get('goal'),
              userData.get('restTime'),
              userData.get('coolDown'),
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
            // Build the widget with data.
            return Scaffold(
              appBar: CustomAppBar(),
              body: Center(
                child: ListView(
                  children: [
                    Text(
                      'Exercise Test Pages',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    //ToDo Delete Test pages not needed

                    Padding(
                      padding: EdgeInsets.all(2.0),
                      child: RoundedButton(
                        //color: Theme.of(context).buttonColor,
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StartWorkout()),
                          );
                        },
                        text: 'Start Workout (Firebase)',
                        //onLongPress: ,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(2.0),
                      child: RoundedButton(
                        //color: Theme.of(context).buttonColor,
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Days()),
                          );
                        },
                        text: 'Days',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(2.0),
                      child: RoundedButton(
                        //color: Theme.of(context).buttonColor,
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Experience()),
                          );
                        },
                        text: 'Experience',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(2.0),
                      child: RoundedButton(
                        //color: Theme.of(context).buttonColor,
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MaxTest()),
                          );
                        },
                        text: 'Max Test',
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Scaffold(
              appBar: CustomAppBar(),
              body: Center(
                child: ListView(
                  children: [
                    Text(
                      'Exercise Test Pages',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ],
                ),
              ),
            );
          }
        },
      );
}
