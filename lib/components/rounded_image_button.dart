import 'package:flutter/material.dart';
import '../constants.dart';

class RoundedImageButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color;
  final String image;
  final double textSize;
  const RoundedImageButton({
    Key key,
    this.text,
    this.press,
    this.color = kPrimaryColor,
    this.image,
    this.textSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            height: 110,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: color,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: RaisedButton(
                padding: const EdgeInsets.symmetric(),
                child: Image.asset(
                  image,
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
