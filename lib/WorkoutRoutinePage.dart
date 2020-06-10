import 'package:flutter/material.dart';

class WorkOutR extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _WorkOutRState();
  }
}

class Routine extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RoutineState();
  }
}

class _WorkOutRState extends State<WorkOutR> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: FractionalOffset.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(bottom: 10.0),
        child: GestureDetector(
          child: RaisedButton(
            elevation: 10.0,
            color: Colors.black26,
            disabledColor: Colors.blueGrey,
            textColor: Colors.white,
            disabledElevation: 0.0,
            onPressed: () {
              Routine();
            },
            child: Text('Start Workout'),
            //onLongPress: ,
          ),
        ),
      ),
    );
  }
}

class _RoutineState extends State<Routine> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text('Exercise num'),
        Icon(Icons.contact_phone),
      ],
    );
  }
}
