import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../components/general/buttons/rounded_button.dart';
import '../../components/general/fields/custom_press_field.dart';
import '../../components/general/fields/custom_number_field.dart';
import '../../models/fit_user.dart';
import 'goal.dart';

List<Widget> heightList = [];
List<String> heightStringList = [];
String dobString = "";

class Info extends StatefulWidget {
  final FitUser user;

  const Info({Key key, this.user}) : super(key: key);
  @override
  _Info createState() => new _Info(user: this.user);
}

class _Info extends State<Info> {
  final FitUser user;
  _Info({this.user});

  DateTime _dateTime = DateTime.now();
  var dobController = TextEditingController();
  var heightController = TextEditingController();

  void setHeightList() {
    for (int i = 3; i < 8; i++) {
      for (int x = 0; x < 12; x++) {
        heightList
            .add(Center(child: Text(i.toString() + "'" + x.toString() + "\"")));
        heightStringList.add(i.toString() + "'" + x.toString() + "\"");
      }
    }
  }

  Widget dateOfBirth() {
    return CupertinoDatePicker(
      initialDateTime: _dateTime,
      onDateTimeChanged: (DateTime newdate) {
        String month;
        String day;
        if (newdate.month < 10) {
          month = "0" + newdate.month.toString();
        } else {
          month = newdate.month.toString();
        }
        if (newdate.day < 10) {
          day = "0" + newdate.day.toString();
        } else {
          day = newdate.day.toString();
        }
        dobString = month.toString() +
            "-" +
            day.toString() +
            "-" +
            newdate.year.toString();

        _dateTime = newdate;
        dobController.text = dobString;
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
    setHeightList();

    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
      ),
      body: Container(
        width: _width,
        height: _height,
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("More Information",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
              SizedBox(height: _height * .02),
              CustomPressField(
                hintText: "Date of Birth",
                control: dobController,
                press: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext builder) {
                        return Container(
                            height:
                                MediaQuery.of(context).copyWith().size.height /
                                    3,
                            child: dateOfBirth());
                      });
                  //dobController.text = dobString;
                },
              ),
              CustomPressField(
                hintText: "Height",
                control: heightController,
                press: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext builder) {
                      return Container(
                        height: MediaQuery.of(context).copyWith().size.height *
                            0.35,
                        child: CupertinoPicker(
                          children: heightList,
                          itemExtent: 50, //height of each item
                          looping: false,
                          onSelectedItemChanged: (int index) {
                            heightController.text = heightStringList[index];
                          },
                        ),
                      );
                    },
                  );
                },
              ),
              CustomNumberField(
                  hintText: "Weight",
                  keyboard: TextInputType.number,
                  onChanged: (value) => user.weight = int.parse(value)),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: RoundedButton(
                    text: "Next",
                    press: () {
                      user.dob = dobController.text;
                      user.height = heightController.text;
                      print("Date of Birth: " + dobString);
                      print("Height: " + heightController.text);
                      print("Weight: " + user.weight.toString());

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
        ),
      ),
    );
  }
}
