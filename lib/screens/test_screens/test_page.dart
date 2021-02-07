import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_app/algorithms/workout/create_workout.dart';
import 'package:fit_app/components/general/buttons/rounded_button.dart';
import 'package:fit_app/models/user_warmup.dart';
import 'package:fit_app/models/user_workout.dart';
import 'package:fit_app/components/general/appbar/custom_appbar.dart';
import 'package:fit_app/screens/test_screens/progress_test.dart';
import 'package:fit_app/screens/workout/cool_down.dart';
import 'package:fit_app/screens/workout/summary.dart';
import 'package:flutter/material.dart';
// import 'package:fit_app/screens/workout/complete.dart';
// import 'package:fit_app/screens/test/eccentric.dart';
// import 'package:fit_app/screens/test/isometric.dart';
// import 'package:fit_app/screens/test/start_workout.dart';
// import 'package:fit_app/screens/workout/exercise_page.dart';
// import 'concentric.dart';
import 'package:fit_app/screens/test_screens/start_workout.dart';
//import 'package:fit_app/screens/workout/exercise_page.dart';

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
                new List.from(userData.data()['warmup']);
            List<Map<String, dynamic>> exerciseList =
                new List.from(userData.data()['exercises']);

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
                    // Padding(
                    //   padding: EdgeInsets.all(2.0),
                    //   child: RoundedButton(
                    //     color: Theme.of(context).buttonColor,
                    //     //textColor: Colors.white,
                    //     press: () {
                    //       Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (context) => StartWorkout()),
                    //       );
                    //     },
                    //     text: 'Start Workout (Firebase)',
                    //     //onLongPress: ,
                    //   ),
                    // ),
                    // Padding(
                    //   padding: EdgeInsets.all(2.0),
                    //   child: RoundedButton(
                    //     color: Theme.of(context).buttonColor,
                    //     //textColor: Colors.white,
                    //     press: () {
                    //       /*Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (context) => WorkoutWarmup()),
                    //         //MaterialPageRoute(builder: (context) => StartWorkout()),
                    //       );*/
                    //     },
                    //     text: 'Warm Up',
                    //     //onLongPress: ,
                    //   ),
                    // ),
                    // Padding(
                    //   padding: EdgeInsets.all(2.0),
                    //   child: RoundedButton(
                    //     color: Theme.of(context).buttonColor,
                    //     //textColor: Colors.white,
                    //     press: () {
                    //       Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (context) =>
                    //                 Concentric(workout: workout)),
                    //         //MaterialPageRoute(builder: (context) => StartWorkout()),
                    //       );
                    //     },
                    //     text: 'Concentric',
                    //     //onLongPress: ,
                    //   ),
                    // ),
                    // Padding(
                    //   padding: EdgeInsets.all(2.0),
                    //   child: RoundedButton(
                    //     color: Theme.of(context).buttonColor,
                    //     //textColor: Colors.white,
                    //     press: () {
                    //       Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (context) =>
                    //                 Eccentric(workout: workout)),
                    //         //MaterialPageRoute(builder: (context) => StartWorkout()),
                    //       );
                    //     },
                    //     text: 'Eccentric',
                    //     //onLongPress: ,
                    //   ),
                    // ),
                    // Padding(
                    //   padding: EdgeInsets.all(2.0),
                    //   child: RoundedButton(
                    //     color: Theme.of(context).buttonColor,
                    //     //textColor: Colors.white,
                    //     press: () {
                    //       Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (context) =>
                    //                 Isometric(workout: workout)),
                    //         //MaterialPageRoute(builder: (context) => StartWorkout()),
                    //       );
                    //     },
                    //     text: 'Isometric',
                    //     //onLongPress: ,
                    //   ),
                    // ),
                    // Padding(
                    //   padding: EdgeInsets.all(2.0),
                    //   child: RoundedButton(
                    //     color: Theme.of(context).buttonColor,
                    //     //textColor: Colors.white,
                    //     press: () {
                    //       Navigator.push(
                    //         context,
                    //         MaterialPageRoute(builder: (context) => Complete()),
                    //         //MaterialPageRoute(builder: (context) => StartWorkout()),
                    //       );
                    //     },
                    //     text: 'Complete Page',
                    //     //onLongPress: ,
                    //   ),
                    // ),
                    Padding(
                      padding: EdgeInsets.all(2.0),
                      child: RoundedButton(
                        color: Theme.of(context).buttonColor,

                        //textColor: Colors.white,
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
                        color: Theme.of(context).buttonColor,
                        //textColor: Colors.white,
                        press: () {
                          /*Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WorkoutWarmup()),
                            //MaterialPageRoute(builder: (context) => StartWorkout()),
                          );*/
                        },
                        text: 'Warm Up',
                        //onLongPress: ,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(2.0),
                      child: RoundedButton(
                        color: Theme.of(context).buttonColor,
                        //textColor: Colors.white,
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CoolDown()),
                            //MaterialPageRoute(builder: (context) => StartWorkout()),
                          );
                        },
                        text: 'Cool Down',
                        //onLongPress: ,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(2.0),
                      child: RoundedButton(
                        color: Theme.of(context).buttonColor,
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProgressTest()),
                            //MaterialPageRoute(builder: (context) => StartWorkout()),
                          );
                        },
                        text: 'Progress Widget',
                        //onLongPress: ,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(2.0),
                      child: RoundedButton(
                        color: Theme.of(context).buttonColor,
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Summary()),
                            //MaterialPageRoute(builder: (context) => StartWorkout()),
                          );
                        },
                        text: 'Summary Page',
                        //onLongPress: ,
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
