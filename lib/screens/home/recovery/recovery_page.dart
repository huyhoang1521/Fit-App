import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../../../constants.dart';
import 'package:fit_app/screens/home/recovery/widgets/recovery_checkBlock.dart';
import 'package:flutter/animation.dart';
import 'package:fit_app/components/themes/icons/custom_icons_icons.dart';

class Recovery extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RecoveryState();
  }
}

//variables for checkbox's
bool activeRest = false;
bool sleep = false;
bool hydration = false;
bool stretch = false;
//Counter for Daily Progress Bar
double percentDaily = 0.0;

class _RecoveryState extends State<Recovery>
    with SingleTickerProviderStateMixin {
  Tween<double> _tween;
  Animation<double> percent;
  AnimationController animController;

  //Animation Controller for progress bar
  // Slowly fills bar instead of instantaneous
  @override
  void initState() {
    super.initState();
    animController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    _tween = Tween(begin: 0, end: pDaily());
    percent = _tween.animate(animController)
      ..addListener(() {
        // Empty setState because the updated value is already in the animation field
        setState(() {});
      });
  }

  //Calling current %boxes checked
  pDaily() {
    return percentDaily;
  }

  //updates beginning and end of animation
  //resets and progresses controller
  setNewPosition() {
    _tween.begin = _tween.end;
    animController.reset();
    _tween.end = pDaily();
    animController.forward();
  }

  //used to update % of boxes checked and update new position
  checkCheck(value) {
    setState(() {
      if (value == true) {
        setState(() {
          percentDaily += 0.25;
          setNewPosition();
        });
      } else
        setState(() {
          percentDaily -= 0.25;
          setNewPosition();
        });
    });
  }

  @override
  void dispose() {
    super.dispose();
    animController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fit For Life'),
        elevation: 5,
        //  backgroundColor: kPrimaryColor,
      ),
      body: ListView(
        primary: false,
        padding: const EdgeInsets.all(0),
        shrinkWrap: true,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              //padding: EdgeInsets.all(11),
//              decoration: BoxDecoration(
//                  color: kPrimaryLightColor,
//                  borderRadius: BorderRadius.circular(5),
//                  boxShadow: [
//                    BoxShadow(
//                      color: Colors.grey.withOpacity(0.5),
//                      spreadRadius: 5,
//                      blurRadius: 7,
//                      offset: Offset(0, 3), // changes position of shadow
//                    ),
//                  ]),
              child: Opacity(
                opacity: 0.85,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    'Maximize your gains!',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
          RecoveryCheckBlock(
              text: 'Fully Hydrated',
              icon: CustomIcons.hydration,
              value: hydration,
              onChanged: (bool value) {
                hydration = value;
                checkCheck(value);
              }),
          RecoveryCheckBlock(
              text: 'Daily Active Rest',
              icon: CustomIcons.active__1_,
              value: activeRest,
              onChanged: (bool value) {
                activeRest = value;
                checkCheck(value);
              }),
          RecoveryCheckBlock(
              text: '~ 8 Hours of sleep',
              icon: Icons.snooze,
              value: sleep,
              onChanged: (bool value) {
                sleep = value;
                checkCheck(value);
              }),
          RecoveryCheckBlock(
              text: '5 minutes of stretching',
              icon: CustomIcons.stretching,
              value: stretch,
              onChanged: (bool value) {
                stretch = value;
                checkCheck(value);
              }),
          SizedBox(
            height: 15,
          ),
//          AnimatedBuilder(
//              animation: percent,
//              builder: (context, child) {
//                return CircularPercentIndicator(
//                  radius: 180.0,
//                  lineWidth: 12.0,
//                  percent: percent.value,
//                  progressColor: kPrimaryColor,
//                  center: Column(
//                    mainAxisAlignment: MainAxisAlignment.end,
//                    children: [
//                      ClipRRect(
//                        borderRadius: BorderRadius.circular(35),
//                        child: new Icon(
//                          Icons.battery_charging_full,
//                        ),
//                      ),
//                      Text(
//                        '% to optimal recovery',
//                        style: TextStyle(color: Colors.black),
//                      ),
//                      SizedBox(
//                        height: 75,
//                      ),
//                    ],
//                  ),
//                );
//              }),
          CircularPercentIndicator(
            radius: 180.0,
            lineWidth: 12.0,
            percent: percentDaily,
            progressColor: kPrimaryColor,
            animation: true,
            animateFromLastPercent: true,
            animationDuration: 1000,
            center: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(35),
                  child: new Icon(
                    Icons.battery_charging_full,
                  ),
                ),
                Text(
                  '% to optimal recovery',
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(
                  height: 75,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
