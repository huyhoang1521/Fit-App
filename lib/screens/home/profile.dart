import 'dart:ui';
import 'package:fit_app/components/text_field_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import '../../constants.dart';
import '../../components/rounded_button.dart';
import '../../components/rounded_image_button.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProfilePageState();
  }
}

final myUsername = TextEditingController(text: 'NICKY P');
final myBirthDate = TextEditingController(text: '09/21/1997');
final myWeight = TextEditingController(text: 'None of your god dam business');
final myHeight = TextEditingController(text: '214 cm');
String name = "NickyP";
double weight = 159.5;
TextEditingController weightController = TextEditingController();

bool strength = false;
bool hypertrophy = false;
bool weightLoss = false;
bool planche = false;
bool oneArmChinUp = false;
bool handStandPushup = false;
bool backLever = false;
bool frontLever = false;
bool oneArmPushUp = false;

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fit For Life'),
        elevation: 5,
        backgroundColor: kPrimaryColor,
      ),
      body: ListView(padding: const EdgeInsets.all(8), children: <Widget>[
        TextFieldContainer(
          child: Row(children: [
            Icon(
              Icons.person,
              color: kPrimaryColor,
            ),
            SizedBox(width: 10),
            Text(
              'Name: ',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w200),
            ),
            new Flexible(
              child: TextFormField(
                controller: TextEditingController()..text = name,
                onChanged: (text) => {},
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
          ]),
        ),
        TextFieldContainer(
          child: Row(children: [
            Icon(
              Icons.person,
              color: kPrimaryColor,
            ),
            SizedBox(width: 10),
            Text(
              'Weight: ',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w200),
            ),
            new Flexible(
              child: new TextField(
                onChanged: (value) {
                  name = value;
                },
                decoration: new InputDecoration(
                  border: InputBorder.none,
                ),
                keyboardType: TextInputType.numberWithOptions(),
                inputFormatters: <TextInputFormatter>[
                  WhitelistingTextInputFormatter.digitsOnly
                ], // Only numbers can be entered
              ),
            ),
          ]),
        ),
        TextFieldContainer(
          child: Row(children: [
            Icon(
              Icons.person,
              color: kPrimaryColor,
            ),
            SizedBox(width: 10),
            Text(
              'Height: ',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w200),
            ),
            new Flexible(
              child: TextField(
                controller: TextEditingController()..text = name,
                onChanged: (text) => {},
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
          ]),
        ),
        TextFieldContainer(
          child: Row(children: [
            Icon(
              Icons.person,
              color: kPrimaryColor,
            ),
            SizedBox(width: 10),
            Text(
              'Birth Date: ',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w200),
            ),
            new Flexible(
              child: TextFormField(
                controller: TextEditingController()..text = name,
                onChanged: (text) => {},
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
          ]),
        ),
        Text(
          'Workout Goals:',
          style: TextStyle(fontSize: 25, color: kPrimaryColor),
        ),
        GridView.count(
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            crossAxisCount: 2,
            shrinkWrap: true,
            children: <Widget>[
              RoundedImageButton(
                color: oneArmChinUp ? kPrimaryColor : kPrimaryLightColor,
                image: 'assets/images/OAC.jpg',
                press: () {
                  /*...*/
                  setState(() {
                    oneArmChinUp = !oneArmChinUp;
                    frontLever = false;
                    backLever = false;
                  });
                },
                text: "One Arm Chin Up",
                textSize: 17,
              ),
              RoundedImageButton(
                color: planche ? kPrimaryColor : kPrimaryLightColor,
                image: 'assets/images/FullPlanche.jpg',
                press: () {
                  /*...*/
                  setState(() {
                    planche = !planche;
                    handStandPushup = false;
                    oneArmPushUp = false;
                  });
                },
                text: "Planche",
                textSize: 17,
              ),
              RoundedImageButton(
                color: backLever ? kPrimaryColor : kPrimaryLightColor,
                image: 'assets/images/BackLever.jpg',
                press: () {
                  /*...*/
                  setState(() {
                    backLever = !backLever;
                    frontLever = false;
                    oneArmChinUp = false;
                  });
                },
                text: "Back Lever",
                textSize: 17,
              ),
              RoundedImageButton(
                color: oneArmPushUp ? kPrimaryColor : kPrimaryLightColor,
                image: 'assets/images/OneArmPushUp.jpeg',
                press: () {
                  /*...*/
                  setState(() {
                    oneArmPushUp = !oneArmPushUp;
                    handStandPushup = false;
                    planche = false;
                  });
                },
                text: "One Arm Push Up",
                textSize: 17,
              ),
              RoundedImageButton(
                color: frontLever ? kPrimaryColor : kPrimaryLightColor,
                image: 'assets/images/FrontLever.jpg',
                press: () {
                  /*...*/
                  setState(() {
                    frontLever = !frontLever;
                    oneArmChinUp = false;
                    backLever = false;
                  });
                },
                text: "Front Lever",
                textSize: 17,
              ),
              RoundedImageButton(
                color: handStandPushup ? kPrimaryColor : kPrimaryLightColor,
                image: 'assets/images/HandStandRollout.jpeg',
                press: () {
                  /*...*/
                  setState(() {
                    handStandPushup = !handStandPushup;
                    planche = false;
                    oneArmPushUp = false;
                  });
                },
                text: "Handstand Push-Up",
                textSize: 17,
              ),
            ]),
        Text(
          'Fitness Goal',
          style: TextStyle(color: kPrimaryColor, fontSize: 25),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
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
                }),
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
                }),
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
                }),
          ],
        ),
      ]),
    );
  }
}
