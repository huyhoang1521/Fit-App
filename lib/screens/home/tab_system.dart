import 'workout_overview.dart';
import 'package:flutter/material.dart';
import '../../algorithms/create_workout.dart';

class TabSystem extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TabSystemState();
}

class _TabSystemState extends State<TabSystem> {
  @override
  void initState() {
    super.initState();

    /*Future.delayed(Duration.zero, () {
      callWorkout();
    });*/
  }

  Future callWorkout() async {
    CreateWorkout().createWorkout();
  }

  @override
  Widget build(BuildContext context) {
    return WorkOutR();
  }
}
