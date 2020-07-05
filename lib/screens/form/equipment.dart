import 'package:fit_app/screens/form/goal.dart';
import 'package:flutter/material.dart';
import '../../components/rounded_button.dart';
import 'preferred_exercises.dart';
import '../../constants.dart';
import '../../models/user.dart';

class Equipment extends StatefulWidget {
  final User user;

  const Equipment({Key key, this.user}) : super(key: key);
  @override
  _Equipment createState() => new _Equipment(user: this.user);
}

class _Equipment extends State<Equipment> {
  final User user;
  _Equipment({this.user});
  String _equipment;
  bool rings = false;
  bool pullUpBar = false;
  bool weights = false;

  void setVars() {
    user.equipment = _equipment;
  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    const IconData arrow_back_ios =
        IconData(0xe5e0, fontFamily: 'MaterialIcons', matchTextDirection: true);
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(arrow_back_ios),
          color: kPrimaryColor,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Goal(user: user)));
          },
        ),
      ),
      body: Container(
          width: _width,
          height: _height,
          child: SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                SizedBox(height: _height * .05),
                Text("Equipment",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center),
                SizedBox(height: _height * .02),
                Text("Do you have any equipment?",
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center),
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
                      print("_equipment " + _equipment);
                    }),
                SizedBox(height: _height * .02),
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
                      print("_equipment " + _equipment);
                    }),
                SizedBox(height: _height * .02),
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
                      print("_equipment " + _equipment);
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
          ))),
    );
  }
}
