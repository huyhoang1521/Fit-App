import 'package:fit_app/components/themes/icons/custom_icons_icons.dart';
import 'package:fit_app/components/themes/icons/iconicks_icons.dart';
import 'package:fit_app/models/user_workout.dart';
import 'package:fit_app/screens/test/test_page.dart';
import 'package:fit_app/screens/workout/workout_summary.dart';
import 'package:flutter/material.dart';
import 'package:fit_app/services/auth_service.dart';
import 'package:fit_app/widgets/provider_widget.dart';
import '../../components/drawer_button.dart';
import '../Overview/overview_page.dart';
import '../Profile/profile.dart';
import '../recovery/recovery_page.dart';
import '../settings/settings.dart';

class WorkoutOverview extends StatefulWidget {
  final UserWorkout workout;

  const WorkoutOverview({Key key, this.workout}) : super(key: key);

  @override
  _WorkoutOverview createState() => new _WorkoutOverview(workout: this.workout);
}

class _WorkoutOverview extends State<WorkoutOverview> {
  UserWorkout workout;
  _WorkoutOverview({this.workout});

  @override
  Widget build(BuildContext context) {
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
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                //child: Column(
                // mainAxisAlignment: MainAxisAlignment.end,
                // crossAxisAlignment: CrossAxisAlignment.center,
                //children: [
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                  child: WorkoutSummary(workout: workout),
                  // Padding(
                  //   padding: EdgeInsets.all(10.0),
                  //   child: RoundedButton(
                  //     color: Theme.of(context).buttonColor,
                  //     //textColor: Colors.white,
                  //     press: () {
                  //       Navigator.push(
                  //         context,
                  //         MaterialPageRoute(builder: (context) => Concentric()),
                  //         //MaterialPageRoute(builder: (context) => StartWorkout()),
                  //       );
                  //     },
                  //     text: 'Start Workout (UI)',
                  //     //onLongPress: ,
                  //   ),
                  // ),
                  // Padding(
                  //   padding: EdgeInsets.all(10.0),
                  //   child: RoundedButton(
                  //     color: Theme.of(context).buttonColor,
                  //     //textColor: Colors.white,
                  //     press: () {
                  //       Navigator.push(
                  //         context,
                  //         MaterialPageRoute(builder: (context) => StartWorkout()),
                  //       );
                  //     },
                  //     text: 'Start Workout (Firebase)',
                  //     //onLongPress: ,
                  //   ),
                  // ),
                  //],
                  //),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
