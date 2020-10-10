import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fit_app/components/custom_number_field.dart';
import 'package:fit_app/components/custom_press_field.dart';
import 'package:fit_app/components/rounded_button.dart';
import 'package:fit_app/screens/home/custom_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../components/custom_text_field.dart';
import '../../../models/fit_user.dart';

class Edit extends StatefulWidget {
  final FitUser user;
  final String uuid;

  const Edit({Key key, this.user, this.uuid}) : super(key: key);
  @override
  _Edit createState() => new _Edit(user: this.user, uuid: this.uuid);
}

class _Edit extends State<Edit> {
  final userData = FirebaseFirestore.instance.collection("Users");
  final FitUser user;
  final String uuid;
  TextEditingController firstNameText = new TextEditingController();
  TextEditingController lastNameText = new TextEditingController();
  TextEditingController dobText = new TextEditingController();
  TextEditingController pushGoalText = new TextEditingController();
  TextEditingController pullGoalText = new TextEditingController();
  TextEditingController fitnessGoalText = new TextEditingController();
  TextEditingController heightText = new TextEditingController();
  TextEditingController weightText = new TextEditingController();
  TextEditingController lengthText = new TextEditingController();
  TextEditingController equipmentText = new TextEditingController();
  TextEditingController emailText = new TextEditingController();
  List<Widget> heightList = new List();
  List<Widget> lengthList = [
    Center(child: Text("Short")),
    Center(child: Text("Long"))
  ];
  List<Widget> equipmentList = [
    Center(child: Text("Rings")),
    Center(child: Text("Pull-Up Bar")),
    Center(child: Text("Weights"))
  ];
  List<Widget> pushGoalList = [
    Center(
        child: Text(
      'One-Arm Push-Up',
    )),
    Center(child: Text("Planche")),
    Center(child: Text("Handstand Push-Up"))
  ];
  List<Widget> pullGoalList = [
    Center(child: Text("One-Arm Chin-Up")),
    Center(child: Text("Front Lever")),
    Center(child: Text("Back Lever"))
  ];
  List<Widget> fitnessGoalList = [
    Center(child: Text("Strength")),
    Center(child: Text("Hypertrophy")),
    Center(child: Text("Weight Loss"))
  ];
  List<String> heightStringList = new List();
  List<String> lengthStringList = ['Short', 'Long'];
  List<String> equipmentStringList = ['Rings', 'Pull-Up Bar', 'Weights'];
  List<String> pushGoalStringList = [
    'One-Arm Push-Up',
    'Planche',
    'Handstand Push-Up'
  ];
  List<String> pullGoalStringList = [
    'One-Arm Chin-Up',
    'Front Lever',
    'Back Lever'
  ];
  List<String> fitnessGoalStringList = [
    'Strength',
    'Hypertrophy',
    'Weight Loss'
  ];

  String _firstName,
      _lastName,
      _email,
      _height,
      _weight,
      _length,
      _equipment,
      _dob,
      _pushGoal,
      _pullGoal,
      _fitnessGoal;
  _Edit({this.user, this.uuid});

  Future<void> updateUserData() async {
    await userData.doc(uuid).update({
      "firstName": _firstName,
      "lastName": _lastName,
      "dob": _dob,
      "email": _email,
      "height": _height,
      "weight": int.parse(_weight),
      "goal": _fitnessGoal,
      "length": _length,
      "equipment": _equipment,
      "primaryPushGoal": _pushGoal,
      "primaryPullGoal": _pullGoal,
    });
  }

  void setHeightList() {
    for (int i = 3; i < 8; i++) {
      for (int x = 0; x < 12; x++) {
        heightList
            .add(Center(child: Text(i.toString() + "'" + x.toString() + "\"")));
        heightStringList.add(i.toString() + "'" + x.toString() + "\"");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    firstNameText.text = user.firstName;
    lastNameText.text = user.lastName;
    dobText.text = user.dob;
    pushGoalText.text = user.primaryPushGoal;
    pullGoalText.text = user.primaryPullGoal;
    fitnessGoalText.text = user.goal;
    emailText.text = user.email;
    heightText.text = user.height;
    weightText.text = user.weight.toString();
    lengthText.text = user.length;
    equipmentText.text = user.equipment;

    _firstName = user.firstName;
    _lastName = user.lastName;
    _email = user.email;
    _height = user.height;
    _weight = user.weight.toString();
    _length = user.length;
    _equipment = user.equipment;
    _dob = user.dob;
    _pushGoal = user.primaryPushGoal;
    _pullGoal = user.primaryPullGoal;
    _fitnessGoal = user.goal;

    final _screenWidth = MediaQuery.of(context).size.width;
    final _screenHeight = MediaQuery.of(context).size.height;
    setHeightList();
    return Scaffold(
      appBar: CustomAppBar(),
      body: Container(
        width: _screenWidth,
        height: _screenHeight,
        margin: EdgeInsets.symmetric(vertical: 5),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  Text("First Name"),
                  SizedBox(width: 8),
                  Flexible(
                    child: CustomTextField(
                        txt: firstNameText,
                        onChanged: (value) => _firstName = value),
                  ),
                ],
              ),
              Row(
                children: [
                  Text("Last Name"),
                  SizedBox(width: 8),
                  Flexible(
                    child: CustomTextField(
                        txt: lastNameText,
                        onChanged: (value) => _lastName = value),
                  ),
                ],
              ),
              Row(
                children: [
                  Text("Email"),
                  SizedBox(width: 42),
                  Flexible(
                    child: CustomTextField(
                        txt: emailText, onChanged: (value) => _email = value),
                  ),
                ],
              ),
              /*Row(
                children: [
                  Text("Birth Date"),
                  SizedBox(width: 10),
                  Flexible(
                    child: CustomTextField(
                        txt: dobText, onChanged: (value) => _dob = value),
                  ),
                ],
              ),*/
              Row(
                children: [
                  Text("Height"),
                  SizedBox(width: 35),
                  Flexible(
                    child: CustomPressField(
                      control: heightText,
                      press: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext builder) {
                            return Container(
                              height: MediaQuery.of(context)
                                      .copyWith()
                                      .size
                                      .height *
                                  0.35,
                              child: CupertinoPicker(
                                children: heightList,
                                itemExtent: 50, //height of each item
                                looping: false,
                                onSelectedItemChanged: (int index) {
                                  heightText.text = heightStringList[index];
                                },
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text("Weight"),
                  SizedBox(width: 32),
                  Flexible(
                    child: CustomNumberField(
                        txt: weightText,
                        keyboard: TextInputType.number,
                        onChanged: (value) => _weight = value),
                  ),
                ],
              ),
              Row(
                children: [
                  Text("Length"),
                  SizedBox(width: 34),
                  Flexible(
                    child: CustomPressField(
                      control: lengthText,
                      press: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext builder) {
                            return Container(
                              height: MediaQuery.of(context)
                                      .copyWith()
                                      .size
                                      .height *
                                  0.35,
                              child: CupertinoPicker(
                                children: lengthList,
                                itemExtent: 50, //height of each item
                                looping: false,
                                onSelectedItemChanged: (int index) {
                                  lengthText.text = lengthStringList[index];
                                  _length = lengthStringList[index];
                                },
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text("Equipment"),
                  SizedBox(width: 10),
                  Flexible(
                    child: CustomPressField(
                      control: equipmentText,
                      press: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext builder) {
                            return Container(
                              height: MediaQuery.of(context)
                                      .copyWith()
                                      .size
                                      .height *
                                  0.35,
                              child: CupertinoPicker(
                                children: equipmentList,
                                itemExtent: 50, //height of each item
                                looping: false,
                                onSelectedItemChanged: (int index) {
                                  equipmentText.text =
                                      equipmentStringList[index];
                                  _equipment = equipmentStringList[index];
                                },
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text("Push Goal"),
                  SizedBox(width: 14),
                  Flexible(
                    child: CustomPressField(
                      control: pushGoalText,
                      press: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext builder) {
                            return Container(
                              height: MediaQuery.of(context)
                                      .copyWith()
                                      .size
                                      .height *
                                  0.35,
                              child: CupertinoPicker(
                                children: pushGoalList,
                                itemExtent: 50, //height of each item
                                looping: false,
                                onSelectedItemChanged: (int index) {
                                  pushGoalText.text = pushGoalStringList[index];
                                  _pushGoal = pushGoalStringList[index];
                                },
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text("Pull Goal"),
                  SizedBox(width: 22),
                  Flexible(
                    child: CustomPressField(
                      control: pullGoalText,
                      press: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext builder) {
                            return Container(
                              height: MediaQuery.of(context)
                                      .copyWith()
                                      .size
                                      .height *
                                  0.35,
                              child: CupertinoPicker(
                                children: pullGoalList,
                                itemExtent: 50, //height of each item
                                looping: false,
                                onSelectedItemChanged: (int index) {
                                  pullGoalText.text = pullGoalStringList[index];
                                  _pullGoal = pullGoalStringList[index];
                                },
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text("Fitness Goal"),
                  Flexible(
                    child: CustomPressField(
                      control: fitnessGoalText,
                      press: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext builder) {
                            return Container(
                              height: MediaQuery.of(context)
                                      .copyWith()
                                      .size
                                      .height *
                                  0.35,
                              child: CupertinoPicker(
                                children: fitnessGoalList,
                                itemExtent: 50, //height of each item
                                looping: false,
                                onSelectedItemChanged: (int index) {
                                  fitnessGoalText.text =
                                      fitnessGoalStringList[index];
                                  _fitnessGoal = fitnessGoalStringList[index];
                                },
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: RoundedButton(
                    text: "Save",
                    press: () {
                      updateUserData();
                      Navigator.of(context).pop();
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
