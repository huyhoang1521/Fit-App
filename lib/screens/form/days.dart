import 'package:fit_app/components/themes/constants.dart';
import 'package:flutter/material.dart';
import '../../components/general/buttons/rounded_button.dart';
import '../../models/fit_user.dart';
import 'length.dart';

bool two = false;
bool three = true;
bool four = false;
bool five = false;

//TODO Update page to send Days info to Firebase

class Days extends StatefulWidget {
  final FitUser user;

  const Days({Key key, this.user}) : super(key: key);
  @override
  _Days createState() => new _Days(user: this.user);
}

class _Days extends State<Days> {
  final FitUser user;
  _Days({this.user});

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        elevation: 5,
      ),
      body: Container(
        width: _width,
        height: _height,
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("How Many Days a Week",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
              SizedBox(height: _height * .02),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 25),
                child: Text("This can be changed later in settings",
                    style: TextStyle(fontSize: 18), textAlign: TextAlign.left),
              ),
              SizedBox(height: _height * .02),
              RoundedButton(
                  text: "2 Days",
                  textColor: two ? Colors.white : kPrimaryColor,
                  color: two ? kPrimaryColor : kPrimaryLightColor,
                  press: () {
                    /*...*/
                    setState(() {
                      two = !two;
                      three = false;
                      four = false;
                      five = false;
                    });
                    // user.goal = "Strength";
                  }),
              SizedBox(height: _height * .01),
              RoundedButton(
                  text: "3 Days",
                  textColor: three ? Colors.white : kPrimaryColor,
                  color: three ? kPrimaryColor : kPrimaryLightColor,
                  press: () {
                    /*...*/
                    setState(() {
                      two = false;
                      three = !three;
                      four = false;
                      five = false;
                    });
                    //  user.goal = "Hypertrophy";
                  }),
              SizedBox(height: _height * .01),
              RoundedButton(
                  text: "4 Days",
                  textColor: four ? Colors.white : kPrimaryColor,
                  color: four ? kPrimaryColor : kPrimaryLightColor,
                  press: () {
                    /*...*/
                    setState(() {
                      two = false;
                      three = false;
                      four = !four;
                      five = false;
                    });
                  //  user.goal = "Weight Loss";
                  }),
              SizedBox(height: _height * .01),
              RoundedButton(
                  text: "5 Days",
                  textColor: five ? Colors.white : kPrimaryColor,
                  color: five ? kPrimaryColor : kPrimaryLightColor,
                  press: () {
                    /*...*/
                    setState(() {
                      two = false;
                      three = false;
                      four = false;
                      five = !five;
                    });
                    //  user.goal = "Weight Loss";
                  }),
              SizedBox(height: _height * .03),
              WorkoutDays(),
              // Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              //   Text('Sun'),
              //   Text('Mon'),
              //   Text('Tue'),
              //   Text('Wed'),
              //   Text('Thu'),
              //   Text('Fri'),
              //   Text('Sat'),
              // ]),
              // Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              //   Icon(Icons.circle),
              //   Icon(Icons.block),
              //   Icon(Icons.circle),
              //   Icon(Icons.block),
              //   Icon(Icons.circle),
              //   Icon(Icons.block),
              //   Icon(Icons.block),
              // ]),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: RoundedButton(
                    text: "Next",
                    press: () {
                      //print("Goal: " + user.goal);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Length(user: user)),
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

class WorkoutDays extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Text('Sun'),
            SizedBox(height: 10),
            Icon(Icons.circle),
          ],
        ),
        Column(
          children: [
            Text('Mon'),
            SizedBox(height: 10),
            Icon(Icons.block),
          ],
        ),
        Column(
          children: [
            Text('Tue'),
            SizedBox(height: 10),
            Icon(Icons.circle),
          ],
        ),
        Column(
          children: [
            Text('Wed'),
            SizedBox(height: 10),
            Icon(Icons.block),
          ],
        ),
        Column(
          children: [
            Text('Thu'),
            SizedBox(height: 10),
            Icon(Icons.circle),
          ],
        ),
        Column(
          children: [
            Text('Fri'),
            SizedBox(height: 10),
            Icon(Icons.block),
          ],
        ),
        Column(
          children: [
            Text('Sat'),
            SizedBox(height: 10),
            Icon(Icons.block),
          ],
        ),
      ],
    );
  }
}
