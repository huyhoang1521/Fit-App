import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExerciseCounter with ChangeNotifier {
  int exerciseCount = 0;
  bool justStarted = false;

  final String key = "exerciseCount";
  SharedPreferences _prefs;

  ExerciseCounter() {
    _loadFromPrefs();
  }

  void incrementExerciseCount() {
    exerciseCount++;
    _saveToPrefs();
    notifyListeners();
  }

  void clearCount() {
    exerciseCount = 0;
    _saveToPrefs();
    notifyListeners();
  }

  void setJustStarted() {
    justStarted = true;
    print("in setJustStarted. justStarted " + justStarted.toString());
    notifyListeners();
  }

  _loadFromPrefs() async {
    await _initPrefs();
    exerciseCount = _prefs.getInt(key) ?? 0;
    notifyListeners();
  }

  _saveToPrefs() async {
    await _initPrefs();
    _prefs.setInt(key, exerciseCount);
  }

  _initPrefs() async {
    if (_prefs == null) _prefs = await SharedPreferences.getInstance();
  }
}
