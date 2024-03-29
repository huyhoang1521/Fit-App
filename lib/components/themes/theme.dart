import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'constants.dart';

ThemeData light = ThemeData(
  shadowColor: Colors.grey.withOpacity(0.75),
  cupertinoOverrideTheme: CupertinoThemeData(
      textTheme: CupertinoTextThemeData(
    dateTimePickerTextStyle: TextStyle(
      color: colorCustom,
      fontSize: 26,
    ),
    pickerTextStyle: TextStyle(
      color: colorCustom,
      fontSize: 26,
    ),
  )),
  appBarTheme: AppBarTheme(
    color: kPrimaryColor,
    elevation: 10,
    iconTheme: IconThemeData(
      color: Color(0xfff1f1f1),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 2,
    ),
  ),
  iconTheme: IconThemeData(
    color: Color(0xfff1f1f1),
  ),
  brightness: Brightness.light,
  primaryColor: colorCustom,
  //primarySwatch: colorCustom,
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: colorCustom,
  ).copyWith(
    secondary: Colors.white,
  ),
  scaffoldBackgroundColor: Color(0xfff1f1f1),
  canvasColor: Color(0xfff1f1f1), //Colors.white,
  unselectedWidgetColor: Colors.black,
  buttonTheme: ButtonThemeData(
    buttonColor: kPrimaryColor,
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
    // hl4 Used for Appbar Name
    headline4: TextStyle(
        fontSize: 20,
        fontFamily: 'Montserrat',
        fontStyle: FontStyle.normal,
        color: Colors.white),
    headline5: TextStyle(
        fontSize: 55,
        fontFamily: 'OpenSans',
        color: kPrimaryColor,
        fontWeight: FontWeight.normal),
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
      fontSize: 18.0,
      height: 1.45,
      fontFamily: 'Montserrat',
      fontStyle: FontStyle.normal,
    ),
  ),
);

ThemeData dark = ThemeData(
  shadowColor: darkBackground,
  cupertinoOverrideTheme: CupertinoThemeData(
      textTheme: CupertinoTextThemeData(
    dateTimePickerTextStyle: TextStyle(
      color: darkText,
      fontSize: 26,
    ),
    pickerTextStyle: TextStyle(
      color: darkText,
      fontSize: 26,
    ),
  )),
  appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(
      color: kPrimaryLightColor,
    ),
    color: darkBackground, //Color(0xFF272727),
    elevation: 10,
    toolbarTextStyle: TextStyle(
        fontSize: 20,
        fontFamily: 'Montserrat',
        fontStyle: FontStyle.normal,
        color: darkText),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 2,
    ),
  ),
  primaryColor: kPrimaryLightColor,
  brightness: Brightness.dark,
  primarySwatch: colorCustom,
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: colorCustom,
  ).copyWith(
    secondary: Color(0xFF272727),
  ),
  canvasColor: Color(0xFF272727), //Colors.black87,
  scaffoldBackgroundColor: darkBackground, //Colors.black12,
  //shadowColor: darkBackground,
  iconTheme: IconThemeData(
    color: kPrimaryLightColor,
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: kPrimaryColor,
    textTheme:
        ButtonTextTheme.primary, //  <-- this auto selects the right color
  ),
  textTheme: TextTheme(
      button: TextStyle(color: darkText),
      headline1: TextStyle(
          fontSize: 31,
          fontFamily: 'OpenSans',
          color: darkText,
          fontWeight: FontWeight.normal),
      headline2: TextStyle(
          fontSize: 26,
          fontFamily: 'Montserrat',
          fontStyle: FontStyle.normal,
          color: darkText),
      headline3: TextStyle(
        color: darkText,
        fontSize: 14.0,
        fontFamily: 'Montserrat',
        fontStyle: FontStyle.normal,
        //fontWeight: FontWeight.bold
      ),
      headline4: TextStyle(
          fontSize: 20,
          fontFamily: 'Montserrat',
          fontStyle: FontStyle.normal,
          color: darkText),
      headline5: TextStyle(
          fontSize: 55,
          fontFamily: 'OpenSans',
          color: darkText,
          fontWeight: FontWeight.normal),
      headline6: TextStyle(fontSize: 26.0, fontStyle: FontStyle.italic),
      bodyText1: TextStyle(
          color: darkText,
          fontSize: 14.0,
          fontFamily: 'Montserrat',
          fontStyle: FontStyle.normal),
      bodyText2: TextStyle(
        color: darkText,
        fontSize: 18.0,
        height: 1.45,
        fontFamily: 'Montserrat',
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
