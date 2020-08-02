import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_app/components/rounded_image_button.dart';
import 'package:fit_app/components/themes/icons/iconicks_icons.dart';
import 'package:fit_app/screens/home/Profile/fitness_goal.dart';
import 'package:fit_app/screens/home/Profile/prof_InfoPull.dart';
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

// Used to Select users workout goals
bool _strength = false;
bool _hypertrophy = false;
bool _weightLoss = false;
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

void setWeightloss() async {
  _weightLoss = true;
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
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
          image: 'assets/images/pullup_up.png',
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
              if (!snapshot.hasData) return Text("Loading");
              if (snapshot.data.data['goal'] == 'Strength') setStrength();
              //setState(() {
//                strength = true;
//              hypertrophy = false;
//              weightLoss = false;
              //  });
              if (snapshot.data.data['goal'] == 'Hypertrophy') setHypertrophy();
              // setState(() {
//                strength = false;
//              hypertrophy = true;
//              weightLoss = false;
              //  });
              if (snapshot.data.data['goal'] == 'Weight Loss') setWeightloss();
              //  setState(() {
//                strength = false;
//              hypertrophy = false;
//              weightLoss = true;
              //   });

              return Column(
                children: [
                  Text(snapshot.data.data['goal']),
                  Row(children: [
                    FitnessGoal(
                        goal: _strength,
                        icon: Iconicks.strength1_1,
                        text: 'Strength',
                        press: () {
                          setState(() {
                            if (_strength == false) {
                              _strength = !_strength;
                              //snapshot.data.data['goal'] = 'Strength';
                            }
                            _weightLoss = false;
                            _hypertrophy = false;
                          });
                        }),
                    FitnessGoal(
                        goal: _hypertrophy,
                        icon: Iconicks.bodybuilder2,
                        text: 'Hypertrophy',
                        press: () {
                          setState(() {
                            if (_hypertrophy == false) {
                              _hypertrophy = !_hypertrophy;
                            }
                            _weightLoss = false;
                            _strength = false;
                          });
                        }),
                    FitnessGoal(
                        goal: _weightLoss,
                        icon: Iconicks.wl2,
                        text: 'Weight Loss',
                        press: () {
                          setState(() {
                            if (_weightLoss == false) {
                              _weightLoss = !_weightLoss;
                            }
                            _hypertrophy = false;
                            _strength = false;
                          });
                        }),
                  ]),
                ],
              );
            }),
        SizedBox(height: newSect),
      ]),
    );
  }
}

void setHypertrophy() async {
  // setState(() {
  _strength = false;
  _hypertrophy = true;
  _weightLoss = false;
  //  });
}

void setStrength() async {
  //setState(() {
  _strength = true;
  _hypertrophy = false;
  _weightLoss = false;
  //  });
}
