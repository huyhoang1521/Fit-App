import 'package:flutter/material.dart';
import 'custom_container.dart';
import '../constants.dart';

class CustomPassword extends StatelessWidget {
  final String hintText;
  final ValueChanged<String> onChanged;
  const CustomPassword({
    Key key,
    this.hintText,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: TextField(
        onChanged: onChanged,
        obscureText: true,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: hintText,
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: kPrimaryColor),
          ),
        ),
      ),
    );
  }
}
