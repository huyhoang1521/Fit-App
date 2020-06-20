import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../components/rounded_button.dart';
import 'package:fit_app/services/auth_service.dart';
import 'package:fit_app/widgets/provider_widget.dart';
import '../../components/drawer_button.dart';
import 'package:fit_app/screens/home/overview_page.dart';
import 'profile.dart';

class WorkOutR extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _WorkOutRState();
  }
}

class Routine extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RoutineState();
  }
}

class _WorkOutRState extends State<WorkOutR> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fit For Life'),
        elevation: 5,
        backgroundColor: kPrimaryColor,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.undo),
            onPressed: () async {
              try {
                AuthService auth = Provider.of(context).auth;
                await auth.signOut();
                print("Signed Out!");
              } catch (e) {
                print(e);
              }
            },
          )
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: kPrimaryLightColor,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[
                      Colors.black,
                      // kPrimaryLightColor,
                      kPrimaryColor,
                    ],
                  ),
                ),
                child: Image.asset('assets/images/example_logo.jpeg'),
              ),
              DrawerButton(
                  icon: Icons.access_alarms,
                  text: "Workout",
                  color: kPrimaryLightColor,
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => WorkOutR()),
                    );
                  }),
              DrawerButton(
                  icon: Icons.person,
                  text: "Profile",
                  color: kPrimaryLightColor,
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfilePage()),
                    );
                  }),
              DrawerButton(
                  icon: Icons.supervised_user_circle,
                  text: "Progress",
                  color: kPrimaryLightColor,
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Overview()),
                    );
                  }),
              DrawerButton(
                  icon: Icons.supervised_user_circle,
                  text: "Recovery Booster",
                  color: kPrimaryLightColor,
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Overview()),
                    );
                  }),
              DrawerButton(
                  icon: Icons.supervised_user_circle,
                  text: "Reminder",
                  color: kPrimaryLightColor,
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Overview()),
                    );
                  }),
              DrawerButton(
                  icon: Icons.person,
                  text: "Settings",
                  color: kPrimaryLightColor,
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfilePage()),
                    );
                  }),
            ],
          ),
        ),
      ),
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: EdgeInsets.only(bottom: 10.0),
          child: RoundedButton(
            color: kPrimaryColor,
            textColor: Colors.white,
            press: () {
              Routine();
            },
            text: 'Start Workout',
            //onLongPress: ,
          ),
        ),
      ),
    );
  }
}

class _RoutineState extends State<Routine> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text('Exercise num'),
        Icon(Icons.contact_phone),
      ],
    );
  }
}
