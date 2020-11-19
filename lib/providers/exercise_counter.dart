import 'package:flutter/material.dart';

class ExerciseCounter with ChangeNotifier {
  int exerciseCount = 0;
  bool justStarted = false;

  void incrementExerciseCount() {
    exerciseCount++;
    notifyListeners();
  }

  void setJustStarted() {
    justStarted = true;
    print("in isetJustStarted. justStarted " + justStarted.toString());
    notifyListeners();
  }
}
