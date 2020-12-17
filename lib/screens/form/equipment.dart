import 'package:fit_app/components/themes/constants.dart';
import 'package:flutter/material.dart';
import '../../components/general/buttons/rounded_button.dart';
import 'preferred_exercises.dart';
import '../../models/fit_user.dart';

class Equipment extends StatefulWidget {
  final FitUser user;

  const Equipment({Key key, this.user}) : super(key: key);

  @override
  _Equipment createState() => new _Equipment(user: this.user);
}

class _Equipment extends State<Equipment> {
  final FitUser user;
  _Equipment({this.user});

  String _equipment;
  bool rings = false;
  bool pullUpBar = false;
  bool weights = false;

  void setVars() {
    user.equipment = _equipment;
    print("Equipment: " + _equipment);
  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
      ),
      body: Container(
        width: _width,
        height: _height,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Equipment",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
              SizedBox(height: _height * .02),
              Text("Do you have any equipment?",
                  style: TextStyle(fontSize: 18), textAlign: TextAlign.center),
              SizedBox(height: _height * .02),
              RoundedButton(
                  text: "Rings",
                  textColor: rings ? Colors.white : kPrimaryColor,
                  color: rings ? kPrimaryColor : kPrimaryLightColor,
                  press: () {
                    /*...*/
                    setState(() {
                      rings = !rings;
                    });
                    _equipment = "Rings";
                  }),
              SizedBox(height: _height * .01),
              RoundedButton(
                  text: "Pull-Up Bar",
                  textColor: pullUpBar ? Colors.white : kPrimaryColor,
                  color: pullUpBar ? kPrimaryColor : kPrimaryLightColor,
                  press: () {
                    /*...*/
                    setState(() {
                      pullUpBar = !pullUpBar;
                    });
                    _equipment = "Pull-Up Bar";
                  }),
              SizedBox(height: _height * .01),
              RoundedButton(
                  text: "Weights",
                  textColor: weights ? Colors.white : kPrimaryColor,
                  color: weights ? kPrimaryColor : kPrimaryLightColor,
                  press: () {
                    /*...*/
                    setState(() {
                      weights = !weights;
                    });
                    _equipment = "Weights";
                  }),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: RoundedButton(
                    text: "Next",
                    press: () {
                      setVars();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PreferredExercises(user: user)),
                      );
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
