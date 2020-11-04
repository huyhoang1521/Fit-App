import 'package:fit_app/screens/home/components/custom_appbar.dart';
import 'package:fit_app/screens/home/components/drawer.dart';
import 'overview_button.dart';
import '../Overview/prog_page.dart';
import '../Overview/skill_viewer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fit_app/components/constants.dart';

class Overview extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _OverviewState();
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

Color green = const Color.fromRGBO(30, 201, 116, 1.0);

Widget _myAnimatedWidget = OverviewButton(
  text: 'Back Lever',
  percentText: '30%',
  percent: 0.3,
  image: 'assets/images/BackLever.jpg',
  press: () {},
);

class _OverviewState extends State<Overview>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    double _fitWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: AppDrawer(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Text(
                'Progress Goals',
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            SizedBox(
              height: titleDiv,
            ),
            OverviewButton(
              text: 'One Arm Chin-up',
              percentText: '',
              percent: 0.5,
              image: 'assets/images/BackLever.jpg',
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProgressPage()),
                );
              },
            ),
            Stack(children: [
              OverviewButton(
                text: 'Back Lever',
                percentText: '',
                percent: 0.3,
                image: 'assets/images/pullup_up.png',
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProgressPage()),
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
                              _myAnimatedWidget = OverviewButton(
                                text: text3,
                                percentText: '',
                                percent: 0.3,
                                image: 'assets/images/pullup_up.png',
                                press: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ProgressPage()),
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
                              _myAnimatedWidget = OverviewButton(
                                text: text3,
                                percentText: '',
                                percent: 0.3,
                                image: 'assets/images/pullup_up.png',
                                press: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ProgressPage()),
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
                              _myAnimatedWidget = OverviewButton(
                                text: text3,
                                percentText: '',
                                percent: 0.3,
                                image: 'assets/images/pullup_up.png',
                                press: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ProgressPage()),
                                  );
                                },
                              );
                            });
                          },
                        );
                      }
                      if (pressed == false) {
                        setState(() {
                          _myAnimatedWidget = OverviewButton(
                            text: text3,
                            percentText: '',
                            percent: 0.3,
                            image: 'assets/images/pullup_up.png',
                            press: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProgressPage()),
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
