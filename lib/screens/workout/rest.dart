import 'package:fit_app/components/general/appbar/custom_appbar.dart';
import 'package:fit_app/models/user_workout.dart';
import 'package:fit_app/components/workout/buttons.dart';
import 'package:flutter/material.dart';
import 'package:quiver/async.dart';

IconData pause = Icons.pause_circle_filled;
IconData play = Icons.play_circle_filled;
IconData button = play;

class RestPage extends StatefulWidget {
  final UserWorkout workout;

  const RestPage({Key key, this.workout}) : super(key: key);

  @override
  _RestPageState createState() => new _RestPageState(workout: this.workout);
}

class _RestPageState extends State<RestPage> {
  UserWorkout workout;
  _RestPageState({this.workout});

  int _start = 10;
  int _current = 10;
  bool _pressed = false;

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
        });
      } else {
        sub.pause();
        _start = _current;
      }
    });

    //when rest time is complete go to next page
    sub.onDone(() {
      print("Done");
      Navigator.of(context).popUntil((route) => route.isFirst);
      /*Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Eccentric()),
        //MaterialPageRoute(builder: (context) => StartWorkout()),
      );*/

      sub.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    // double width = (MediaQuery.of(context).size.width);
    return Scaffold(
      appBar: CustomAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Rest',
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              "$_current",
              style: Theme.of(context).textTheme.headline5,
            ),
            Buttons(
              enabled: _pressed,
              fFPressed: () {
                //int count = 0;
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              rWPressed: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
                //Navigator.pop(context);
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
