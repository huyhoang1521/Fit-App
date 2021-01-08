import 'package:fit_app/components/general/buttons/rounded_button.dart';
import 'package:fit_app/models/user_workout.dart';
import 'package:fit_app/components/general/appbar/custom_appbar.dart';
import 'package:fit_app/screens/workout/cool_down.dart';
import 'package:flutter/material.dart';

class Summary extends StatefulWidget {
  final UserWorkout workout;

  const Summary({Key key, this.workout}) : super(key: key);

  @override
  _SummaryState createState() => new _SummaryState(workout: this.workout);
}

class _SummaryState extends State<Summary> {
  UserWorkout workout;
  _SummaryState({this.workout});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Type of Workout: Strength',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              'Duration: 55 minutes',
              style: Theme.of(context).textTheme.headline4,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RoundedButton(
                text: 'Lets Do it!',
                color: Theme.of(context).buttonColor,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CoolDown()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
