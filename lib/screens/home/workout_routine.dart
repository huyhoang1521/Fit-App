import 'package:fit_app/components/themes/icons/custom_icons_icons.dart';
import 'package:fit_app/components/themes/icons/iconicks_icons.dart';
import 'package:fit_app/screens/workout/start_workout.dart';
import 'package:flutter/material.dart';
import '../../components/rounded_button.dart';
import 'package:fit_app/services/auth_service.dart';
import 'package:fit_app/widgets/provider_widget.dart';
import '../../components/drawer_button.dart';
import 'package:fit_app/screens/home/Overview/overview_page.dart';
import 'Profile/profile.dart';
import 'Profile/newProfile/new_profile.dart';
import 'recovery/recovery_page.dart';
import 'settings/settings.dart';

class WorkOutR extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _WorkOutRState();
  }
}

class _WorkOutRState extends State<WorkOutR> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fit With Nick'),
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
                color: Colors.black,
              ),
              child: Image.asset(
                'assets/images/logos 4 v4.png',
                color: Theme.of(context).primaryColor,
              ),
            ),
            DrawerButton(
                icon: Iconicks.generated__1_,
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
                    MaterialPageRoute(builder: (context) => NewProfile()),
                  );
                }),
            DrawerButton(
                icon: Iconicks.prog1,
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
              color: Theme.of(context).accentColor,
              //textColor: Colors.white,
              press: () {
                Navigator.push(
                  context,
                  //   MaterialPageRoute(builder: (context) => RoutinePage()),
                  MaterialPageRoute(builder: (context) => StartWorkout()),
                );
              },
              text: 'Start Workout',
              //onLongPress: ,
            ),
          ),
        ),
        //StopWatch(),

        // TEST PAGE USE IS FOR TESTING ONLY
//        RoundedButton(
//          color: Theme.of(context).accentColor,
//          //textColor: Colors.white,
//          press: () {
//            Navigator.push(
//              context,
//              MaterialPageRoute(builder: (context) => VideoDemo()),
//            );
//          },
//          text: 'TEST PAGE',
//          //onLongPress: ,
//        ),
      ]),
    );
  }
}
