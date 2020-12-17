import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WorkoutInProgress with ChangeNotifier {
  bool workoutInProgressBool = false;
  final String key = "workoutInProgress";
  SharedPreferences _prefs;

  WorkoutInProgress() {
    _loadFromPrefs();
  }

  void setWorkoutInProgress(bool _workoutInProgressBool) {
    workoutInProgressBool = _workoutInProgressBool;
    _saveToPrefs();
    notifyListeners();
  }

  _loadFromPrefs() async {
    await _initPrefs();
    workoutInProgressBool = _prefs.getBool(key) ?? true;
    notifyListeners();
  }

  _saveToPrefs() async {
    await _initPrefs();
    _prefs.setBool(key, workoutInProgressBool);
  }

  _initPrefs() async {
    if (_prefs == null) _prefs = await SharedPreferences.getInstance();
  }
}
