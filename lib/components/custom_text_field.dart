import 'package:flutter/material.dart';
import 'custom_container.dart';
import 'constants.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final ValueChanged<String> onChanged;
  final TextEditingController txt;
  const CustomTextField({
    Key key,
    this.hintText,
    this.onChanged,
    this.txt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: TextField(
        onChanged: onChanged,
        controller: txt,
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
