import 'dart:async';
import 'package:fit_app/components/general/appbar/custom_appbar.dart';
import 'package:fit_app/components/progress/exercise_info.dart';
import 'package:fit_app/screens/workout/complete.dart';
import 'package:fit_app/components/workout/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:quiver/async.dart';

IconData pause = Icons.pause_circle_filled;
IconData play = Icons.play_circle_filled;
IconData button = play;
bool _visible = false;
bool _startText = true;

class CoolDown extends StatefulWidget {
  @override
  _CoolDownState createState() => new _CoolDownState();
}

class _CoolDownState extends State<CoolDown> {
  int _start = 10;
  int _current = 10;
  int _counter = 5;
  bool _pressed = false;
  // num _elapsedTime = 0;

  void startTimer() {
    CountdownTimer countDownTimer = new CountdownTimer(
      new Duration(seconds: _start),
      new Duration(seconds: 1),
    );

    var sub = countDownTimer.listen(null);
    sub.onData((duration) {
      if (_pressed == true) {
        setState(() {
          _current = _start - duration.elapsed.inSeconds;
          //_elapsedTime = duration.elapsed.inSeconds;
        });
      } else {
        sub.pause();
        _start = _current;
      }
    });

    //when rest time is complete go to next page
    sub.onDone(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Complete()),
      );
      sub.cancel();
    });
  }

  void startCountdown() {
    CountdownTimer countDownTimer = new CountdownTimer(
      new Duration(seconds: 4),
      new Duration(seconds: 1),
    );

    var sub = countDownTimer.listen(null);
    sub.onData((duration) {
      if (_visible == true) {
        setState(() {
          _counter = 5 - duration.elapsed.inSeconds;
        });
      } else {
        sub.pause();
        _start = _current;
      }
    });
    //when countDown time is complete start workout
    sub.onDone(() {
      setState(() {
        _visible = !_visible;
        Timer(Duration(milliseconds: 500), () {
          setState(() {
            _startText = !_startText;
            Timer(Duration(milliseconds: 750), () {
              setState(() {
                _startText = !_startText;
              });
            });
          });
        });
      });
      sub.cancel();
    });
  }

  String stretchName = 'Downward Dog';
  @override
  Widget build(BuildContext context) {
    double width = (MediaQuery.of(context).size.width);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Theme.of(context)
                  .shadowColor, //Colors.grey.withOpacity(0.75),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 2),
            )
          ]),
          child: CustomAppBar(),
        ),
      ),
      body: Stack(children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(context).shadowColor,
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ]),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text('$stretchName',
                            style: Theme.of(context).textTheme.headline2),
                      ),
                    )),
              ),
              Stack(
                children: [
                  Container(
                    width: width,
                    child: Image.asset(
                      'assets/images/pullup_up.png',
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: AnimatedOpacity(
                        opacity: _visible ? 1.0 : 0.0,
                        duration: Duration(milliseconds: 500),
                        child: Text(
                          "$_counter",
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: AnimatedOpacity(
                        opacity: _startText ? 0.0 : 1.0,
                        duration: Duration(milliseconds: 1000),
                        child: Text(
                          'Start!',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: width * 0.05,
                    child: IconButton(
                      icon: Icon(Icons.info_outlined),
                      onPressed: () => _onButtonPressed(),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(context).shadowColor,
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Time Left:',
                              style: Theme.of(context).textTheme.headline2),
                          Text('$_current seconds',
                              style: Theme.of(context).textTheme.headline2),
                        ],
                      ),
                    )),
              ),
              FloatingActionButton(
                onPressed: () {
                  startCountdown();
                  setState(() {
                    _visible = !_visible;
                  });
                },
              ),
              Buttons(
                enabled: _pressed,
                fFPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Complete()),
                  );
                },
                rWPressed: () {
                  Navigator.pop(context);
                },
                pPPressed: () {
                  startTimer();
                  setState(() {
                    _pressed = !_pressed;
                  });
                },
              ),
            ],
          ),
        ),
      ]),
    );
  }

//Remove when Pull in real description
  String _descr =
      "Start in plank postion with arms straight and hands shoulder width apart and rings turned out with palms facing forward. Slowly lower body down by bending one arm while keeping the other arm as straight as possible. Lower until chest reaches hands and then push explosively until in starting position. Repeat and switch roles of arms. Keep body as straight as possible for duration of exercise by squezing glutes and keeping core engaged. ";

  void _onButtonPressed() {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        )),
        context: context,
        builder: (context) {
          return Container(
            child: ExerciseInfo(
              tier: 'Fundamentals',
              exerciseType: 'Push',
              movementType: 'Concentric',
              position: 'vertical',
              description: _descr,
            ),
          );
        });
  }
}
