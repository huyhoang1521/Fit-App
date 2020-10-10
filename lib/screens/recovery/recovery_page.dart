import 'package:fit_app/screens/home/custom_appbar.dart';
import 'package:fit_app/screens/home/drawer.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:fit_app/components/constants.dart';
import 'widgets/recovery_checkBlock.dart';
import 'package:flutter/animation.dart';
import 'package:fit_app/components/themes/icons/custom_icons_icons.dart';
import 'package:confetti/confetti.dart';
import 'dart:math';

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

  ConfettiController _controllerCenterLeft;
  ConfettiController _controllerCenter;
  ConfettiController _controllerCenterRight;
  ConfettiController _controllerTopCenter;
  ConfettiController _controllerBottomCenter;

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
    _controllerCenter =
        ConfettiController(duration: const Duration(seconds: 2));
    _controllerCenterRight =
        ConfettiController(duration: const Duration(seconds: 1));
    _controllerTopCenter =
        ConfettiController(duration: const Duration(seconds: 2));
    _controllerBottomCenter =
        ConfettiController(duration: const Duration(seconds: 2));
    _controllerCenterLeft =
        ConfettiController(duration: const Duration(seconds: 1));
    super.initState();
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
          cannonCheck(percentDaily);
        });
      } else
        setState(() {
          percentDaily -= 0.25;
          setNewPosition();
        });
    });
  }

  cannonCheck(percentDaily) {
    if (percentDaily == 1.00) {
      _controllerCenterRight.play();
      _controllerCenterLeft.play();
    }
  }

  @override
  void dispose() {
    super.dispose();
    animController.dispose();
    _controllerCenterLeft.dispose();
    _controllerCenter.dispose();
    _controllerCenterRight.dispose();
    _controllerTopCenter.dispose();
    _controllerBottomCenter.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: AppDrawer(),
      body: Stack(
        children: [
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Opacity(
                    opacity: 0.85,
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        'Maximize your gains!',
                        style: Theme.of(context).textTheme.headline1,
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
                height: 25,
              ),
              CircularPercentIndicator(
                radius: 200.0,
                lineWidth: 12.0,
                percent: percentDaily,
                progressColor: kPrimaryColor,
                animation: true,
                animateFromLastPercent: true,
                animationDuration: 1000,
                center: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(35),
                        child: new Icon(
                          Icons.battery_charging_full,
                          size: 40,
                        ),
                      ),
                      Text(
                        '%',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: ConfettiWidget(
              confettiController: _controllerCenterLeft,
              blastDirection: -pi / 4,
              // radial value - RIGHT
              emissionFrequency: 0.8,
              // minimumSize: const Size(10, 10),
              // set the minimum potential size for the confetti (width, height)
              // maximumSize: const Size(50, 50),
              // set the maximum potential size for the confetti (width, height)
              numberOfParticles: 2,
              particleDrag: 0.05,
              gravity: 0.05,
              shouldLoop: false,
              colors: const [
                kPrimaryColor,
                kPrimaryLightColor,
                Colors.white,
              ],
            ),
          ),

          Align(
            alignment: Alignment.centerRight,
            child: ConfettiWidget(
              confettiController: _controllerCenterRight,
              blastDirection: 5 * pi / 4, // radial value - LEFT
              particleDrag: 0.05, // apply drag to the confetti
              emissionFrequency: 0.8, // how often it should emit
              numberOfParticles: 2, // number of particles to emit
              gravity: 0.05, // gravity - or fall speed
              shouldLoop: false,
              colors: const [
                kPrimaryColor,
                kPrimaryLightColor,
                Colors.white,
              ], // manually specify the colors to be used
            ),
          ),
//          Align(
//            alignment: Alignment.centerRight,
//            child: FlatButton(
//              child: Icon(Iconicks.generated),
//              onPressed: () {
//                _controllerCenterRight.play();
//              },
//            ),
//          ),
//
//          //CENTER LEFT - Emit right
//          Align(
//            alignment: Alignment.centerLeft,
//            child: ConfettiWidget(
//              confettiController: _controllerCenterLeft,
//              blastDirection: 0, // radial value - RIGHT
//              emissionFrequency: 0.6,
//              minimumSize: const Size(10,
//                  10), // set the minimum potential size for the confetti (width, height)
//              maximumSize: const Size(50,
//                  50), // set the maximum potential size for the confetti (width, height)
//              numberOfParticles: 1,
//              gravity: 0.1,
//            ),
//          ),
//          Align(
//            alignment: Alignment.centerLeft,
//            child: FlatButton(
//              child: Icon(Iconicks.generated),
//              onPressed: () {
//                _controllerCenterLeft.play();
//              },
//            ),
//          ),
//
//          //TOP CENTER - shoot down
//          Align(
//            alignment: Alignment.topCenter,
//            child: ConfettiWidget(
//              confettiController: _controllerTopCenter,
//              blastDirection: pi / 2,
//              maxBlastForce: 5, // set a lower max blast force
//              minBlastForce: 2, // set a lower min blast force
//              emissionFrequency: 0.05,
//              numberOfParticles: 50, // a lot of particles at once
//              gravity: 1,
//            ),
//          ),
//          Align(
//            alignment: Alignment.topCenter,
//            child: FlatButton(
//              child: Icon(Iconicks.generated),
//              onPressed: () {
//                _controllerTopCenter.play();
//              },
//            ),
//          ),
//          //BOTTOM CENTER
//          Align(
//            alignment: Alignment.bottomCenter,
//            child: ConfettiWidget(
//              confettiController: _controllerBottomCenter,
//              blastDirection: -pi / 2,
//              emissionFrequency: 0.01,
//              numberOfParticles: 20,
//              maxBlastForce: 100,
//              minBlastForce: 80,
//              gravity: 0.3,
//            ),
//          ),
//          Align(
//            alignment: Alignment.bottomCenter,
//            child: FlatButton(
//              child: Icon(Iconicks.generated),
//              onPressed: () {
//                _controllerBottomCenter.play();
//              },
//            ),
//          ),
        ],
      ),
    );
  }
}
