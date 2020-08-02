import 'package:flutter/material.dart';
import 'package:fit_app/constants.dart';

class RoutinePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RoutinePageState();
  }
}

class _RoutinePageState extends State<RoutinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fit For Life'),
        elevation: 5,
        backgroundColor: kPrimaryColor,
      ),
      body: Column(
        children: [
          Image.asset('assets/images/pullup_up.png'),
          Text('Exercise Name'),
          Text('Reps: #'),
          Text('Set: #'),
        ],
      ),
    );
  }
}
