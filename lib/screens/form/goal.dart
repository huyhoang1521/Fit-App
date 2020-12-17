import 'package:fit_app/components/themes/constants.dart';
import 'package:flutter/material.dart';
import '../../components/general/buttons/rounded_button.dart';
import '../../models/fit_user.dart';
import 'length.dart';

class Goal extends StatefulWidget {
  final FitUser user;

  const Goal({Key key, this.user}) : super(key: key);
  @override
  _Goal createState() => new _Goal(user: this.user);
}

class _Goal extends State<Goal> {
  final FitUser user;
  _Goal({this.user});

  String _goal;
  bool strength = false;
  bool hypertrophy = false;
  bool weightLoss = false;

  void setVars() {
    user.goal = _goal;
    print("Goal: " + _goal);
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
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Set Your Goal",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
              SizedBox(height: _height * .02),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                    "Now that we have your information, lets make your workout routine! What is your primary goal? This can be changed later.",
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.left),
              ),
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
                    _goal = "Strength";
                  }),
              SizedBox(height: _height * .01),
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
                    _goal = "Hypertrophy";
                  }),
              SizedBox(height: _height * .01),
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
                    _goal = "Weight Loss";
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
                            builder: (context) => Length(user: user)),
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
