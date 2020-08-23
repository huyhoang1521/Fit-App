//import 'package:fit_app/screens/form/welcome.dart';
import 'package:fit_app/components/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../../models/user.dart';
import '../../constants.dart';
import 'sign_up.dart';

class FirstView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: _width,
        height: _height,
        color: kPrimaryColor,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                SizedBox(height: _height * 0.10),
                Text(
                  "Welcome",
                  style: TextStyle(fontSize: 44, color: Colors.white),
                ),
                SizedBox(height: _height * 0.10),
                AutoSizeText(
                  "Let’s get your first workout created",
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: _height * 0.05),
                RoundedButton(
                  color: Colors.white,
                  text: "Get Started",
                  textColor: kPrimaryColor,
                  press: () {
                    final User user = new User(null, null, null, null, null,
                        null, null, null, null, null);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SignUp(user: user)),
                    );
                  },
                ),
                SizedBox(height: _height * 0.05),
                FlatButton(
                  child: Text(
                    "Sign In",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('/signIn');
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
