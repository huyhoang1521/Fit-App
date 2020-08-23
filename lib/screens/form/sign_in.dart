import 'package:fit_app/constants.dart';
import 'package:fit_app/screens/form/first_view.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../widgets/provider_widget.dart';
import '../../components/rounded_button.dart';
import '../../components/custom_text_field.dart';
import '../../components/custom_password.dart';

class SignIn extends StatefulWidget {
  final db = Firestore.instance;

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
      print("_email " + _email);
      Navigator.of(context).pushReplacementNamed('/home');
    } catch (error) {
      print(error);
    }
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
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => FirstView()));
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
                Text("Create your account",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center),
                SizedBox(height: _height * .025),
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
                    child: RoundedButton(text: "Sign In", press: submit),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
