import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fit_app/constants.dart';

ThemeData light = ThemeData(
    brightness: Brightness.light,
    primarySwatch: colorCustom,
    accentColor: kPrimaryLightColor,
    scaffoldBackgroundColor: Color(0xfff1f1f1),
    buttonTheme: ButtonThemeData(
      buttonColor: colorCustom,
      textTheme:
          ButtonTextTheme.primary, //  <-- this auto selects the right color
    )
    // toggleButtonsTheme: ToggleButtonsThemeData(color: Colors.white),
    );

ThemeData dark = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: colorCustom,
  accentColor: lightColorCustom,
);

class ThemeNotifier extends ChangeNotifier {
  final String key = "theme";
  SharedPreferences _prefs;
  bool _darkTheme;

  bool get darkTheme => _darkTheme;

  ThemeNotifier() {
    _darkTheme = true;
    _loadFromPrefs();
  }

  toggleTheme() {
    _darkTheme = !_darkTheme;
    _saveToPrefs();
    notifyListeners();
  }

  _initPrefs() async {
    if (_prefs == null) _prefs = await SharedPreferences.getInstance();
  }

  _loadFromPrefs() async {
    await _initPrefs();
    _darkTheme = _prefs.getBool(key) ?? true;
    notifyListeners();
  }

  _saveToPrefs() async {
    await _initPrefs();
    _prefs.setBool(key, _darkTheme);
  }
}
