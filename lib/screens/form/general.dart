import 'package:flutter/material.dart';
import '../../components/rounded_button.dart';
import '../../components/rounded_input_field.dart';
import 'goal.dart';

class General extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
          width: _width,
          height: _height,
          child: SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              children: <Widget>[
                SizedBox(height: _height * .05),
                Text(
                    "Please answer these quick questions. You'll have your own custom workout routine in no time.",
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center),
                SizedBox(height: _height * .02),
                RoundedInputField(
                  hintText: "Age",
                  onChanged: (value) {},
                ),
                RoundedInputField(
                  hintText: "Weight",
                  onChanged: (value) {},
                ),
                RoundedInputField(
                  hintText: "Equipment",
                  onChanged: (value) {},
                ),
                RoundedButton(
                  text: "Next",
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Goal()),
                    );
                  },
                ),
              ],
            ),
          ))),
    );
  }
}
