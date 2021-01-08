import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WorkoutProcess with ChangeNotifier {
  SharedPreferences _prefs;
  bool workoutInProgress = false;
  int exerciseCount = 0;

  WorkoutProcess() {
    _loadFromPrefs("workoutInProgress", "exerciseCount");
  }

  void setWorkoutInProgress(bool _workoutInProgressBool) {
    workoutInProgress = _workoutInProgressBool;
    _saveToPrefs("workoutInProgress");
    notifyListeners();
  }

  void incrementExerciseCount() {
    exerciseCount++;
    _saveToPrefs("exerciseCount");
    notifyListeners();
  }

  void clearCount() {
    exerciseCount = 0;
    _saveToPrefs("exerciseCount");
    notifyListeners();
  }

  _loadFromPrefs(String inProgressKey, String exerciseCoutKey) async {
    await _initPrefs();
    workoutInProgress = _prefs.getBool(inProgressKey) ?? true;
    exerciseCount = _prefs.getInt(exerciseCoutKey) ?? 0;
    notifyListeners();
  }

  _saveToPrefs(String key) async {
    await _initPrefs();
    if (key == "workoutInProgress")
      _prefs.setBool(key, workoutInProgress);
    else
      _prefs.setInt(key, exerciseCount);
  }

  _initPrefs() async {
    if (_prefs == null) _prefs = await SharedPreferences.getInstance();
  }
}
