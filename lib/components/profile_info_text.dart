import 'package:flutter/material.dart';
import '../constants.dart';

class ProfileTextBox extends StatelessWidget {
  final String text;
  final IconData icon;
  final String userData;
  const ProfileTextBox({
    Key key,
    this.text,
    this.icon,
    this.userData,
  }) : super(key: key);

  // final controller = TextEditingController(text: 'NickyP');

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
          color: kPrimaryLightColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ]),
      child: Row(children: [
        Icon(
          icon,
          color: kPrimaryColor,
        ),
        SizedBox(width: 10),
        Text(
          text,
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w300),
        ),
        new Flexible(
          child: TextFormField(
            controller: TextEditingController()..text = userData,
            onChanged: (text) => {},
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ),
      ]),
    );
  }
}
