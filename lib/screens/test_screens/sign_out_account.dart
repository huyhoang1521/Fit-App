import 'package:fit_app/providers/workout_file_data.dart';
import 'package:flutter/material.dart';
import 'package:fit_app/providers/auth_service.dart';
import 'package:fit_app/providers/provider_widget.dart';
import 'package:provider/provider.dart';

class SignOutAccount extends StatefulWidget {
  @override
  _SignOutAccount createState() => new _SignOutAccount();
}

class _SignOutAccount extends State<SignOutAccount> {
  @override
  Widget build(BuildContext context) {
    final workoutFileData =
        Provider.of<WorkoutFileData>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          title: Text('Fit With Nick'),
          elevation: 5,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.undo),
              color: Theme.of(context).iconTheme.color,
              onPressed: () async {
                try {
                  workoutFileData.setGetWorkout(false);
                  AuthService auth = ProviderWidget.of(context).auth;
                  await auth.signOut();
                  print("Signed Out!");
                } catch (e) {
                  print(e);
                }
              },
            )
          ],
        ),
        body: Text("Sign out!"));
  }
}
