import 'package:fit_app/components/general/appbar/custom_appbar.dart';
import 'package:fit_app/screens/workout/complete.dart';
import 'package:fit_app/components/workout/buttons.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:quiver/async.dart';

IconData pause = Icons.pause_circle_filled;
IconData play = Icons.play_circle_filled;
IconData button = play;

class CoolDown extends StatefulWidget {
  @override
  _CoolDownState createState() => new _CoolDownState();
}

class _CoolDownState extends State<CoolDown> {
  int _start = 10;
  int _current = 10;
  bool _pressed = false;
  num _elapsedTime = 0;

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
          _elapsedTime = duration.elapsed.inSeconds;
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
        //MaterialPageRoute(builder: (context) => StartWorkout()),
      );
      print("Done");
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
      body: Center(
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
            Flexible(
              child: Image.asset(
                'assets/images/pullup_up.png',
              ),
            ),
            CircularPercentIndicator(
              radius: width * 0.3,
              lineWidth: 10.0,
              progressColor: Theme.of(context).primaryColor,
              percent: _elapsedTime / _start,
              center: Text(
                "$_current",
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            Buttons(
              enabled: _pressed,
              fFPressed: () {
                //Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Complete()),
                  //MaterialPageRoute(builder: (context) => StartWorkout()),
                );
              },
              rWPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Complete()),
                  //MaterialPageRoute(builder: (context) => StartWorkout()),
                );
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
    );
  }
}
