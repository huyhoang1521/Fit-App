import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fit_app/algorithms/workout/create_workout.dart';
import 'package:flutter/material.dart';
import 'package:fit_app/components/general/buttons/rounded_button.dart';
import 'package:fit_app/components/general/appbar/custom_appbar.dart';

int maxHold = 3;

class EccentricMaxHold extends StatefulWidget {
  @override
  _EccentricMaxHoldState createState() => new _EccentricMaxHoldState();
}

Future<void> setMaxHold() async {
  await FirebaseFirestore.instance
      .collection('Users')
      .doc(user.uid)
      .update({"eccentricMaxHold": maxHold});
}

class _EccentricMaxHoldState extends State<EccentricMaxHold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Eccentric Max Hold"),
            RoundedButton(
              text: "Finish",
              press: () {
                print(user.uid);
                setMaxHold();
              },
            ),
          ],
        ),
      ),
    );
  }
}
