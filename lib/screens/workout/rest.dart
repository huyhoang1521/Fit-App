import 'package:fit_app/components/general/appbar/custom_appbar.dart';
import 'package:fit_app/components/workout/buttons.dart';
import 'package:fit_app/providers/workout_exercises.dart';
import 'package:fit_app/providers/workout_process.dart';
import 'package:fit_app/screens/workout/exercise_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiver/async.dart';
import 'cool_down.dart';

List<Map<String, dynamic>> workoutList = new List();
IconData pause = Icons.pause_circle_filled;
IconData play = Icons.play_circle_filled;
IconData button = play;

class RestPage extends StatefulWidget {
  @override
  _RestPageState createState() => new _RestPageState();
}

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
      print("Done");
      if (workoutProcess.exerciseCount < workoutList.length) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => ExercisePage()),
            ModalRoute.withName("/exercisePage"));
      } else {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => CoolDown()),
            ModalRoute.withName("/exercisePage"));
      }
      sub.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    final workoutProcess = Provider.of<WorkoutProcess>(context, listen: true);
    final workoutExercises =
        Provider.of<WorkoutExercises>(context, listen: false);
    workoutList = workoutExercises.warmups + workoutExercises.exercises;
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
                if (workoutProcess.exerciseCount < workoutList.length) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => ExercisePage()),
                      ModalRoute.withName("/exercisePage"));
                } else {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => CoolDown()),
                      ModalRoute.withName("/exercisePage"));
                }
              },
              rWPressed: () {
                if (workoutProcess.exerciseCount < workoutList.length) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => ExercisePage()),
                      ModalRoute.withName("/exercisePage"));
                } else {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => CoolDown()),
                      ModalRoute.withName("/exercisePage"));
                }
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

//Todo Add Anecdotal tip "Cool app features and information"
