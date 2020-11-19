import 'package:flutter/material.dart';

class WorkoutInProgress with ChangeNotifier {
  bool workoutInProgressBool = false;

  void setWorkoutInProgress(bool _workoutInProgressBool) {
    workoutInProgressBool = _workoutInProgressBool;
    notifyListeners();
  }
}
