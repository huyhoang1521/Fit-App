import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF6F35A5);
const kPrimaryLightColor = Color(0xFFF1E6FF);
const cream = Color(0xfff1f1f1);
const darkPrimaryColor = Color(0xFF272727);
const darkBackground = Color(0xFF141414); //Color(0xFF151515);
const darkText = kPrimaryLightColor; //Colors.grey;

//Consistent Spacing
const double newSect = 25;
const double titleDiv = 15;

Map<int, Color> color = {
  50: Color.fromRGBO(132, 62, 166, .1),
  100: Color.fromRGBO(132, 62, 166, .2),
  200: Color.fromRGBO(132, 62, 166, .3),
  300: Color.fromRGBO(132, 62, 166, .4),
  400: Color.fromRGBO(132, 62, 166, .5),
  500: Color.fromRGBO(132, 62, 166, .6),
  600: Color.fromRGBO(132, 62, 166, .7),
  700: Color.fromRGBO(132, 62, 166, .8),
  800: Color.fromRGBO(132, 62, 166, .9),
  900: Color.fromRGBO(132, 62, 166, 1),
};
Map<int, Color> lightColor = {
  50: Color.fromRGBO(246, 216, 246, .1),
  100: Color.fromRGBO(246, 216, 246, .2),
  200: Color.fromRGBO(246, 216, 246, .3),
  300: Color.fromRGBO(246, 216, 246, .4),
  400: Color.fromRGBO(246, 216, 246, .5),
  500: Color.fromRGBO(246, 216, 246, .6),
  600: Color.fromRGBO(246, 216, 246, .7),
  700: Color.fromRGBO(246, 216, 246, .8),
  800: Color.fromRGBO(246, 216, 246, .9),
  900: Color.fromRGBO(246, 216, 246, 1),
};

MaterialColor colorCustom = MaterialColor(0xFF6F35A5, color);
MaterialColor lightColorCustom = MaterialColor(0xFFF1E6FF, lightColor);

//Cover Filter For "Locked"
const ColorFilter invert = ColorFilter.matrix(<double>[
  0.5,
  0.8,
  0.01,
  0,
  0,
  0.5,
  0.8,
  0.01,
  0,
  0,
  0.5,
  0.8,
  0.01,
  0,
  0,
  0,
  0,
  0,
  1,
  0,
]);
