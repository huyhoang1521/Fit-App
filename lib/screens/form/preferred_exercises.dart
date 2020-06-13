import 'package:flutter/material.dart';
import '../../components/rounded_button.dart';
import '../../constants.dart';
import '../home/tab_system.dart';

class PreferredExercises extends StatefulWidget {
  final primaryColor = const Color(0xFF75A2EA);
  @override
  _PreferredExercises createState() => new _PreferredExercises();
}

class _PreferredExercises extends State<PreferredExercises> {
  bool exercise1 = false;
  bool exercise2 = false;
  bool exercise3 = false;
  bool exercise4 = false;
  bool exercise5 = false;
  bool exercise6 = false;
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    var descriptionTile = new ListTile(
      title: Column(
        children: <Widget>[
          SizedBox(height: _height * .04),
          Text(
              "With enough time and effort, anything is possible. What high level exercises sound like fun to work toward?",
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center),
        ],
      ),
    );

    var exercisesTile = new ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Column(
              children: <Widget>[
                SizedBox(height: _height * .02),
                Text("Push",
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center),
                SizedBox(height: _height * .02),
                RoundedButton(
                    text: "QAPu",
                    textColor: exercise1 ? Colors.white : kPrimaryColor,
                    color: exercise1 ? kPrimaryColor : kPrimaryLightColor,
                    press: () {
                      /*...*/
                      setState(() {
                        exercise1 = !exercise1;
                      });
                    }),
                RoundedButton(
                    text: "Planche",
                    textColor: exercise2 ? Colors.white : kPrimaryColor,
                    color: exercise2 ? kPrimaryColor : kPrimaryLightColor,
                    press: () {
                      /*...*/
                      setState(() {
                        exercise2 = !exercise2;
                      });
                    }),
                RoundedButton(
                    text: "HSPu",
                    textColor: exercise3 ? Colors.white : kPrimaryColor,
                    color: exercise3 ? kPrimaryColor : kPrimaryLightColor,
                    press: () {
                      /*...*/
                      setState(() {
                        exercise3 = !exercise3;
                      });
                    }),
              ],
            ),
          ),
          SizedBox(width: 45),
          Expanded(
            child: Column(
              children: <Widget>[
                SizedBox(height: _height * .02),
                Text("Pull",
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center),
                SizedBox(height: _height * .02),
                RoundedButton(
                    text: "QAC",
                    textColor: exercise4 ? Colors.white : kPrimaryColor,
                    color: exercise4 ? kPrimaryColor : kPrimaryLightColor,
                    press: () {
                      /*...*/
                      setState(() {
                        exercise4 = !exercise4;
                      });
                    }),
                RoundedButton(
                    text: "FL",
                    textColor: exercise5 ? Colors.white : kPrimaryColor,
                    color: exercise5 ? kPrimaryColor : kPrimaryLightColor,
                    press: () {
                      /*...*/
                      setState(() {
                        exercise5 = !exercise5;
                      });
                    }),
                RoundedButton(
                    text: "BL",
                    textColor: exercise6 ? Colors.white : kPrimaryColor,
                    color: exercise6 ? kPrimaryColor : kPrimaryLightColor,
                    press: () {
                      /*...*/
                      setState(() {
                        exercise6 = !exercise6;
                      });
                    }),
              ],
            ),
          ),
        ],
      ),
    );

    var nextTile = new ListTile(
      title: RoundedButton(
        text: "Finish",
        press: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TabSystem()),
          );
        },
      ),
    );

    return Scaffold(
      body: Container(
        width: _width,
        height: _height,
        child: SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ListView(
                  children: <Widget>[descriptionTile, exercisesTile, nextTile],
                ))),
      ),
    );
  }
}
