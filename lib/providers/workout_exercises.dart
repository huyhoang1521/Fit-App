import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WorkoutExercises with ChangeNotifier {
  List<Map<String, dynamic>> warmups = [];
  List<Map<String, dynamic>> exercises = [];
  bool listsNotSet = false;
  final String key = "listsNotSet";
  SharedPreferences _prefs;

  WorkoutExercises() {
    _loadFromPrefs();
  }

  void setExercisesList(List<Map<String, dynamic>> _completeList) {
    warmups = _completeList;
    notifyListeners();
  }

  void setWarmupList(List<Map<String, dynamic>> _completeList) {
    exercises = _completeList;
    notifyListeners();
  }

  void setListsNotSet(bool _completeList) {
    listsNotSet = _completeList;
    _saveToPrefs();
    notifyListeners();
  }

  _loadFromPrefs() async {
    await _initPrefs();
    listsNotSet = _prefs.getBool(key) ?? false;
    notifyListeners();
  }

  _saveToPrefs() async {
    await _initPrefs();
    _prefs.setBool(key, listsNotSet);
  }

  _initPrefs() async {
    if (_prefs == null) _prefs = await SharedPreferences.getInstance();
  }
}
