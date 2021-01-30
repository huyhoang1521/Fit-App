import 'package:fit_app/models/fit_user.dart';
import 'package:fit_app/screens/form/finished.dart';
import 'package:flutter/material.dart';
import 'package:fit_app/components/general/buttons/rounded_button.dart';
import 'package:fit_app/components/general/appbar/custom_appbar.dart';

class FinishAccount extends StatefulWidget {
  final FitUser fitUser;

  const FinishAccount({Key key, this.fitUser}) : super(key: key);

  @override
  _FinishAccountState createState() =>
      new _FinishAccountState(fitUser: this.fitUser);
}

class _FinishAccountState extends State<FinishAccount> {
  final FitUser fitUser;
  _FinishAccountState({this.fitUser});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Set User Data"),
            RoundedButton(
              text: "Set User Data",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Finished(fitUser: fitUser)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
