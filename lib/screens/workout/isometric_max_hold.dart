import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fit_app/algorithms/workout/create_workout.dart';
import 'package:flutter/material.dart';
import 'package:fit_app/components/general/buttons/rounded_button.dart';
import 'package:fit_app/components/general/appbar/custom_appbar.dart';

int maxHold = 1;

class IsometricMaxHold extends StatefulWidget {
  @override
  _IsometricMaxHoldState createState() => new _IsometricMaxHoldState();
}

Future<void> setMaxHold() async {
  await FirebaseFirestore.instance
      .collection('Users')
      .doc(user.uid)
      .update({"isometricMaxHold": maxHold});
}

class _IsometricMaxHoldState extends State<IsometricMaxHold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Isometric Max Hold"),
            RoundedButton(
              text: "Finish",
              press: () {
                setMaxHold();
              },
            ),
          ],
        ),
      ),
    );
  }
}
