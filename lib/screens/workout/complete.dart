import 'package:fit_app/components/general/buttons/rounded_button.dart';
import 'package:fit_app/models/user_workout.dart';
import 'package:flutter/material.dart';

class Complete extends StatefulWidget {
  final UserWorkout workout;

  const Complete({Key key, this.workout}) : super(key: key);

  @override
  _CompleteState createState() => new _CompleteState(workout: this.workout);
}

class _CompleteState extends State<Complete> {
  UserWorkout workout;
  _CompleteState({this.workout});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          RoundedButton(
            color: Theme.of(context).buttonColor,
            //textColor: Colors.white,
            press: () {
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
            text: 'Finish',
            //onLongPress: ,
          )
        ],
      ),
    );
  }
}
