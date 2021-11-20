import 'package:fit_app/components/themes/constants.dart';
import 'package:flutter/material.dart';
import '../../components/general/buttons/rounded_button.dart';
import '../../models/fit_user.dart';
import 'length.dart';

bool begginer = false;
bool intermediate = false;
bool expert = false;
bool pro = false;
bool no = false;
bool yes = false;

//TODO Update page to send Experience info to Firebase

class Experience extends StatefulWidget {
  final FitUser user;

  const Experience({Key key, this.user}) : super(key: key);
  @override
  _Experience createState() => new _Experience(user: this.user);
}

class _Experience extends State<Experience> {
  final FitUser user;
  _Experience({this.user});

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
              Text("Training Experience",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
              SizedBox(height: _height * .02),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                    "How many years have you been consistently working out?",
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.left),
              ),
              SizedBox(height: _height * .02),
              RoundedButton(
                  text: "< 1 Year ",
                  textColor: begginer ? Colors.white : kPrimaryColor,
                  color: begginer ? kPrimaryColor : kPrimaryLightColor,
                  press: () {
                    /*...*/
                    setState(() {
                      begginer = true;
                      intermediate = false;
                      expert = false;
                      pro = false;
                    });
                    // user.goal = "Strength";
                  }),
              SizedBox(height: _height * .01),
              RoundedButton(
                  text: "1-2 Years",
                  textColor: intermediate ? Colors.white : kPrimaryColor,
                  color: intermediate ? kPrimaryColor : kPrimaryLightColor,
                  press: () {
                    /*...*/
                    setState(() {
                      begginer = false;
                      intermediate = true;
                      expert = false;
                      pro = false;
                    });
                    //  user.goal = "Hypertrophy";
                  }),
              SizedBox(height: _height * .01),
              RoundedButton(
                  text: "3-4 Years",
                  textColor: expert ? Colors.white : kPrimaryColor,
                  color: expert ? kPrimaryColor : kPrimaryLightColor,
                  press: () {
                    /*...*/
                    setState(() {
                      begginer = false;
                      intermediate = false;
                      expert = true;
                      pro = false;
                    });
                    //  user.goal = "Weight Loss";
                  }),
              SizedBox(height: _height * .01),
              RoundedButton(
                  text: "> 4 years",
                  textColor: pro ? Colors.white : kPrimaryColor,
                  color: pro ? kPrimaryColor : kPrimaryLightColor,
                  press: () {
                    /*...*/
                    setState(() {
                      begginer = false;
                      intermediate = false;
                      expert = false;
                      pro = true;
                    });
                    //  user.goal = "Weight Loss";
                  }),
              SizedBox(height: _height * .025),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 25),
                child: Text("Have you ever trained calisthenics or gymnastics?",
                    style: TextStyle(fontSize: 18), textAlign: TextAlign.left),
              ),
              SizedBox(height: _height * .01),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(29),
                      // child: FlatButton(
                      //   padding:
                      //       EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                      //   color: no ? kPrimaryColor : kPrimaryLightColor,
                      //   onPressed: () {
                      //     setState(() {
                      //       no = true;
                      //       yes = false;
                      //     });
                      //   },
                      //   child: Text('No',
                      //       style: TextStyle(
                      //         color: no ? Colors.white : kPrimaryColor,
                      //       )),
                      // ),
                      child: TextButton(
                        onPressed:  () {
                          setState(() {
                            no = true;
                            yes = false;
                          });
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 40),
                          primary:  no ? kPrimaryColor : kPrimaryLightColor,
                        ),
                        child: Text('No',
                            style: TextStyle(
                              color: no ? Colors.white : kPrimaryColor,
                            ),),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(29),
                      // child: FlatButton(
                      //   padding:
                      //       EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                      //   color: yes ? kPrimaryColor : kPrimaryLightColor,
                      //   onPressed: () {
                      //     setState(() {
                      //       no = false;
                      //       yes = true;
                      //     });
                      //   },
                      //   child: Text('Yes',
                      //       style: TextStyle(
                      //         color: yes ? Colors.white : kPrimaryColor,
                      //       )),
                      // ),
                      child: TextButton(
                          onPressed:  () {
                          setState(() {
                            no = false;
                            yes = true;
                          });
                        },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 40),
                            primary:  yes ? kPrimaryColor : kPrimaryLightColor,
                          ),
                          child: Text('Yes',
                            style: TextStyle(
                              color: yes ? Colors.white : kPrimaryColor,
                            )),
                        ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: _height * .02),
              SizedBox(height: _height * .03),
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
