import 'package:fit_app/components/constants.dart';
import 'package:fit_app/screens/form/first_view.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../widgets/provider_widget.dart';
import '../../components/rounded_button.dart';
import '../../components/custom_text_field.dart';
import '../../components/custom_password.dart';
import '../../models/fit_user.dart';
import 'info.dart';

class SignUp extends StatefulWidget {
  final FitUser user;
  final db = FirebaseFirestore.instance;

  SignUp({Key key, this.user}) : super(key: key);

  @override
  _SignUp createState() => _SignUp(user: this.user);
}

class _SignUp extends State<SignUp> {
  final FitUser user;

  _SignUp({this.user});

  final formKey = GlobalKey<FormState>();
  String _firstName, _lastName, _email, _password;

  void setVars() {
    user.firstName = _firstName;
    user.lastName = _lastName;
    user.email = _email;
  }

  void submit() async {
    try {
      final auth = ProviderWidget.of(context).auth;
      setVars();
      print("Email: " + _email);
      print("First Name :" + _firstName);
      print("Last Name: " + _lastName);
      await auth.createUserWithEmailAndPassword(
          _email, _password, (_firstName + _lastName));

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
                  onChanged: (value) => _firstName = value),
              CustomTextField(
                  hintText: "Last Name",
                  onChanged: (value) => _lastName = value),
              CustomTextField(
                  hintText: "Email", onChanged: (value) => _email = value),
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
