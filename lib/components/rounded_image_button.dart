import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class RoundedImageButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, buttonColor;
  final String image;
  const RoundedImageButton({
    Key key,
    this.text,
    this.press,
    this.color,
    this.buttonColor,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: GestureDetector(
        onTap: press,
        child: Container(
          width: size.width * 0.8,
          height: 100,
          decoration: BoxDecoration(
              color:
                  buttonColor, //frontLever ? kPrimaryColor : kPrimaryLightColor,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ]),
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                image,
                width: 150,
              ),
              SizedBox(
                width: 65,
              ),
              Text(
                text,
                style: TextStyle(
                  color: color, // frontLever ? Colors.white : kPrimaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
//        ClipRRect(
//          borderRadius: BorderRadius.circular(50),
//          child: Container(
//            height: 110,
//            padding: const EdgeInsets.all(8),
//            decoration: BoxDecoration(
//              borderRadius: BorderRadius.circular(50),
//              color: color,
//            ),
//            child: ClipRRect(
//              borderRadius: BorderRadius.circular(50),
//              child: RaisedButton(
//                color: buttonColor,
//                padding: const EdgeInsets.symmetric(),
//                child: Image.asset(
//                  image,
//                  alignment: Alignment.center,
//                ),
//                onPressed: press,
//              ),
//            ),
//            //Spacer(),
//          ),
//        ),
//        Text(
//          text,
//          style: TextStyle(color: kPrimaryColor, fontSize: textSize),
//        ),
  }
}
