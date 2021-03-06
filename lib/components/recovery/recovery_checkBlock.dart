import 'package:fit_app/components/themes/constants.dart';
import 'package:flutter/material.dart';

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
          color: Theme.of(context).canvasColor,
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).shadowColor,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 5.0,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(icon),
            Text(
              text,
              style: Theme.of(context).textTheme.headline3,
            ),
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
