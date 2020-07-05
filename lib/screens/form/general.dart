import 'package:flutter/material.dart';
import '../../components/rounded_button.dart';
import '../../components/rounded_input_field.dart';
import '../../models/User.dart';
import 'goal.dart';

class General extends StatefulWidget {
  final User user;

  const General({Key key, this.user}) : super(key: key);

  @override
  _GeneralState createState() => _GeneralState(user: this.user);
}

class _GeneralState extends State<General> {
  final User user;

  _GeneralState({this.user});
  @override
  Widget build(BuildContext context) {
    print("first name is " + user.firstName + "!!!!!!!!!!!!!!!!!!!!!!!");
    print("last name is " + user.lastName + "!!!!!!!!!!!!!!!!!!!!!!!");
    print("email is " + user.email + "!!!!!!!!!!!!!!!!!!!!!!!");
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    DateTime _dateTime;
    String _date = "Not set";
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
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                      "Please answer these quick questions. You'll have your own custom workout routine in no time.",
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.center),
                ),
                SizedBox(height: _height * .02),
                RoundedInputField(
                  hintText: "Age",
                  onChanged: (value) {
                    showDatePicker(
                        context: context,
                        initialDate:
                            _dateTime == null ? DateTime.now() : _dateTime,
                        firstDate: DateTime(1930),
                        lastDate: DateTime.now());
                  },
                ),
                FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(29)),
                  onPressed: () {
                    showDatePicker(
                        context: context,
                        initialDate:
                            _dateTime == null ? DateTime.now() : _dateTime,
                        firstDate: DateTime(1930),
                        lastDate: DateTime.now());
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    alignment: Alignment.center,
                    width: _width * 0.8,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.date_range,
                                    size: 18.0,
                                    color: Colors.teal,
                                  ),
                                  Text(
                                    " $_date",
                                    style: TextStyle(
                                        color: Colors.teal,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Text(
                          "  Change",
                          style: TextStyle(
                              color: Colors.teal,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0),
                        ),
                      ],
                    ),
                  ),
                  color: Colors.white,
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
