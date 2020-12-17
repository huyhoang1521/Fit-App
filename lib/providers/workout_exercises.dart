import 'package:flutter/material.dart';

class WorkoutExercises with ChangeNotifier {
  List<Map<String, dynamic>> exercises = new List();
  List<Map<String, dynamic>> warmups = new List();
  List<Map<String, dynamic>> progressions = new List();

  void setExercises(List<Map<String, dynamic>> _exercises) {
    exercises = _exercises;
  }
}
