import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_app/components/themes/icons/iconicks_icons.dart';
import 'package:flutter/material.dart';
import 'package:fit_app/constants.dart';
import 'package:fit_app/models/user.dart';

import 'fitness_goal.dart';

class ProfileTest extends StatefulWidget {
  final User user;
  const ProfileTest({Key key, this.user}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ProfileTestState();
  }
}

var userData = Firestore.instance.collection("Users").document("uid").get();

Future<DocumentSnapshot> getUserInfo() async {
  var firebaseUser = await FirebaseAuth.instance.currentUser();
  return await Firestore.instance
      .collection("Users")
      .document(firebaseUser.uid)
      .get();
}

class _ProfileTestState extends State<ProfileTest> {
  final User user;
  _ProfileTestState({this.user});
  String _goal;
  bool _strength = false;
  bool _hypertrophy = false;
  bool _weightLoss = false;

  void setVars() {
    print("goal is " + _goal);
    user.goal = _goal;
    print("goal is " + _goal);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fit For Life'),
        elevation: 5,
        backgroundColor: kPrimaryColor,
      ),
      body: StreamBuilder(
          stream: Firestore.instance.collection("Users").snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return Text("Loading");
            return Column(
              children: [
                Row(children: [
                  FitnessGoal(
                      goal: _strength,
                      icon: Iconicks.strength1_1,
                      text: 'Strength',
                      press: () {
                        setState(() {
                          if (_strength == false) {
                            _strength = !_strength;
                            //snapshot.data.data['goal'] = 'Strength';
                          }
                          _weightLoss = false;
                          _hypertrophy = false;
                        });
                        _goal = 'Strength';
                      }),
                  FitnessGoal(
                      goal: _hypertrophy,
                      icon: Iconicks.bodybuilder2,
                      text: 'Hypertrophy',
                      press: () {
                        setState(() {
                          if (_hypertrophy == false) {
                            _hypertrophy = !_hypertrophy;
                          }
                          _weightLoss = false;
                          _strength = false;
                        });
                        _goal = 'Hypertrophy';
                      }),
                  FitnessGoal(
                      goal: _weightLoss,
                      icon: Iconicks.wl2,
                      text: 'Weight Loss',
                      press: () {
                        setState(() {
                          if (_weightLoss == false) {
                            _weightLoss = !_weightLoss;
                          }
                          _hypertrophy = false;
                          _strength = false;
                        });
                        _goal = 'Weight Loss';
                      }),
                ]),
                //    Text(userId),
              ],
            );
          }),
    );
  }
}
