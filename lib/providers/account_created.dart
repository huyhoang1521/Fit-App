import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountCreated with ChangeNotifier {
  bool accountCreatedBool = false;

  final String key = "accountCreatedBool";
  SharedPreferences _prefs;

  AccountCreated() {
    _loadFromPrefs();
  }

  void setAccountCreated() {
    accountCreatedBool = true;
    _saveToPrefs();
    notifyListeners();
  }

  void resetAccountCreated() {
    accountCreatedBool = false;
    _saveToPrefs();
    notifyListeners();
  }

  _loadFromPrefs() async {
    await _initPrefs();
    accountCreatedBool = _prefs.getInt(key) ?? false;
    notifyListeners();
  }

  _saveToPrefs() async {
    await _initPrefs();
    _prefs.setBool(key, accountCreatedBool);
  }

  _initPrefs() async {
    if (_prefs == null) _prefs = await SharedPreferences.getInstance();
  }
}
