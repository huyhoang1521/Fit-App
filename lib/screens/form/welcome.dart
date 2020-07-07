import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../../widgets/provider_widget.dart';
import '../../components/rounded_input_field.dart';
import '../../components/rounded_button.dart';
import '../../components/rounded_password_field.dart';
import '../../constants.dart';

enum AuthFormType { signIn, signUp }

class Welcome extends StatefulWidget {
  final AuthFormType authFormType;

  Welcome({Key key, @required this.authFormType}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState(authFormType: this.authFormType);
}

class _WelcomeState extends State<Welcome> {
  AuthFormType authFormType;

  _WelcomeState({this.authFormType});

  final formKey = GlobalKey<FormState>();
  String _firstName, _lastName, _email, _password;

  void switchFormState(String state) {
    formKey.currentState.reset();
    if (state == "signUp") {
      setState(() {
        authFormType = AuthFormType.signUp;
      });
    } else {
      setState(() {
        authFormType = AuthFormType.signIn;
      });
    }
  }

  void submit() async {
    final form = formKey.currentState;
    form.save();
    try {
      final auth = ProviderWidget.of(context).auth;
      if (authFormType == AuthFormType.signIn) {
        String uid = await auth.signInWithEmailAndPassword(_email, _password);
        print("Signed In with ID $uid");
        Navigator.of(context).pushReplacementNamed('/home');
      } else {
        String uid = await auth.createUserWithEmailAndPassword(
            _email, _password, _firstName, _lastName);
        print("Signed up with New ID $uid");
        Navigator.of(context).pushReplacementNamed('/general');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        height: _height,
        width: _width,
        child: SafeArea(
          child: Column(
            children: <Widget>[
              SizedBox(height: _height * 0.05),
              buildHeaderText(),
              SizedBox(height: 10),
              buttons(),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: buildInputs() + buildButtons(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  AutoSizeText buildHeaderText() {
    String _headerText = "Welcome";
    return AutoSizeText(
      _headerText,
      maxLines: 1,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 35,
        color: kPrimaryColor,
      ),
    );
  }

  Row buttons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FlatButton(
          disabledColor: Colors.grey,
          disabledTextColor: Colors.black,
          splashColor: Colors.grey.withOpacity(0.25),
          highlightColor: Colors.grey.withOpacity(0.25),
          padding: EdgeInsets.all(2.0),
          onPressed: () {
            /*...*/
            setState(() {
              switchFormState("signUp");
            });
          },
          child: Text(
            "Sign Up",
            style: TextStyle(fontSize: 18.0),
          ),
        ),
        SizedBox(width: 8),
        Container(height: 40, child: VerticalDivider()),
        SizedBox(width: 8),
        FlatButton(
          disabledColor: Colors.grey,
          disabledTextColor: Colors.black,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          padding: EdgeInsets.all(4.0),
          onPressed: () {
            setState(() {
              switchFormState("signIn");
            });
          },
          child: Text(
            "Sign In",
            style: TextStyle(fontSize: 18.0),
          ),
        ),
      ],
    );
  }

  List<Widget> buildInputs() {
    List<Widget> textFields = [];

    // if were in the sign up state add name
    if (authFormType == AuthFormType.signUp) {
      textFields.add(
        RoundedInputField(
          hintText: "First Name",
          onChanged: (value) => _firstName = value,
        ),
      );
      textFields.add(SizedBox(height: 10));
      textFields.add(
        RoundedInputField(
          hintText: "Last Name",
          onChanged: (value) => _lastName = value,
        ),
      );
      textFields.add(SizedBox(height: 10));
    }

    // add email & password
    textFields.add(
      RoundedInputField(
        hintText: "Email",
        icon: Icons.mail,
        onChanged: (value) => _email = value,
      ),
    );
    textFields.add(SizedBox(height: 10));
    textFields.add(
      RoundedPasswordField(
        onChanged: (value) => _password = value,
      ),
    );
    textFields.add(SizedBox(height: 10));

    return textFields;
  }

  InputDecoration buildSignUpInputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: Colors.white,
      focusColor: Colors.white,
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 0.0)),
      contentPadding:
          const EdgeInsets.only(left: 14.0, bottom: 10.0, top: 10.0),
    );
  }

  List<Widget> buildButtons() {
    String _submitButtonText;

    if (authFormType == AuthFormType.signIn) {
      _submitButtonText = "Sign In";
    } else {
      _submitButtonText = "Sign Up";
    }

    return [
      Container(
        width: MediaQuery.of(context).size.width * 0.8,
        child: RoundedButton(
          text: _submitButtonText,
          press: submit,
        ),
      ),
    ];
  }
}
