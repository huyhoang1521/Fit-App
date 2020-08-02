import 'package:fit_app/screens/form/equipment.dart';
import 'package:flutter/material.dart';
import '../../components/rounded_button.dart';
import '../../constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../widgets/provider_widget.dart';
import '../../models/user.dart';

class PreferredExercises extends StatefulWidget {
  final User user;

  const PreferredExercises({Key key, this.user}) : super(key: key);

  @override
  _PreferredExercises createState() => new _PreferredExercises(user: this.user);
}

class _PreferredExercises extends State<PreferredExercises> {
  final User user;
  _PreferredExercises({this.user});
  String _prefferedExercises;
  final db = Firestore.instance;

  bool exercise1 = false;
  bool exercise2 = false;
  bool exercise3 = false;
  bool exercise4 = false;
  bool exercise5 = false;
  bool exercise6 = false;

  void setVars() {
    user.prefferedExercises = _prefferedExercises;
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
                MaterialPageRoute(builder: (context) => Equipment(user: user)));
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
                Text("Preffered exercises",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center),
                SizedBox(height: _height * .025),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 45),
                  child: Text(
                      "With enough time and effort, anything is possible. What high level exercises sound like fun to work toward?",
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.left),
                ),
                Row(
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
                              textColor:
                                  exercise1 ? Colors.white : kPrimaryColor,
                              color: exercise1
                                  ? kPrimaryColor
                                  : kPrimaryLightColor,
                              press: () {
                                /*...*/
                                setState(() {
                                  exercise1 = !exercise1;
                                });
                                _prefferedExercises = "QAPu";
                                print("_prefferedExercises " +
                                    _prefferedExercises);
                              }),
                          RoundedButton(
                              text: "Planche",
                              textColor:
                                  exercise2 ? Colors.white : kPrimaryColor,
                              color: exercise2
                                  ? kPrimaryColor
                                  : kPrimaryLightColor,
                              press: () {
                                /*...*/
                                setState(() {
                                  exercise2 = !exercise2;
                                });
                                _prefferedExercises = "Planche";
                                print("_prefferedExercises " +
                                    _prefferedExercises);
                              }),
                          RoundedButton(
                              text: "HSPu",
                              textColor:
                                  exercise3 ? Colors.white : kPrimaryColor,
                              color: exercise3
                                  ? kPrimaryColor
                                  : kPrimaryLightColor,
                              press: () {
                                /*...*/
                                setState(() {
                                  exercise3 = !exercise3;
                                });
                                _prefferedExercises = "HSPu";
                                print("_prefferedExercises " +
                                    _prefferedExercises);
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
                              textColor:
                                  exercise4 ? Colors.white : kPrimaryColor,
                              color: exercise4
                                  ? kPrimaryColor
                                  : kPrimaryLightColor,
                              press: () {
                                /*...*/
                                setState(() {
                                  exercise4 = !exercise4;
                                });
                                _prefferedExercises = "QAC";
                                print("_prefferedExercises " +
                                    _prefferedExercises);
                              }),
                          RoundedButton(
                              text: "FL",
                              textColor:
                                  exercise5 ? Colors.white : kPrimaryColor,
                              color: exercise5
                                  ? kPrimaryColor
                                  : kPrimaryLightColor,
                              press: () {
                                /*...*/
                                setState(() {
                                  exercise5 = !exercise5;
                                });
                                _prefferedExercises = "FL";
                                print("_prefferedExercises " +
                                    _prefferedExercises);
                              }),
                          RoundedButton(
                              text: "BL",
                              textColor:
                                  exercise6 ? Colors.white : kPrimaryColor,
                              color: exercise6
                                  ? kPrimaryColor
                                  : kPrimaryLightColor,
                              press: () {
                                /*...*/
                                setState(() {
                                  exercise6 = !exercise6;
                                });
                                _prefferedExercises = "BL";
                                print("_prefferedExercises " +
                                    _prefferedExercises);
                              }),
                        ],
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: RoundedButton(
                      text: "Finish",
                      press: () async {
                        setVars();
                        // save data to firebase
                        final uid = await ProviderWidget.of(context)
                            .auth
                            .getCurrentUID();
                        await db
                            .collection("Users")
                            .document(uid)
                            .setData(user.toJson());
                        Navigator.of(context)
                            .popUntil((route) => route.isFirst);
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
