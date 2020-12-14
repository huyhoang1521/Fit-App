import 'package:fit_app/algorithms/workout/create_workout.dart';
import 'package:fit_app/components/themes/constants.dart';
import 'package:flutter/material.dart';
import '../../components/general/buttons/rounded_preferred_button.dart';
import '../../components/general/buttons/rounded_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../providers/provider_widget.dart';
import '../../models/fit_user.dart';

class PreferredExercises extends StatefulWidget {
  final FitUser user;

  const PreferredExercises({Key key, this.user}) : super(key: key);

  @override
  _PreferredExercises createState() => new _PreferredExercises(user: this.user);
}

class _PreferredExercises extends State<PreferredExercises> {
  final FitUser user;
  _PreferredExercises({this.user});

  String _primaryPushGoal;
  String _primaryPullGoal;
  final db = FirebaseFirestore.instance;

  bool exercise1 = false;
  bool exercise2 = false;
  bool exercise3 = false;
  bool exercise4 = false;
  bool exercise5 = false;
  bool exercise6 = false;
  bool creatingWorkout = false;

  Future<void> callWorkout() => Future.delayed(Duration(seconds: 1), () async {
        CreateWorkout().createWorkout();
      });

  Future<void> createUserData() =>
      Future.delayed(Duration(seconds: 1), () async {
        // save user data to firebase
        final uid = await ProviderWidget.of(context).auth.getCurrentUID();
        await Future.delayed(Duration(seconds: 1));
        await db.collection("Users").doc(uid).set(user.toJson());
      });

  void setVars() {
    creatingWorkout = true;
    user.primaryPushGoal = _primaryPushGoal;
    user.primaryPullGoal = _primaryPullGoal;
    user.progressions = [
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1
    ];
    print("Primary Push Goal: " + _primaryPushGoal);
    print("Primary Pull Goal: " + _primaryPullGoal);
  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    if (creatingWorkout) {
      return CircularProgressIndicator();
    } else {
      return Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.transparent,
          bottomOpacity: 0.0,
          elevation: 0.0,
        ),
        body: Container(
          width: _width,
          height: _height,
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 33),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Preferred exercises",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center),
                SizedBox(height: _height * .02),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                      "With enough time and effort, anything is possible. What high level exercises sound like fun to work toward?",
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.left),
                ),
                SizedBox(height: _height * .02),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Text("Push",
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.center),
                          SizedBox(height: _height * .02),
                          RoundedPreferredButton(
                              text: "One-Arm Push-Up",
                              textColor:
                                  exercise1 ? Colors.white : kPrimaryColor,
                              color: exercise1
                                  ? kPrimaryColor
                                  : kPrimaryLightColor,
                              press: () {
                                /*...*/
                                setState(() {
                                  exercise1 = !exercise1;
                                });
                                _primaryPushGoal = "One-Arm Push-Up";
                              }),
                          RoundedPreferredButton(
                              text: "Planche",
                              textColor:
                                  exercise2 ? Colors.white : kPrimaryColor,
                              color: exercise2
                                  ? kPrimaryColor
                                  : kPrimaryLightColor,
                              press: () {
                                /*...*/
                                setState(() {
                                  exercise2 = !exercise2;
                                });
                                _primaryPushGoal = "Planche";
                              }),
                          RoundedPreferredButton(
                              text: "Handstand Push-Up",
                              textColor:
                                  exercise3 ? Colors.white : kPrimaryColor,
                              color: exercise3
                                  ? kPrimaryColor
                                  : kPrimaryLightColor,
                              press: () {
                                /*...*/
                                setState(() {
                                  exercise3 = !exercise3;
                                });
                                _primaryPushGoal = "Handstand Push-Up";
                              }),
                        ],
                      ),
                    ),
                    SizedBox(width: 40),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Text("Pull",
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.center),
                          SizedBox(height: _height * .02),
                          RoundedPreferredButton(
                              text: "One-Arm Chin-Up",
                              textColor:
                                  exercise4 ? Colors.white : kPrimaryColor,
                              color: exercise4
                                  ? kPrimaryColor
                                  : kPrimaryLightColor,
                              press: () {
                                /*...*/
                                setState(() {
                                  exercise4 = !exercise4;
                                });
                                _primaryPullGoal = "One-Arm Chin-Up";
                              }),
                          RoundedPreferredButton(
                              text: "Front Lever",
                              textColor:
                                  exercise5 ? Colors.white : kPrimaryColor,
                              color: exercise5
                                  ? kPrimaryColor
                                  : kPrimaryLightColor,
                              press: () {
                                /*...*/
                                setState(() {
                                  exercise5 = !exercise5;
                                });
                                _primaryPullGoal = "Front Lever";
                              }),
                          RoundedPreferredButton(
                              text: "Back Lever",
                              textColor:
                                  exercise6 ? Colors.white : kPrimaryColor,
                              color: exercise6
                                  ? kPrimaryColor
                                  : kPrimaryLightColor,
                              press: () {
                                /*...*/
                                setState(() {
                                  exercise6 = !exercise6;
                                });
                                _primaryPullGoal = "Back Lever";
                              }),
                        ],
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: RoundedButton(
                      text: "Finish",
                      press: () async {
                        setState(() {
                          setVars();
                        });

                        await createUserData();
                        await callWorkout().whenComplete(
                            () => Future.delayed(Duration(seconds: 5), () {
                                  // 5s over, navigate to a new page
                                  Navigator.of(context)
                                      .popUntil((route) => route.isFirst);
                                }));

                        //await Future.delayed(Duration(seconds: 1));
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
