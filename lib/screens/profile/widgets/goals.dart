import 'package:fit_app/components/rounded_image_button.dart';
import 'package:fit_app/models/fit_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../components/constants.dart';

class Goals extends StatefulWidget {
  final FitUser user;

  const Goals({Key key, this.user}) : super(key: key);
  @override
  _Goals createState() => new _Goals(user: this.user);
}

class _Goals extends State<Goals> {
  final FitUser user;

  _Goals({this.user});

  bool selected = false;
  bool editButton = false;

  String oACU = 'assets/images/OpenImg.png';
  String oACD = 'assets/images/pullup_up.png';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Primary Pull Goal',
                style: Theme.of(context).textTheme.headline1),
            SizedBox(height: titleDiv),
            RoundedImageButton(
              color: user.primaryPullGoal == "Front Lever"
                  ? Colors.white
                  : kPrimaryColor,
              buttonColor: user.primaryPullGoal == "Front Lever"
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).accentColor,
              text: 'Front Lever',
              image: 'assets/images/pullup_down.png',
            ),
            RoundedImageButton(
              color: user.primaryPullGoal == "One-Arm Chin-Up"
                  ? Colors.white
                  : kPrimaryColor,
              buttonColor: user.primaryPullGoal == "One-Arm Chin-Up"
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).accentColor,
              text: 'One-Arm Chin-Up',
              image: user.primaryPullGoal == "One-Arm Chin-Up" ? oACD : oACU,
            ),
            RoundedImageButton(
              color: user.primaryPullGoal == "Back Lever"
                  ? Colors.white
                  : kPrimaryColor,
              buttonColor: user.primaryPullGoal == "Back Lever"
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).accentColor,
              text: 'Back Lever',
              image: 'assets/images/pullup_up.png',
            ),
            SizedBox(height: newSect),
            Text('Primary Push Goal',
                style: Theme.of(context).textTheme.headline1),
            SizedBox(height: titleDiv),
            RoundedImageButton(
              color: user.primaryPushGoal == "Planche"
                  ? Colors.white
                  : Theme.of(context).primaryColor,
              buttonColor: user.primaryPushGoal == "Planche"
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).accentColor,
              text: 'Planche',
              image: 'assets/images/pullup_up.png',
            ),
            RoundedImageButton(
              color: user.primaryPushGoal == "Handstand Push-Up"
                  ? Colors.white
                  : Theme.of(context).primaryColor,
              buttonColor: user.primaryPushGoal == "Handstand Push-Up"
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).accentColor,
              text: 'Handstand Push-Up',
              image: 'assets/images/pullup_up.png',
            ),
            RoundedImageButton(
              color: user.primaryPushGoal == "One-Arm Push-Up"
                  ? Colors.white
                  : Theme.of(context).primaryColor,
              buttonColor: user.primaryPushGoal == "One-Arm Push-Up"
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).accentColor,
              text: 'One-Arm Push-Up',
              image: 'assets/images/pullup_up.png',
            ),
          ],
        ),
        SizedBox(height: newSect),
      ],
    );
  }
}
