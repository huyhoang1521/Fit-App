import 'dart:ui';
import 'package:fit_app/components/profile_info_text.dart';
import 'package:fit_app/components/themes/icons/custom_iconspt2_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../constants.dart';
import '../../components/rounded_button.dart';
import '../../components/rounded_image_button.dart';
import 'package:fit_app/components/themes/icons/custom_icons_icons.dart';

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
bool selected = false;

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
        Text(
          'Profile Info:',
          style: TextStyle(
            fontSize: 31,
            fontFamily: 'Montserrat',
            fontStyle: FontStyle.italic,
          ),
        ),
        SizedBox(height: 10),
        ProfileTextBox(
          text: 'Name: ',
          icon: Icons.person_outline,
          userData: name,
        ),
        ProfileTextBox(
          text: 'Weight: ',
          icon: CustomIcons.weight,
          userData: weight,
        ),
        ProfileTextBox(
          text: 'Height: ',
          icon: CustomIcons.height,
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
        Text('Pull:', style: Theme.of(context).textTheme.headline1),
        SizedBox(height: 35),
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
            ),
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
        SizedBox(height: 25),
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
            ),
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
        SizedBox(height: 25),
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
            ),
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
        Text('Push:', style: Theme.of(context).textTheme.headline1),
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
        FlatButton(
          color: cream,
          onPressed: () {
            /*...*/
            setState(() {
              oneArmChinUp = !oneArmChinUp;
              frontLever = false;
              backLever = false;
            });
          },
          child: Image.asset(
            'assets/images/planche2.png',
            width: 250,
          ),
        ),
        RoundedImageButton(
          color: oneArmChinUp ? kPrimaryColor : cream,
          buttonColor: oneArmChinUp ? kPrimaryColor : cream,
          image: 'assets/images/planche2.png',
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
          color: planche ? kPrimaryColor : cream,
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
        Text(
          'Fitness Goal',
          style: TextStyle(color: kPrimaryColor, fontSize: 25),
        ),
        SizedBox(
          height: 20,
        ),
        FittedBox(
          fit: BoxFit.fitWidth,
          child: Row(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (strength == false) {
                      strength = !strength;
                    }
                    hypertrophy = false;
                    weightLoss = false;
                  });
                },
                child: AnimatedContainer(
                  width: strength ? 225.0 : _fitWidth,
                  height: 50.0,
                  duration: Duration(milliseconds: 750),
                  decoration: BoxDecoration(
                      color: strength ? kPrimaryColor : kPrimaryLightColor,
                      borderRadius: BorderRadiusDirectional.circular(40)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Strength',
                        style: TextStyle(
                          color: strength ? Colors.white : kPrimaryColor,
                        ),
                      ),
                      //   Icon(CustomIcons.strength),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (hypertrophy == false) {
                      hypertrophy = !hypertrophy;
                    }
                    strength = false;
                    weightLoss = false;
                  });
                },
                child: AnimatedContainer(
                  width: hypertrophy ? 225.0 : _fitWidth,
                  height: 50.0,
                  duration: Duration(milliseconds: 750),
                  decoration: BoxDecoration(
                      color: hypertrophy ? kPrimaryColor : kPrimaryLightColor,
                      borderRadius: BorderRadiusDirectional.circular(40)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Hypertrophy',
                        style: TextStyle(
                          color: hypertrophy ? Colors.white : kPrimaryColor,
                        ),
                      ),
                      //  Icon(CustomIcons.hypertrophy),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (weightLoss == false) {
                      weightLoss = !weightLoss;
                    }
                    strength = false;
                    hypertrophy = false;
                  });
                },
                child: AnimatedContainer(
                  width: weightLoss ? 225.0 : _fitWidth,
                  height: 50.0,
                  duration: Duration(milliseconds: 750),
                  decoration: BoxDecoration(
                      color: weightLoss ? kPrimaryColor : kPrimaryLightColor,
                      borderRadius: BorderRadiusDirectional.circular(40)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Weight Loss',
                        style: TextStyle(
                          color: weightLoss ? Colors.white : kPrimaryColor,
                        ),
                      ),
                      //   Icon(CustomIconspt2.weight),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
