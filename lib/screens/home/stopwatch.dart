import 'package:fit_app/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'dart:async';

class StopWatch extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StopwatchState();
  }
}

class _StopwatchState extends State<StopWatch> {
  final StopWatchTimer _stopWatchTimer = StopWatchTimer(); // Create instance.

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() async {
    super.dispose();
    await _stopWatchTimer.dispose(); // Need to call dispose function.
  }

  IconData pause = Icons.pause_circle_filled;
  IconData play = Icons.play_circle_filled;

  // initialize variables
  bool startispressed = true;
  bool stopispressed = true;
  bool resetispressed = true;
  String stoptimetodisplay = '00:00:00';

  //create Stopwatch widget variable
  var swatch = Stopwatch();
  final dur = const Duration(seconds: 1);

  void starttimer() {
    Timer(dur, keeprunning);
  }

  //keeps time variable updated
  void keeprunning() {
    if (swatch.isRunning) {
      starttimer();
    }
    setState(() {
      stoptimetodisplay = swatch.elapsed.inHours.toString().padLeft(2, "0") +
          ":" +
          (swatch.elapsed.inMinutes % 60).toString().padLeft(2, "0") +
          ":" +
          (swatch.elapsed.inSeconds % 60).toString().padLeft(2, "0");
    });
  }

  void startstopwatch() {
    setState(() {
      stopispressed = false;
      startispressed = false;
      resetispressed = false;
    });
    swatch.start();
    starttimer();
  }

  void stopstopwatch() {
    setState(() {
      stopispressed = true;
      resetispressed = false;
      startispressed = true;
    });
    swatch.stop();
  }

  void resetstopwatch() {
    setState(() {
      startispressed = true;
      resetispressed = true;
    });
    swatch.reset();
    stoptimetodisplay = '00:00:00';
  }

  @override
  Widget build(BuildContext context) {
    double height = (MediaQuery.of(context).size.height);
    return Container(
      height: .75 * height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            child: Text(
              stoptimetodisplay,
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.fast_rewind),
                onPressed: () {
                  Navigator.pop(context);
                },
                iconSize: 75,
                color: kPrimaryColor,
              ),
              IconButton(
                icon: Icon(startispressed ? play : pause),
                color: kPrimaryColor,
                onPressed: startispressed ? startstopwatch : stopstopwatch,
                iconSize: 75,
              ),
              IconButton(
                icon: Icon(Icons.fast_forward),
                onPressed: () {}, //resetispressed ? null : resetstopwatch,
                iconSize: 75,
                color: kPrimaryColor,
              ),
            ],
          ),
//          Row(
//            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//            children: [
//              RaisedButton(
//                  color: Colors.green,
//                  disabledColor: kPrimaryLightColor,
//                  child: Text('Start'),
//                  onPressed: startispressed ? startstopwatch : null),
//              RaisedButton(
//                  color: Colors.red,
//                  disabledColor: kPrimaryLightColor,
//                  child: Text('Stop'),
//                  onPressed: stopispressed ? null : stopstopwatch),
//              RaisedButton(
//                  color: Colors.blue,
//                  disabledColor: kPrimaryLightColor,
//                  child: Text('Reset'),
//                  onPressed: resetispressed ? null : resetstopwatch),
//            ],
//          ),
        ],
      ),
    );
  }
}
