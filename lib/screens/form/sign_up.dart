import 'package:fit_app/providers/provider_widget.dart';
import 'package:flutter/material.dart';
import '../../components/general/buttons/rounded_button.dart';
import '../../components/general/fields/custom_text_field.dart';
import '../../components/general/fields/custom_password.dart';
import '../../models/fit_user.dart';
import 'info.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUp createState() => _SignUp();
}

class _SignUp extends State<SignUp> {
  String _password;

  final FitUser user = new FitUser(
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
  );

  void submit() async {
    try {
      print("Email: " + user.email);
      print("First Name: " + user.firstName);
      print("Last Name: " + user.lastName);
      final auth = ProviderWidget.of(context).auth;
      await auth.createUserWithEmailAndPassword(
          user.email, _password, (user.firstName + user.lastName));

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Info(user: user)),
      );
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: new AppBar(
          backgroundColor: Colors.transparent,
          bottomOpacity: 0.0,
          elevation: 0.0),
      body: Container(
        width: _width,
        height: _height,
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Create your account",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
              SizedBox(height: _height * .025),
              CustomTextField(
                  hintText: "First Name",
                  onChanged: (value) => user.firstName = value),
              CustomTextField(
                  hintText: "Last Name",
                  onChanged: (value) => user.lastName = value),
              CustomTextField(
                  hintText: "Email", onChanged: (value) => user.email = value),
              CustomPassword(
                  hintText: "Password",
                  onChanged: (value) => _password = value),
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
                  child: RoundedButton(text: "Next", press: submit),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
