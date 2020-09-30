import 'package:flutter/material.dart';
import 'custom_container.dart';
import 'constants.dart';

class CustomPressField extends StatelessWidget {
  final String hintText;
  final Function press;
  final TextEditingController control;
  const CustomPressField({Key key, this.hintText, this.press, this.control})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: TextFormField(
        cursorColor: kPrimaryColor,
        onTap: press,
        controller: control,
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
