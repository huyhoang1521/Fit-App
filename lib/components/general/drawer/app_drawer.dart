import 'package:fit_app/screens/home/home_page.dart';
import '../icons/custom_icons_icons.dart';
import '../icons/iconicks_icons.dart';
import 'package:fit_app/screens/progress/fundamentals.dart';
import 'package:fit_app/screens/profile/profile.dart';
import 'package:fit_app/screens/recovery/recovery_page.dart';
import 'package:fit_app/screens/settings/settings.dart';
import 'package:fit_app/screens/test_screens/test_page.dart';
import 'package:flutter/material.dart';
import 'drawer_button.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              }),
          DrawerButton(
              icon: Icons.person,
              text: "Profile",
              color: Theme.of(context).canvasColor,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Profile()),
                );
              }),
          DrawerButton(
              icon: Iconicks.prog1,
              text: "Progress",
              color: Theme.of(context).canvasColor,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Fundaments()),
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
                  MaterialPageRoute(builder: (context) => Setting()),
                );
              }),
          DrawerButton(
              icon: Icons.anchor,
              text: "Test",
              color: Theme.of(context).canvasColor,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TestPage()),
                );
              }),
        ],
      ),
    );
  }
}
