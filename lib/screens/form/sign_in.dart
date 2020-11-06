import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../components/general/provider/provider_widget.dart';
import '../../components/general/buttons/rounded_button.dart';
import '../../components/general/fields/custom_text_field.dart';
import '../../components/general/fields/custom_password.dart';

class SignIn extends StatefulWidget {
  final db = FirebaseFirestore.instance;

  SignIn({Key key}) : super(key: key);

  @override
  _SignIn createState() => _SignIn();
}

class _SignIn extends State<SignIn> {
  final formKey = GlobalKey<FormState>();
  String _email, _password;

  void submit() async {
    try {
      final auth = ProviderWidget.of(context).auth;
      await auth.signInWithEmailAndPassword(_email, _password);
      print("Email " + _email);
      Navigator.of(context).pushReplacementNamed('/home');
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
              Text("Sign In",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
              SizedBox(height: _height * .025),
              CustomTextField(
                  hintText: "Email", onChanged: (value) => _email = value),
              CustomPassword(
                  hintText: "Password",
                  onChanged: (value) => _password = value),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: RoundedButton(text: "Sign In", press: submit),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
