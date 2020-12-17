//import 'package:fit_app/screens/form/welcome.dart';
import 'package:fit_app/components/themes/constants.dart';
import 'package:fit_app/components/general/buttons/rounded_create_button.dart';
import 'package:fit_app/providers/workout_in_progress.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:provider/provider.dart';
import '../../models/fit_user.dart';
import 'sign_up.dart';

class FirstView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/logos 4 v4.png',
            color: Colors.white, fit: BoxFit.contain, height: 80),
        backgroundColor: kPrimaryColor,
        elevation: 0.0,
        leading: new Container(),
      ),
      body: Container(
        width: _width,
        height: _height,
        color: kPrimaryColor,
        child: SafeArea(
          child: Column(
            children: <Widget>[
              SizedBox(height: _height * 0.25),
              AutoSizeText(
                "Let’s get your first workout created",
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: _height * 0.05),
              RoundedCreateButton(
                color: Colors.white,
                text: "Create account",
                textColor: kPrimaryColor,
                press: () {
                  final workoutInProgress =
                      Provider.of<WorkoutInProgress>(context, listen: false);
                  workoutInProgress.setWorkoutInProgress(false);
                  final FitUser user = new FitUser(null, null, null, null, null,
                      null, null, null, null, null, null, null);

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUp(user: user)),
                  );
                },
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Already have an account?",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      FlatButton(
                        child: Text(
                          "Sign In",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed('/signIn');
                        },
                      ),
                    ],
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
