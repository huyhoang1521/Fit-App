import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_app/screens/home/Profile/prof_InfoPull.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../constants.dart';
import 'package:fit_app/components/themes/icons/custom_icons_icons.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProfilePageState();
  }
}

// Need to be pulled/updated from users database
String hyp = '';
String str = '';
String wei = '';

// Used to Select users workout goals
bool strength = false;
bool hypertrophy = false;
bool weightLoss = false;
bool planche = false;
bool oneArmChinUp = false;
bool handStandPushup = false;
bool backLever = false;
bool frontLever = false;
bool oneArmPushUp = false;
bool selected = false;

//Pulling from specific user data
var userData = Firestore.instance.collection("Users").document("uid").get();

Future<DocumentSnapshot> getUserInfo() async {
  var firebaseUser = await FirebaseAuth.instance.currentUser();
  return await Firestore.instance
      .collection("Users")
      .document(firebaseUser.uid)
      .get();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    double _fitWidth = 3 * (MediaQuery.of(context).size.width) / 12;
    return Scaffold(
      appBar: AppBar(
        title: Text('Get Fit With Nick!'),
        elevation: 5,
        backgroundColor: kPrimaryColor,
      ),
      body: ListView(padding: const EdgeInsets.all(4), children: <Widget>[
        Text('Profile Info:', style: Theme.of(context).textTheme.headline1),
        SizedBox(height: 10),
        ProfileInfo(),
        SizedBox(height: 20),
        Text('Primary Pull Goal:',
            style: Theme.of(context).textTheme.headline1),
        SizedBox(height: 30),
        GestureDetector(
          onTap: () {
            setState(() {
              frontLever = !frontLever;
              oneArmChinUp = false;
              backLever = false;
            });
          },
          child: Container(
            //width: 300.0,
            height: 100, //selected ? 50.0 : 60.0,
            decoration: BoxDecoration(
                color: frontLever ? kPrimaryColor : kPrimaryLightColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/FrontLever.jpg',
                  width: 150,
                ),
                Text(
                  'Front Lever',
                  style: TextStyle(
                    color: frontLever ? Colors.white : kPrimaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10),
        GestureDetector(
          onTap: () {
            setState(() {
              oneArmChinUp = !oneArmChinUp;
              frontLever = false;
              backLever = false;
            });
          },
          child: Container(
            //width: 300.0,
            height: 100, //selected ? 50.0 : 60.0,
            decoration: BoxDecoration(
                color: oneArmChinUp ? kPrimaryColor : kPrimaryLightColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/OAC.jpg',
                  width: 150,
                ),
                Text(
                  'One Arm Chin Up',
                  style: TextStyle(
                    color: oneArmChinUp ? Colors.white : kPrimaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10),
        GestureDetector(
          onTap: () {
            setState(() {
              backLever = !backLever;
              frontLever = false;
              oneArmChinUp = false;
            });
          },
          child: Container(
            //width: 300.0,
            height: 100, //selected ? 50.0 : 60.0,
            decoration: BoxDecoration(
                color: backLever ? kPrimaryColor : kPrimaryLightColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/BackLever.jpg',
                  width: 150,
                ),
                Text(
                  'Back Lever',
                  style: TextStyle(
                    color: backLever ? Colors.white : kPrimaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 35),
        Text('Primary Push Goal:',
            style: Theme.of(context).textTheme.headline1),
        SizedBox(height: 35),
        GestureDetector(
          onTap: () {
            setState(() {
              planche = !planche;
              handStandPushup = false;
              oneArmPushUp = false;
            });
          },
          child: Container(
            //width: 300.0,
            height: 100, //selected ? 50.0 : 60.0,
            decoration: BoxDecoration(
              color: planche ? kPrimaryColor : kPrimaryLightColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/FullPlanche.jpg',
                  width: 150,
                ),
                Text(
                  'Planche',
                  style: TextStyle(
                    color: planche ? Colors.white : kPrimaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 25),
        GestureDetector(
          onTap: () {
            setState(() {
              handStandPushup = !handStandPushup;
              planche = false;
              oneArmPushUp = false;
            });
          },
          child: Container(
            //width: 300.0,
            height: 100, //selected ? 50.0 : 60.0,
            decoration: BoxDecoration(
              color: handStandPushup ? kPrimaryColor : kPrimaryLightColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/planche2.png',
                  width: 150,
                ),
                Text(
                  'Planche',
                  style: TextStyle(
                    color: handStandPushup ? Colors.white : kPrimaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 25),
        GestureDetector(
          onTap: () {
            setState(() {
              oneArmPushUp = !oneArmPushUp;
              planche = false;
              handStandPushup = false;
            });
          },
          child: Container(
            //width: 300.0,
            height: 100, //selected ? 50.0 : 60.0,
            decoration: BoxDecoration(
              color: oneArmPushUp ? kPrimaryColor : kPrimaryLightColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/OneArmPushUp.jpeg',
                  width: 150,
                ),
                Text(
                  'Planche',
                  style: TextStyle(
                    color: oneArmPushUp ? Colors.white : kPrimaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 35),
        Text(
          'Fitness Goal',
          style: Theme.of(context).textTheme.headline1,
        ),
        SizedBox(
          height: 20,
        ),
        FutureBuilder(
            future: getUserInfo(),
            builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
              return FittedBox(
                fit: BoxFit.fitWidth,
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (strength == false) {
                            strength = !strength;
                            str = 'Strength';
                          }
                          hypertrophy = false;
                          weightLoss = false;
                          hyp = '';
                          wei = '';
                        });
                      },
                      child: AnimatedContainer(
                        width: strength ? 225.0 : _fitWidth,
                        height: 50.0,
                        duration: Duration(milliseconds: 750),
                        decoration: BoxDecoration(
                            color:
                                strength ? kPrimaryColor : kPrimaryLightColor,
                            borderRadius: BorderRadiusDirectional.circular(40)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '$str',
                              style: TextStyle(
                                color: strength ? Colors.white : kPrimaryColor,
                              ),
                            ),
                            Icon(CustomIcons.stretching),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (hypertrophy == false) {
                            hypertrophy = !hypertrophy;
                            hyp = 'Hypertrophy';
                          }
                          strength = false;
                          weightLoss = false;
                          str = '';
                          wei = '';
                        });
                      },
                      child: AnimatedContainer(
                        width: hypertrophy ? 225.0 : _fitWidth,
                        height: 50.0,
                        duration: Duration(milliseconds: 750),
                        decoration: BoxDecoration(
                            color: hypertrophy
                                ? kPrimaryColor
                                : kPrimaryLightColor,
                            borderRadius: BorderRadiusDirectional.circular(40)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '$hyp',
                              style: TextStyle(
                                color:
                                    hypertrophy ? Colors.white : kPrimaryColor,
                              ),
                            ),
                            Icon(CustomIcons.active__1_),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (weightLoss == false) {
                            weightLoss = !weightLoss;
                            wei = 'Weight Loss';
                          }
                          strength = false;
                          hypertrophy = false;
                          hyp = '';
                          str = '';
                        });
                      },
                      child: AnimatedContainer(
                        width: weightLoss ? 225.0 : _fitWidth,
                        height: 50.0,
                        duration: Duration(milliseconds: 750),
                        decoration: BoxDecoration(
                            color:
                                weightLoss ? kPrimaryColor : kPrimaryLightColor,
                            borderRadius: BorderRadiusDirectional.circular(40)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '$wei',
                              style: TextStyle(
                                color:
                                    weightLoss ? Colors.white : kPrimaryColor,
                              ),
                            ),
                            Icon(CustomIcons.rest),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ]),
    );
  }
}
