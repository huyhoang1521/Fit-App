import 'package:flutter/material.dart';
import '../constants.dart';

class DrawerButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;
  final IconData icon;
  const DrawerButton({
    Key key,
    this.text,
    this.press,
    this.icon,
    this.color = kPrimaryColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0),
      child: FlatButton(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
        color: color,
        onPressed: press,
        child: Row(
          children: [
            Icon(icon),
            SizedBox(width: 40),
            Text(
              text,
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
