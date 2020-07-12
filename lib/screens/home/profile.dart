import 'dart:ui';
import 'package:fit_app/components/profile_info_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

// Need to be pulled/updated from users database
String name = "NickyP";
String weight = '159.5';

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

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get Fit With Nick!'),
        elevation: 5,
        backgroundColor: kPrimaryColor,
      ),
      body: ListView(padding: const EdgeInsets.all(8), children: <Widget>[
        Image.asset('assets/images/selfCare.jpg'),
        SizedBox(height: 20),
        ProfileTextBox(
          text: 'Name: ',
          icon: Icons.person_outline,
          userData: name,
        ),
        ProfileTextBox(
          text: 'Weight: ',
          icon: Icons.confirmation_number,
          userData: weight,
        ),
        ProfileTextBox(
          text: 'Height: ',
          icon: Icons.update,
          userData: name,
        ),
        ProfileTextBox(
          text: 'Birth Date: ',
          icon: Icons.cake,
          userData: name,
        ),
        SizedBox(height: 20),
        Text(
          'Desired Skills:',
          style: TextStyle(fontSize: 25, color: kPrimaryColor),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Pull',
              style: TextStyle(fontSize: 18, color: kPrimaryColor),
            ),
            Text(
              'Push',
              style: TextStyle(fontSize: 18, color: kPrimaryColor),
            ),
          ],
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
