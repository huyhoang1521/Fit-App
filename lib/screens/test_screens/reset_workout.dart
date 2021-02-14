import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_app/algorithms/json/json_data.dart';
import 'package:fit_app/models/fit_user.dart';
import 'package:fit_app/screens/form/finished.dart';
import 'package:flutter/material.dart';
import 'package:fit_app/components/general/buttons/rounded_button.dart';
import 'package:fit_app/components/general/appbar/custom_appbar.dart';

final User user = auth.currentUser;
final userDoc = FirebaseFirestore.instance.collection('Users').doc(user.uid);
final db = FirebaseFirestore.instance;
final auth = FirebaseAuth.instance;
final uid = user.uid;

class ResetWorkout extends StatefulWidget {
  @override
  _ResetWorkoutState createState() => new _ResetWorkoutState();
}

JsonData jsonData = new JsonData('workoutData.json');

Future<FitUser> getUserInfo() => Future.delayed(Duration(seconds: 1), () async {
      FitUser fitUser;
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(uid)
          .get()
          .then((collection) {
        fitUser = new FitUser(
          collection.data()['firstName'],
          collection.data()['lastName'],
          collection.data()['email'],
          collection.data()['dob'],
          collection.data()['weight'],
          collection.data()['goal'],
          collection.data()['length'],
          collection.data()['equipment'],
          collection.data()['primaryPushGoal'],
          collection.data()['primaryPullGoal'],
          collection.data()['height'],
        );
      });

      return fitUser;
    });

class _ResetWorkoutState extends State<ResetWorkout> {
  @override
  Widget build(BuildContext context) => FutureBuilder(
      future: getUserInfo(),
      builder: (context, snapshot) {
        if (snapshot.hasData &&
            snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            appBar: CustomAppBar(),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Reset Workout"),
                  RoundedButton(
                    text: "Reset Workout",
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Finished(fitUser: snapshot.data)),
                      );
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
