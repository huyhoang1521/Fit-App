import 'package:fit_app/components/rounded_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../../components/custom_text_field.dart';
import '../../../../models/user.dart';

class Edit extends StatefulWidget {
  final User user;
  final String uuid;

  const Edit({Key key, this.user, this.uuid}) : super(key: key);
  @override
  _Edit createState() => new _Edit(user: this.user, uuid: this.uuid);
}

class _Edit extends State<Edit> {
  final User user;
  final String uuid;
  _Edit({this.user, this.uuid});

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Fit With Nick!'),
        elevation: 5,
      ),
      body: Container(
        width: _width,
        height: _height,
        margin: EdgeInsets.symmetric(vertical: 5),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  Text("First Name"),
                  SizedBox(width: 6),
                  Flexible(child: CustomTextField(hintText: user.firstName)),
                ],
              ),
              Row(
                children: [
                  Text("Last Name"),
                  SizedBox(width: 6),
                  Flexible(
                      child: CustomTextField(hintText: user.weight.toString())),
                ],
              ),
              Row(
                children: [
                  Text("Birth Date"),
                  SizedBox(width: 10),
                  Flexible(child: CustomTextField(hintText: user.dob)),
                ],
              ),
              Row(
                children: [
                  Text("Push Goal"),
                  SizedBox(width: 12),
                  Flexible(
                      child: CustomTextField(hintText: user.primaryPushGoal)),
                ],
              ),
              Row(
                children: [
                  Text("Pull Goal"),
                  SizedBox(width: 20),
                  Flexible(
                      child: CustomTextField(hintText: user.primaryPullGoal)),
                ],
              ),
              Row(
                children: [
                  Text("Fitness Goal"),
                  Flexible(child: CustomTextField(hintText: user.goal)),
                ],
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: RoundedButton(
                    text: "Save",
                    press: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
