import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WorkoutFileData with ChangeNotifier {
  bool getWorkout = false;
  bool dataWritten = false;

  final String key = "dataWritten";
  SharedPreferences _prefs;

  WorkoutFileData() {
    _loadFromPrefs('dataWritten', 'getWorkout');
  }

  void setDataWritten(bool accountbool) {
    dataWritten = accountbool;
    _saveToPrefs('dataWritten');
    notifyListeners();
  }

  void setGetWorkout(bool accountbool) {
    getWorkout = accountbool;
    _saveToPrefs('getWorkout');
    notifyListeners();
  }

  _loadFromPrefs(String inProgressKey, String exerciseCoutKey) async {
    await _initPrefs();
    getWorkout = _prefs.getBool(inProgressKey) ?? true;
    dataWritten = _prefs.getBool(inProgressKey) ?? true;
    notifyListeners();
  }

  _saveToPrefs(String key) async {
    await _initPrefs();
    if (key == "workoutInProgress")
      _prefs.setBool(key, getWorkout);
    else
      _prefs.setBool(key, dataWritten);
  }

  _initPrefs() async {
    if (_prefs == null) _prefs = await SharedPreferences.getInstance();
  }
}
