import 'package:flutter/material.dart';
import '../constants.dart';

class RoundedImageButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, buttonColor;
  final String image;
  final double textSize;
  const RoundedImageButton({
    Key key,
    this.text,
    this.press,
    this.color,
    this.buttonColor,
    this.image,
    this.textSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Container(
            height: 110,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: color,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: RaisedButton(
                color: buttonColor,
                padding: const EdgeInsets.symmetric(),
                child: Image.asset(
                  image,
                  alignment: Alignment.center,
                ),
                onPressed: press,
              ),
            ),
            //Spacer(),
          ),
        ),
        Text(
          text,
          style: TextStyle(color: kPrimaryColor, fontSize: textSize),
        ),
      ],
    );
  }
}
