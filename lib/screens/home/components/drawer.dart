import 'package:fit_app/components/themes/icons/custom_icons_icons.dart';
import 'package:fit_app/components/themes/icons/iconicks_icons.dart';
import 'package:fit_app/screens/home/workout_overview.dart';
import 'package:fit_app/screens/overview/overview_page.dart';
import 'package:fit_app/screens/profile/profile.dart';
import 'package:fit_app/screens/recovery/recovery_page.dart';
import 'package:fit_app/screens/settings/settings.dart';
import 'package:flutter/material.dart';
import '../../../components/drawer_button.dart';

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
                  MaterialPageRoute(builder: (context) => WorkoutOverview()),
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
    );
  }
}

// class MyDrawer extends StatefulWidget {
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: <Widget>[
//           DrawerHeader(
//             padding: EdgeInsets.only(
//               bottom: 10,
//             ),
//             decoration: BoxDecoration(
//               color: Colors.black,
//             ),
//             child: Image.asset(
//               'assets/images/logos 4 v4.png',
//               color: Theme.of(context).primaryColor,
//             ),
//           ),
//           DrawerButton(
//               icon: Iconicks.generated__1_,
//               text: "Workout",
//               color: Theme.of(context).canvasColor,
//               press: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => WorkOutR()),
//                 );
//               }),
//           DrawerButton(
//               icon: Icons.person,
//               text: "Profile",
//               color: Theme.of(context).canvasColor,
//               press: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => NewProfile()),
//                 );
//               }),
//           DrawerButton(
//               icon: Iconicks.prog1,
//               text: "Progress",
//               color: Theme.of(context).canvasColor,
//               press: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => Overview()),
//                 );
//               }),
//           DrawerButton(
//               icon: CustomIcons.recovery_percentage,
//               text: "Recovery Booster",
//               color: Theme.of(context).canvasColor,
//               press: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => Recovery()),
//                 );
//               }),
//           DrawerButton(
//               icon: Icons.settings,
//               text: "Settings",
//               color: Theme.of(context).canvasColor,
//               press: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => Settings()),
//                 );
//               }),
//         ],
//       ),
//     );
//   }
//
//   @override
//   // ignore: missing_return
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//   }
// }
