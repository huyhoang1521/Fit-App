import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_app/components/rounded_image_button.dart';
import 'package:fit_app/components/themes/icons/iconicks_icons.dart';
import 'widgets/fitness_goal.dart';
import 'profile_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fit_app/components/constants.dart';

class Profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProfileState();
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
bool editButton = false;

String edit = 'Edit';
String uuid;
String firstName;
String controllerFN;
String lastName;
String height;
int weight;
String dob;
String oACU = 'assets/images/OpenImg.png';
String oACD = 'assets/images/pullup_up.png';
String prefExer;

//String goal;

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
    prefExer = newData.data['prefferedExercises'];
    firstName = newData.data['firstName'];
    lastName = newData.data['lastName'];
    height = newData.data['height'];
    weight = newData.data['weight'];
    dob = newData.data['dob'];
    uuid = firebaseUser.uid;
  }).whenComplete(() async {
    if (goal == "Strength" && _strength == false) {
      _strength = !_strength;
    } else if (goal == "Hypertrophy" && _hypertrophy == false) {
      _hypertrophy = !_hypertrophy;
    } else if (goal == "Weight Loss" && _weightLoss == false) {
      _weightLoss = !_weightLoss;
    }
    print("goal is " + goal);
    if (prefExer == 'FL' && frontLever == false) {
      frontLever = true;
    } else if (prefExer == 'QAC' && oneArmChinUp == false) {
      oneArmChinUp = true;
    } else if (prefExer == 'BL' && backLever == false) {
      backLever = true;
    }
    //print("Preferred exercise is " + prefExer);
  });
}

Future<void> updateGoal(String goal) async {
  await userData.document(uuid).updateData({"goal": goal});
}

Future<void> updatePullGoal(String prefExer) async {
  await userData.document(uuid).updateData({"prefferedExercises": prefExer});
}

Future<void> updateText(String firstName, lastName, weight, dob) async {
  await userData.document(uuid).updateData({"firstName": firstName});
  await userData.document(uuid).updateData({"lastName": lastName});
  await userData.document(uuid).updateData({"weight": weight});
  await userData.document(uuid).updateData({"dob": dob});
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fit With Nick!'),
        elevation: 5,
      ),
      body: FutureBuilder(
        future: getUserInfo(),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          return ListView(
            padding: const EdgeInsets.all(4),
            children: <Widget>[
              // Text('Profile Info', style: Theme.of(context).textTheme.headline1),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Profile Info',
                      style: Theme.of(context).textTheme.headline1),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      elevation: 2,
                      child: Text(
                        edit,
                        style: TextStyle(
                          color: editButton
                              ? Colors.white
                              : Theme.of(context).primaryColor,
                        ), //Theme.of(context).textTheme.bodyText1,
                      ),
                      color: editButton
                          ? kPrimaryColor
                          : Theme.of(context)
                              .accentColor, //Theme.of(context).accentColor,
                      disabledColor: Theme.of(context).primaryColor,
                      onPressed: () {
                        setState(() {
                          if (editButton == true) {
                            editButton = !editButton;
                            edit = 'Edit';
                            updateText(firstName, weight, height, dob);
                            //   print(weight);
                          } else if (editButton == false) {
                            editButton = !editButton;
                            edit = 'Save';
                          }
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: titleDiv),
              //ProfileInfo(),
              ProfileInfo(
                nameController: TextEditingController()..text = firstName,
                weightController: TextEditingController()
                  ..text = weight.toString(),
                heightController: TextEditingController()..text = height,
                dobController: TextEditingController()..text = dob,
                firstName: firstName,
                lastName: lastName,
                weight: weight,
                dob: dob,
                height: height,
                lock: editButton,
              ),
              SizedBox(height: newSect),
              AnimatedOpacity(
                opacity: !editButton ? 1.0 : 0.2,
                duration: Duration(milliseconds: 250),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('Primary Pull Goal',
                        style: Theme.of(context).textTheme.headline1),
                    SizedBox(height: titleDiv),
                    RoundedImageButton(
                      color: frontLever ? Colors.white : kPrimaryColor,
                      buttonColor: frontLever
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).accentColor,
                      text: 'Front Lever',
                      image: 'assets/images/pullup_down.png',
                      press: () {
                        if (frontLever == false) {
                          updatePullGoal('FL');
                          setState(() {
                            frontLever = true;
                            oneArmChinUp = false;
                            backLever = false;
                          });
                        }
                      },
                    ),
                    RoundedImageButton(
                      color: oneArmChinUp ? Colors.white : kPrimaryColor,
                      buttonColor: oneArmChinUp
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).accentColor,
                      text: 'One Arm Chin Up',
                      image: oneArmChinUp ? oACD : oACU,
                      press: () {
                        if (oneArmChinUp == false) {
                          updatePullGoal('QOC');
                          setState(() {
                            oneArmChinUp = !oneArmChinUp;
                            frontLever = false;
                            backLever = false;
                          });
                        }
                      },
                    ),
                    RoundedImageButton(
                      color: backLever ? Colors.white : kPrimaryColor,
                      buttonColor: backLever
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).accentColor,
                      text: 'Back Lever',
                      image: 'assets/images/pullup_up.png',
                      press: () {
                        if (backLever == false) {
                          updatePullGoal('BL');
                          setState(() {
                            backLever = true;
                            frontLever = false;
                            oneArmChinUp = false;
                          });
                        }
                      },
                    ),
                    SizedBox(height: newSect),
                    Text('Primary Push Goal',
                        style: Theme.of(context).textTheme.headline1),
                    SizedBox(height: titleDiv),
                    RoundedImageButton(
                      color: planche
                          ? Colors.white
                          : Theme.of(context).primaryColor,
                      buttonColor: planche
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).accentColor,
                      text: 'Planche',
                      image: 'assets/images/pullup_up.png',
                      press: () {
                        setState(() {
                          planche = !planche;
                          handStandPushup = false;
                          oneArmPushUp = false;
                        });
                      },
                    ),
                    RoundedImageButton(
                      color: handStandPushup
                          ? Colors.white
                          : Theme.of(context).primaryColor,
                      buttonColor: handStandPushup
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).accentColor,
                      text: 'Handstand Push Up',
                      image: 'assets/images/pullup_up.png',
                      press: () {
                        setState(() {
                          handStandPushup = !handStandPushup;
                          planche = false;
                          oneArmPushUp = false;
                        });
                      },
                    ),
                    RoundedImageButton(
                      color: oneArmPushUp
                          ? Colors.white
                          : Theme.of(context).primaryColor,
                      buttonColor: oneArmPushUp
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).accentColor,
                      text: 'One Arm Push Up',
                      image: 'assets/images/pullup_up.png',
                      press: () {
                        setState(() {
                          oneArmPushUp = !oneArmPushUp;
                          planche = false;
                          handStandPushup = false;
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: newSect),
              AnimatedOpacity(
                opacity: !editButton ? 1.0 : 0.2,
                duration: Duration(milliseconds: 250),
                child: Text(
                  'Fitness Goal',
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              SizedBox(
                height: titleDiv,
              ),
              AnimatedOpacity(
                opacity: !editButton ? 1.0 : 0.2,
                duration: Duration(milliseconds: 250),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 0, 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FitnessGoal(
                          goal: _strength,
                          icon: Iconicks.strength1_1,
                          text: 'Strength',
                          press: () {
                            updateGoal('Strength');
                            setState(() {
                              if (_strength == false) {
                                _strength = !_strength;
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
                          updateGoal('Hypertrophy');
                          setState(() {
                            if (_hypertrophy == false) {
                              _hypertrophy = !_hypertrophy;
                            }
                            _weightLoss = false;
                            _strength = false;
                          });
                        },
                      ),
                      FitnessGoal(
                        goal: _weightLoss,
                        icon: Iconicks.wl2,
                        text: 'Weight Loss',
                        press: () {
                          updateGoal('Weight Loss');
                          setState(() {
                            if (_weightLoss == false) {
                              _weightLoss = !_weightLoss;
                            }
                            _hypertrophy = false;
                            _strength = false;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: newSect),
            ],
          );
        },
      ),
    );
  }
}
