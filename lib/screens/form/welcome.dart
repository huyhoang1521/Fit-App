import 'package:fit_app/screens/form/general.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../../widgets/provider_widget.dart';
import '../../components/rounded_input_field.dart';
import '../../components/rounded_button.dart';
import '../../components/rounded_password_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/User.dart';
import '../../constants.dart';

enum AuthFormType { signIn, signUp }

class Welcome extends StatefulWidget {
  final db = Firestore.instance;
  final AuthFormType authFormType;
  final User user;

  Welcome({Key key, @required this.authFormType, this.user}) : super(key: key);

  @override
  _WelcomeState createState() =>
      _WelcomeState(authFormType: this.authFormType, user: this.user);
}

class _WelcomeState extends State<Welcome> {
  final User user;
  AuthFormType authFormType;

  _WelcomeState({this.authFormType, this.user});

  final formKey = GlobalKey<FormState>();
  String _firstName, _lastName, _email, _password, _warning;

  void switchFormState(String state) {
    formKey.currentState.reset();
    if (state == "signUp") {
      if (this.mounted) {
        setState(() {
          authFormType = AuthFormType.signUp;
        });
      }
    } else if (state == 'home') {
      if (context == null) {
        print("context state is null");
      }
      Navigator.of(context).pop();
    } else {
      if (this.mounted) {
        setState(() {
          authFormType = AuthFormType.signIn;
        });
      }
    }
  }

  bool validate() {
    final form = formKey.currentState;
    form.save();
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  void setVars() {
    user.firstName = _firstName;
    user.lastName = _lastName;
    user.email = _email;
  }

  void submit() async {
    if (validate()) {
      try {
        final auth = Provider.of(context).auth;
        switch (authFormType) {
          case AuthFormType.signIn:
            try {
              await auth.signInWithEmailAndPassword(_email, _password);
              Navigator.of(context).pushReplacementNamed('/home');
            } catch (error) {
              print(error);
            }
            break;

          case AuthFormType.signUp:
            try {
              await auth.createUserWithEmailAndPassword(
                  _email, _password, (_firstName + _lastName));
              setVars();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => General(user: user)),
              );
              //Navigator.of(context).pushReplacementNamed('/general');
            } catch (error1) {
              print(error1);
            }

            break;
        }
      } catch (error2) {
        print(error2);
        if (this.mounted) {
          setState(() {
            _warning = error2.message;
          });
        }
      }
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

  Widget showAlert() {
    if (_warning != null) {
      return Container(
        color: Colors.amberAccent,
        width: double.infinity,
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(Icons.error_outline),
            ),
            Expanded(
              child: AutoSizeText(
                _warning,
                maxLines: 3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  if (this.mounted) {
                    setState(() {
                      _warning = null;
                    });
                  }
                },
              ),
            )
          ],
        ),
      );
    }
    return SizedBox(
      height: 0,
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
            if (this.mounted) {
              setState(() {
                switchFormState("signUp");
              });
            }
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
            if (this.mounted) {
              setState(() {
                switchFormState("signIn");
              });
            }
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
            hintText: "First Name", onChanged: (value) => _firstName = value),
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
