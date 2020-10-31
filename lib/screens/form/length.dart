import 'package:fit_app/components/constants.dart';
import 'package:flutter/material.dart';
import '../../components/rounded_button.dart';
import '../../models/fit_user.dart';
import 'equipment.dart';

class Length extends StatefulWidget {
  final FitUser user;

  const Length({Key key, this.user}) : super(key: key);
  @override
  _Length createState() => new _Length(user: this.user);
}

class _Length extends State<Length> {
  final FitUser user;
  _Length({this.user});
  String _length;
  bool strength = false;
  bool hypertrophy = false;
  bool weightLoss = false;

  void setVars() {
    user.length = _length;
    print("Length: " + _length);
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
              Text("Length",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
              SizedBox(height: _height * .02),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 25),
                child: Text("What length do you want your workout?",
                    style: TextStyle(fontSize: 18), textAlign: TextAlign.left),
              ),
              SizedBox(height: _height * .02),
              RoundedButton(
                  text: "Short (40 min)",
                  textColor: strength ? Colors.white : kPrimaryColor,
                  color: strength ? kPrimaryColor : kPrimaryLightColor,
                  press: () {
                    /*...*/
                    setState(() {
                      strength = !strength;
                      hypertrophy = false;
                      weightLoss = false;
                    });
                    _length = "Short";
                  }),
              SizedBox(height: _height * .01),
              RoundedButton(
                  text: "Long (1 hour)",
                  textColor: hypertrophy ? Colors.white : kPrimaryColor,
                  color: hypertrophy ? kPrimaryColor : kPrimaryLightColor,
                  press: () {
                    /*...*/
                    setState(() {
                      hypertrophy = !hypertrophy;
                      strength = false;
                      weightLoss = false;
                    });
                    _length = "Long";
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
                            builder: (context) => Equipment(user: user)),
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
