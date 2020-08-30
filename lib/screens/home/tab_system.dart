import 'workout_routine.dart';
import 'package:flutter/material.dart';
import '../../algorithms/workout_constructor.dart';

class TabSystem extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TabSystemState();
}

class _TabSystemState extends State<TabSystem> {
  @override
  void initState() {
    print("in constructor");
    super.initState();

    Future.delayed(Duration.zero, () {
      callWorkout(context);
    });
  }

  Future callWorkout(BuildContext context) async {
    WorkoutConstructor().createWorkout(context);
  }

  @override
  Widget build(BuildContext context) {
    print("in build");
    return WorkOutR();
  }
}
