import 'package:flutter/material.dart';
import 'custom_container.dart';
import '../constants.dart';

class CustomNumberField extends StatelessWidget {
  final String hintText;
  final ValueChanged<String> onChanged;
  final TextInputType keyboard;
  const CustomNumberField({
    Key key,
    this.hintText,
    this.onChanged,
    this.keyboard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: TextField(
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        keyboardType: keyboard,
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
