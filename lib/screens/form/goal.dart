import 'package:fit_app/screens/form/info.dart';
import 'package:flutter/material.dart';
import '../../components/rounded_button.dart';
import '../../constants.dart';
import '../../models/user.dart';
import 'equipment.dart';

class Goal extends StatefulWidget {
  final User user;

  const Goal({Key key, this.user}) : super(key: key);
  @override
  _Goal createState() => new _Goal(user: this.user);
}

class _Goal extends State<Goal> {
  final User user;
  _Goal({this.user});
  String _goal;
  bool strength = false;
  bool hypertrophy = false;
  bool weightLoss = false;

  void setVars() {
    print("fist name is " + user.firstName);
    print("goal is " + _goal);
    user.goal = _goal;
    print("goal is " + _goal);
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
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Info()));
          },
        ),
      ),
      body: Container(
        width: _width,
        height: _height,
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                SizedBox(height: _height * .05),
                Text("Set your goal",
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
                SizedBox(height: _height * .03),
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
                      print(_goal);
                    }),
                SizedBox(height: _height * .02),
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
                      print(_goal);
                    }),
                SizedBox(height: _height * .02),
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
                      print(_goal);
                    }),
                SizedBox(height: _height * .02),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: RoundedButton(
                      text: "Next",
                      press: () {
                        print("Before Next");
                        setVars();
                        print("After Next");
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
      ),
    );
  }
}
