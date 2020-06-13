import 'package:flutter/material.dart';
import '../../components/rounded_button.dart';
import 'preferred_exercises.dart';
import '../../constants.dart';

class Goal extends StatefulWidget {
  @override
  _Goal createState() => new _Goal();
}

class _Goal extends State<Goal> {
  final primaryColor = const Color(0xFF75A2EA);
  bool strength = false;
  bool hypertrophy = false;
  bool weightLoss = false;
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
          width: _width,
          height: _height,
          child: SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                SizedBox(height: _height * .05),
                Text(
                    "Now that we have your information, lets make your workout routine!",
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center),
                SizedBox(height: _height * .01),
                Text("What is your primary goal? This can be changed later.",
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center),
                SizedBox(height: _height * .02),
                RoundedButton(
                    text: "Strength",
                    textColor: strength ? Colors.white : kPrimaryColor,
                    color: strength ? kPrimaryColor : kPrimaryLightColor,
                    press: () {
                      /*...*/
                      setState(() {
                        strength = !strength;
                        hypertrophy = false;
                        weightLoss = false;
                      });
                    }),
                RoundedButton(
                    text: "Hypertrophy",
                    textColor: hypertrophy ? Colors.white : kPrimaryColor,
                    color: hypertrophy ? kPrimaryColor : kPrimaryLightColor,
                    press: () {
                      /*...*/
                      setState(() {
                        hypertrophy = !hypertrophy;
                        strength = false;
                        weightLoss = false;
                      });
                    }),
                RoundedButton(
                    text: "Weight Loss",
                    textColor: weightLoss ? Colors.white : kPrimaryColor,
                    color: weightLoss ? kPrimaryColor : kPrimaryLightColor,
                    press: () {
                      /*...*/
                      setState(() {
                        weightLoss = !weightLoss;
                        strength = false;
                        hypertrophy = false;
                      });
                    }),
                RoundedButton(
                  text: "Next",
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PreferredExercises()),
                    );
                  },
                ),
              ],
            ),
          ))),
    );
  }
}
