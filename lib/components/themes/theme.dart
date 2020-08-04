import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fit_app/constants.dart';

ThemeData light = ThemeData(
  brightness: Brightness.light,
  primarySwatch: colorCustom,
  accentColor: kPrimaryLightColor,
  scaffoldBackgroundColor: Color(0xfff1f1f1),
  canvasColor: Colors.white,
  unselectedWidgetColor: Colors.black,
  buttonTheme: ButtonThemeData(
    buttonColor: colorCustom,
    textTheme:
        ButtonTextTheme.primary, //  <-- this auto selects the right color
  ),
  // toggleButtonsTheme: ToggleButtonsThemeData(color: Colors.white),
  textTheme: TextTheme(
    //to use ex: style: Theme.of(context).textTheme.headline1
    button: TextStyle(color: colorCustom),
    headline1: TextStyle(
        fontSize: 31,
        fontFamily: 'OpenSans',
        color: kPrimaryColor,
        fontWeight: FontWeight.normal),
    headline2: TextStyle(
        fontSize: 26,
        fontFamily: 'Montserrat',
        fontStyle: FontStyle.normal,
        color: colorCustom),
    headline4: TextStyle(
        fontSize: 20,
        fontFamily: 'Montserrat',
        fontStyle: FontStyle.normal,
        color: colorCustom),
    headline6: TextStyle(color: kPrimaryColor, fontSize: 26.0),
    headline3: TextStyle(
      color: Colors.black,
      fontSize: 14.0,
      fontFamily: 'Montserrat',
      fontStyle: FontStyle.normal,
      //fontWeight: FontWeight.bold
    ),
    bodyText1: TextStyle(
        color: kPrimaryColor,
        fontSize: 14.0,
        fontFamily: 'Montserrat',
        fontStyle: FontStyle.normal),
    bodyText2: TextStyle(
      color: kPrimaryColor,
      fontSize: 14.0,
      fontFamily: 'OpenSans',
      fontStyle: FontStyle.normal,
    ),
  ),
);

ThemeData dark = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: colorCustom,
  accentColor: lightColorCustom,
  canvasColor: Colors.black12,
  buttonTheme: ButtonThemeData(
    buttonColor: lightColorCustom,
    textTheme:
        ButtonTextTheme.primary, //  <-- this auto selects the right color
  ),
  textTheme: TextTheme(
      button: TextStyle(color: Colors.grey),
      headline1: TextStyle(
          fontSize: 31,
          fontFamily: 'OpenSans',
          color: Colors.grey,
          fontWeight: FontWeight.normal),
      headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
      bodyText2: TextStyle(
        color: kPrimaryColor,
        fontSize: 14.0,
        fontFamily: 'OpenSans',
        fontStyle: FontStyle.normal,
      )),
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
