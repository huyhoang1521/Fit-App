import 'package:fit_app/components/themes/icons/custom_icons_icons.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../components/rounded_button.dart';
import 'package:fit_app/services/auth_service.dart';
import 'package:fit_app/widgets/provider_widget.dart';
import '../../components/drawer_button.dart';
import 'package:fit_app/screens/home/Overview/overview_page.dart';
import 'Profile/profile.dart';
import 'recovery/recovery_page.dart';
import 'settings/settings.dart';

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
        // backgroundColor: kPrimaryColor,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.undo),
            onPressed: () async {
              try {
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
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            DrawerHeader(
              padding: EdgeInsets.only(
                bottom: 10,
              ),
              decoration: BoxDecoration(
                color: kPrimaryColor,
              ),
              child: Image.asset('assets/images/example_logo.jpeg'),
            ),
            DrawerButton(
                icon: CustomIcons.health_fitness,
                text: "Workout",
                color: Theme.of(context).canvasColor,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WorkOutR()),
                  );
                }),
            DrawerButton(
                icon: Icons.person,
                text: "Profile",
                color: Theme.of(context).canvasColor,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
                }),
            DrawerButton(
                icon: CustomIcons.healthy,
                text: "Progress",
                color: Theme.of(context).canvasColor,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Overview()),
                  );
                }),
            DrawerButton(
                icon: CustomIcons.recovery_percentage,
                text: "Recovery Booster",
                color: Theme.of(context).canvasColor,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Recovery()),
                  );
                }),
            DrawerButton(
                icon: Icons.settings,
                text: "Settings",
                color: Theme.of(context).canvasColor,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Settings()),
                  );
                }),
          ],
        ),
      ),
      body: Column(children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: 10.0),
            child: RoundedButton(
              //  color: kPrimaryColor,
              textColor: Colors.white,
              press: () {
                Routine();
              },
              text: 'Start Workout',
              //onLongPress: ,
            ),
          ),
        ),
      ]),
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
