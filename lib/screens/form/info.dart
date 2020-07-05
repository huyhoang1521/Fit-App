import 'package:fit_app/components/custom_text_field.dart';
import 'package:fit_app/constants.dart';
import 'package:fit_app/screens/form/sign_up.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../components/rounded_button.dart';
import '../../components/custom_press_field.dart';
import '../../components/custom_number_field.dart';
import '../../models/user.dart';
import 'goal.dart';

class Info extends StatefulWidget {
  final User user;

  const Info({Key key, this.user}) : super(key: key);
  @override
  _Info createState() => new _Info(user: this.user);
}

class _Info extends State<Info> {
  final User user;
  _Info({this.user});

  DateTime _dateTime = DateTime.now();
  var txt = TextEditingController();
  String _dob;
  int _weight;

  void setVars() {
    user.dob = txt.text;
    user.weight = _weight;
  }

  Widget datetime() {
    return CupertinoDatePicker(
      initialDateTime: DateTime.now(),
      onDateTimeChanged: (DateTime newdate) {
        print(newdate);
        _dateTime = newdate;
      },
      maximumDate: DateTime.now(),
      minimumYear: 1900,
      maximumYear: DateTime.now().year,
      mode: CupertinoDatePickerMode.date,
    );
  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    const IconData arrow_back_ios =
        IconData(0xe5e0, fontFamily: 'MaterialIcons', matchTextDirection: true);
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(arrow_back_ios),
          color: kPrimaryColor,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignUp(user: user)));
          },
        ),
      ),
      body: Container(
          width: _width,
          height: _height,
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                SizedBox(height: _height * .05),
                Text("More Information",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center),
                SizedBox(height: _height * .025),
                CustomPressField(
                  hintText: "Date of Birth",
                  control: txt,
                  press: () {
                    print("tapped");
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext builder) {
                          return Container(
                              height: MediaQuery.of(context)
                                      .copyWith()
                                      .size
                                      .height /
                                  3,
                              child: datetime());
                        });
                    txt.text = _dateTime.toString();
                  },
                ),
                CustomNumberField(
                    hintText: "Weight",
                    keyboard: TextInputType.number,
                    onChanged: (value) => _weight = int.parse(value)),
                SizedBox(height: _height * .04),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                      "By signing up, you agree to the Terms of Services and Privacy Policy, including Cookie Use. Others will be able to find you by email or phone number when provided.",
                      style: TextStyle(fontSize: 15),
                      textAlign: TextAlign.left),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: RoundedButton(
                      text: "Next",
                      press: () {
                        setVars();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Goal(user: user)),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ))),
    );
  }
}
