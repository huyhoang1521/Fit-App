import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_app/components/rounded_image_button.dart';
import 'package:fit_app/components/themes/icons/iconicks_icons.dart';
import 'package:fit_app/screens/home/Profile/prof_Info_pull.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../constants.dart';

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

String uuid;

//Pulling from specific user data
final userData = Firestore.instance.collection("Users");

Future<DocumentSnapshot> getUserInfo() async {
  var firebaseUser = await FirebaseAuth.instance.currentUser();
  return await Firestore.instance
      .collection("Users")
      .document(firebaseUser.uid)
      .get()
      .then((newData) {
    goal = newData.data['goal'];
    uuid = firebaseUser.uid;
  }).whenComplete(() async {
    if (goal == "Strength" && strength == false) {
      strength = !strength;
      str = 'Strength';
    } else if (goal == "Hypertrophy" && hypertrophy == false) {
      hypertrophy = !hypertrophy;
      hyp = 'Hypertrophy';
    } else if (goal == "Weight Loss" && weightLoss == false) {
      weightLoss = !weightLoss;
      wei = 'Weight Loss';
    }
    print("goal is " + goal);
  });
}

Future<void> updateGoal(String goal) async {
  await userData.document(uuid).updateData({"goal": goal});
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    double _fitWidth = (MediaQuery.of(context).size.width) / 3;
    return Scaffold(
      appBar: AppBar(
        title: Text('Get Fit With Nick!'),
        elevation: 5,
        backgroundColor: kPrimaryColor,
      ),
      body: ListView(padding: const EdgeInsets.all(4), children: <Widget>[
        Text('Profile Info', style: Theme.of(context).textTheme.headline1),
        SizedBox(height: titleDiv),
        ProfileInfo(),
        SizedBox(height: newSect),
        Text('Primary Pull Goal', style: Theme.of(context).textTheme.headline1),
        SizedBox(height: titleDiv),
        RoundedImageButton(
          color: frontLever ? Colors.white : kPrimaryColor,
          buttonColor: frontLever ? kPrimaryColor : kPrimaryLightColor,
          text: 'Front Lever',
          image: 'assets/images/OpenImg.png',
          press: () {
            setState(() {
              frontLever = !frontLever;
              oneArmChinUp = false;
              backLever = false;
            });
          },
        ),
        RoundedImageButton(
          color: oneArmChinUp ? Colors.white : kPrimaryColor,
          buttonColor: oneArmChinUp ? kPrimaryColor : kPrimaryLightColor,
          text: 'One Arm Chin Up',
          image: 'assets/images/OpenImg.png',
          press: () {
            setState(() {
              oneArmChinUp = !oneArmChinUp;
              frontLever = false;
              backLever = false;
            });
          },
        ),
        RoundedImageButton(
          color: backLever ? Colors.white : kPrimaryColor,
          buttonColor: backLever ? kPrimaryColor : kPrimaryLightColor,
          text: 'Back Lever',
          image: 'assets/images/OpenImg.png',
          press: () {
            setState(() {
              backLever = !backLever;
              frontLever = false;
              oneArmChinUp = false;
            });
          },
        ),
        SizedBox(height: newSect),
        Text('Primary Push Goal', style: Theme.of(context).textTheme.headline1),
        SizedBox(height: titleDiv),
        RoundedImageButton(
          color: planche ? Colors.white : kPrimaryColor,
          buttonColor: planche ? kPrimaryColor : kPrimaryLightColor,
          text: 'Planche',
          image: 'assets/images/FullPlanche.jpg',
          press: () {
            setState(() {
              planche = !planche;
              handStandPushup = false;
              oneArmPushUp = false;
            });
          },
        ),
        RoundedImageButton(
          color: handStandPushup ? Colors.white : kPrimaryColor,
          buttonColor: handStandPushup ? kPrimaryColor : kPrimaryLightColor,
          text: 'Handstand Push Up',
          image: 'assets/images/FullPlanche.jpg',
          press: () {
            setState(() {
              handStandPushup = !handStandPushup;
              planche = false;
              oneArmPushUp = false;
            });
          },
        ),
        RoundedImageButton(
          color: oneArmPushUp ? Colors.white : kPrimaryColor,
          buttonColor: oneArmPushUp ? kPrimaryColor : kPrimaryLightColor,
          text: 'One Arm Push Up',
          image: 'assets/images/FullPlanche.jpg',
          press: () {
            setState(() {
              oneArmPushUp = !oneArmPushUp;
              planche = false;
              handStandPushup = false;
            });
          },
        ),
        SizedBox(height: newSect),
        Text(
          'Fitness Goal',
          style: Theme.of(context).textTheme.headline1,
        ),
        SizedBox(
          height: titleDiv,
        ),
        FutureBuilder(
            future: getUserInfo(),
            builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
              return FittedBox(
                fit: BoxFit.fitWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        updateGoal('Strength');
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
                        height: 55.0,
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
                            SizedBox(width: strength ? 10 : 0),
                            Icon(Iconicks.strength1_1),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        updateGoal('Hypertrophy').then((value) => null);
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
                        height: 55.0,
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
                            SizedBox(width: hypertrophy ? 10 : 0),
                            Icon(Iconicks.bodybuilder2),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          updateGoal('Weight Loss');
                          if (weightLoss == false) {
                            weightLoss = !weightLoss;
                            wei = 'Weight Loss';
                          }
                          strength = false;
                          hypertrophy = false;
                          hyp = '';
                          str = '';
                          print(weightLoss);
                        });
                      },
                      child: AnimatedContainer(
                        width: weightLoss ? 225.0 : _fitWidth,
                        height: 55.0,
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
                            SizedBox(width: weightLoss ? 10 : 0),
                            Icon(Iconicks.wl2),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
        SizedBox(height: newSect),
      ]),
    );
  }
}
