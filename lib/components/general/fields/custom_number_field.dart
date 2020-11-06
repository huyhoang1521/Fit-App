import 'package:flutter/material.dart';
import '../container/custom_container.dart';
import '../../themes/constants.dart';

class CustomNumberField extends StatelessWidget {
  final String hintText;
  final ValueChanged<String> onChanged;
  final TextInputType keyboard;
  final TextEditingController txt;
  const CustomNumberField({
    Key key,
    this.hintText,
    this.onChanged,
    this.keyboard,
    this.txt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: TextField(
        onChanged: onChanged,
        controller: txt,
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
