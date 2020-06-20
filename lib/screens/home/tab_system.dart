import 'workout_routine.dart';
import 'package:flutter/material.dart';
//import 'package:fit_app/screens/home/overview_page.dart';
//import 'profile.dart';
//import 'package:fit_app/services/auth_service.dart';
//import 'package:fit_app/widgets/provider_widget.dart';
//import '../../constants.dart';
//import '../../components/drawer_button.dart';

class TabSystem extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TabSystemState();
  }
}

class _TabSystemState extends State<TabSystem> {
  @override
  Widget build(BuildContext context) {
    return WorkOutR(
//      appBar: AppBar(
//        title: Text('Fit For Life'),
//        elevation: 5,
//        actions: <Widget>[
//          IconButton(
//            icon: Icon(Icons.undo),
//            onPressed: () async {
//              try {
//                AuthService auth = Provider.of(context).auth;
//                await auth.signOut();
//                print("Signed Out!");
//              } catch (e) {
//                print(e);
//              }
//            },
//          )
//        ],
//        backgroundColor: kPrimaryColor,
//      ),
//      drawer: Drawer(
//        child: Container(
//          color: kPrimaryLightColor,
//          child: ListView(
//            padding: EdgeInsets.zero,
//            children: <Widget>[
//              DrawerHeader(
//                decoration: BoxDecoration(
//                  gradient: LinearGradient(
//                    colors: <Color>[
//                      Colors.black,
//                      // kPrimaryLightColor,
//                      kPrimaryColor,
//                    ],
//                  ),
//                ),
//                child: Image.asset('assets/images/example_logo.jpeg'),
//              ),
//              DrawerButton(
//                  icon: Icons.access_alarms,
//                  text: "Workout",
//                  color: kPrimaryLightColor,
//                  press: () {
//                    Navigator.push(
//                      context,
//                      MaterialPageRoute(builder: (context) => WorkOutR()),
//                    );
//                  }),
//              DrawerButton(
//                  icon: Icons.person,
//                  text: "Profile",
//                  color: kPrimaryLightColor,
//                  press: () {
//                    Navigator.push(
//                      context,
//                      MaterialPageRoute(builder: (context) => ProfilePage()),
//                    );
//                  }),
//              DrawerButton(
//                  icon: Icons.supervised_user_circle,
//                  text: "Progress",
//                  color: kPrimaryLightColor,
//                  press: () {
//                    Navigator.push(
//                      context,
//                      MaterialPageRoute(builder: (context) => Overview()),
//                    );
//                  }),
//              DrawerButton(
//                  icon: Icons.supervised_user_circle,
//                  text: "Recovery Booster",
//                  color: kPrimaryLightColor,
//                  press: () {
//                    Navigator.push(
//                      context,
//                      MaterialPageRoute(builder: (context) => Overview()),
//                    );
//                  }),
//              DrawerButton(
//                  icon: Icons.supervised_user_circle,
//                  text: "Reminder",
//                  color: kPrimaryLightColor,
//                  press: () {
//                    Navigator.push(
//                      context,
//                      MaterialPageRoute(builder: (context) => Overview()),
//                    );
//                  }),
//              DrawerButton(
//                  icon: Icons.person,
//                  text: "Settings",
//                  color: kPrimaryLightColor,
//                  press: () {
//                    Navigator.push(
//                      context,
//                      MaterialPageRoute(builder: (context) => ProfilePage()),
//                    );
//                  }),
//            ],
//          ),
//        ),
//      ),
        //     backgroundColor: Colors.white,
        );
  }
}
