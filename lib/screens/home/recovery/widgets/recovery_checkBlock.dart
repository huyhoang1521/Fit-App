import 'package:flutter/material.dart';
import '../../../../constants.dart';

class RecoveryCheckBlock extends StatelessWidget {
  final String text;
  final Function press;
  final ValueChanged<bool> onChanged;
  final Color color, textColor;
  final IconData icon;
  final bool value;
  final Function update;
  const RecoveryCheckBlock({
    Key key,
    this.text,
    this.press,
    this.icon,
    this.color = kPrimaryColor,
    this.textColor = Colors.white,
    this.onChanged,
    this.value,
    this.update,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 5.0,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(icon),
            Text(text),
            Checkbox(
              checkColor: kPrimaryLightColor,
              activeColor: kPrimaryColor,
              value: value,
              onChanged: onChanged,
            ),
          ],
        ),
      ),
    );
  }
}
