import 'package:fit_app/components/general/appbar/custom_appbar.dart';
import 'package:fit_app/components/general/drawer/app_drawer.dart';
import 'package:fit_app/components/progress/percentage_button.dart';
import 'package:fit_app/components/progress/skill_button.dart';
import 'package:fit_app/screens/progress/stats.dart';
import 'package:flutter/material.dart';
import 'package:fit_app/components/themes/constants.dart';

class ProgressTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProgressTestState();
  }
}

bool pressed = false;
bool pressed1 = false;

bool op1 = false;
bool op2 = false;
bool op3 = false;

//Initial Values will be preferred Exercise from Firebase
String text1;
String text2;
//Initial Value should be highest percent of all exercises
String text3 = 'Back Lever';

String bL = 'Back Lever';
String fL = 'Front Lever';
String oAC = 'One Arm Chin Up';

Widget _myAnimatedWidget = PercentageButton(
  text: 'Back Lever',
  percentText: '30%',
  percent: 0.3,
  image: 'assets/images/BackLever.jpg',
  press: () {},
);

class _ProgressTestState extends State<ProgressTest>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    double _fitWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: AppDrawer(),
      body: Center(
        child: Column(
          children: [
            Stack(children: [
              PercentageButton(
                text: 'Back Lever',
                percentText: '',
                percent: 0.3,
                image: 'assets/images/pullup_up.png',
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Stats()),
                  );
                },
              ),
              AnimatedContainer(
                color: kPrimaryLightColor,
                duration: Duration(seconds: 1),
                width: pressed1 ? .88 * _fitWidth : 0,
                height: 160,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(
                        child: FittedBox(
                          fit: BoxFit.fitHeight,
                          child: GestureDetector(
                            child: Container(
                              height: 30,
                              width: .75 * _fitWidth,
                              decoration: BoxDecoration(
                                  color: kPrimaryColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              child: Center(
                                child: Text(
                                  'Back Lever',
                                  style: TextStyle(color: kPrimaryLightColor),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: FittedBox(
                          fit: BoxFit.fitHeight,
                          child: GestureDetector(
                            child: Container(
                              height: 30,
                              width: .75 * _fitWidth,
                              decoration: BoxDecoration(
                                  color: kPrimaryColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              child: Center(
                                child: Text(
                                  'Front Lever',
                                  style: TextStyle(color: kPrimaryLightColor),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: FittedBox(
                          fit: BoxFit.fitHeight,
                          child: GestureDetector(
                            child: Container(
                              height: 30,
                              width: .75 * _fitWidth,
                              decoration: BoxDecoration(
                                  color: kPrimaryColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              child: Center(
                                child: Text(
                                  'One Arm Pull Up',
                                  style: TextStyle(color: kPrimaryLightColor),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: IconButton(
                  icon: Icon(
                    Icons.more_horiz,
                    color: Theme.of(context).primaryColor,
                  ),
                  onPressed: () {
                    setState(() {
                      pressed = !pressed;
                    });
                  },
                ),
              ),
            ]),
            Stack(children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return ScaleTransition(
                    child: child,
                    scale: animation,
                  );
                },
                child: _myAnimatedWidget,
              ),
              Positioned(
                top: 10,
                right: 10,
                child: IconButton(
                  icon: Icon(
                    Icons.more_horiz,
                    color: Theme.of(context).primaryColor,
                  ),
                  onPressed: () {
                    setState(() {
                      pressed = !pressed;
                      if (pressed == true) {
                        _myAnimatedWidget = SkillButton(
                          option1: oAC,
                          option2: fL,
                          option3: bL,
                          op1: op1,
                          op2: op2,
                          op3: op3,
                          press1: () {
                            setState(() {
                              op1 = true;
                              op2 = false;
                              op3 = false;
                              pressed = !pressed;
                              text3 = oAC;
                              _myAnimatedWidget = PercentageButton(
                                text: text3,
                                percentText: '',
                                percent: 0.3,
                                image: 'assets/images/pullup_up.png',
                                press: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Stats()),
                                  );
                                },
                              );
                            });
                          },
                          press2: () {
                            setState(() {
                              op1 = false;
                              op2 = true;
                              op3 = false;
                              pressed = !pressed;
                              text3 = fL;
                              _myAnimatedWidget = PercentageButton(
                                text: text3,
                                percentText: '',
                                percent: 0.3,
                                image: 'assets/images/pullup_up.png',
                                press: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Stats()),
                                  );
                                },
                              );
                            });
                          },
                          press3: () {
                            setState(() {
                              op1 = false;
                              op2 = false;
                              op3 = true;
                              pressed = !pressed;
                              text3 = bL;
                              _myAnimatedWidget = PercentageButton(
                                text: text3,
                                percentText: '',
                                percent: 0.3,
                                image: 'assets/images/pullup_up.png',
                                press: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Stats()),
                                  );
                                },
                              );
                            });
                          },
                        );
                      }
                      if (pressed == false) {
                        setState(() {
                          _myAnimatedWidget = PercentageButton(
                            text: text3,
                            percentText: '',
                            percent: 0.3,
                            image: 'assets/images/pullup_up.png',
                            press: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Stats()),
                              );
                            },
                          );
                        });
                      }
                    });
                  },
                ),
              ),
            ])
          ],
        ),
      ),
    );
  }
}
//Todo Decide to use or delete
//Huy if you're reading this just delete this page lol
