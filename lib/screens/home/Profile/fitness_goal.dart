import 'package:flutter/material.dart';
import '../../../constants.dart';
import 'dart:ui';

class FitnessGoal extends StatelessWidget {
  final String text;
  final IconData icon;
  final String userData;
  final Function press;
  final bool goal;
  const FitnessGoal({
    Key key,
    this.text,
    this.icon,
    this.userData,
    this.press,
    this.goal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _fitWidth = (MediaQuery.of(context).size.width) - 120 - 8 - 8;
    return GestureDetector(
      onTap: press,
      child: AnimatedContainer(
        width: goal ? _fitWidth : 64.0,
        height: 75.0,
        decoration: BoxDecoration(
            color: goal ? kPrimaryColor : kPrimaryLightColor,
            borderRadius: BorderRadiusDirectional.circular(30)),
        alignment: Alignment.center,
        duration: Duration(seconds: 2),
        curve: Curves.fastOutSlowIn,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(4.0, 0, 5, 0),
            child: Icon(
              icon,
              size: 50,
            ),
          ),
          //SizedBox(width: goal ? 5 : 0),
          Flexible(
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                text,
                style: TextStyle(color: kPrimaryLightColor),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
