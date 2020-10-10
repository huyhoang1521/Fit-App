import 'package:fit_app/screens/home/custom_appbar.dart';
import 'package:fit_app/screens/workout/eccentric.dart';
import 'package:fit_app/screens/workout/isometric.dart';
import 'package:fit_app/screens/workout/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:quiver/async.dart';

class RestPage extends StatefulWidget {
  RestPage() : super();
  @override
  _RestPageState createState() => _RestPageState();
}

@override
State<StatefulWidget> createState() {
  return _RestPageState();
}

IconData pause = Icons.pause_circle_filled;
IconData play = Icons.play_circle_filled;
IconData button = play;
//bool _pressed = false;

class _RestPageState extends State<RestPage> {
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
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Eccentric()),
        //MaterialPageRoute(builder: (context) => StartWorkout()),
      );
      print("Done");
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
                //Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Isometric()),
                  //MaterialPageRoute(builder: (context) => StartWorkout()),
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
    );
  }
}
