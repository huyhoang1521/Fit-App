import 'workout_routine.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD:lib/tabsystem.dart
import 'package:fit_app/ProfilePage.dart';
import 'package:fit_app/OverviewPage.dart';
=======
import 'package:fit_app/services/auth_service.dart';
import 'package:fit_app/widgets/provider_widget.dart';
import 'profile.dart';
import '../../constants.dart';
>>>>>>> 00d246b462ad2303464f8de0c7fe004d6b3e2ebb:lib/screens/home/tab_system.dart

class TabSystem extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TabSystemState();
  }
}

class _TabSystemState extends State<TabSystem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            bottom: TabBar(
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  color: Colors.white),
              unselectedLabelColor: Colors.white,
              labelColor: Colors.black87,
              tabs: [
                Tab(text: 'Workout'),
                Tab(text: 'Overview'),
                Tab(text: 'Profile'),
              ],
            ),
            title: Text('Fit For Life'),
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
            backgroundColor: kPrimaryColor,
          ),
          body: TabBarView(children: [
            WorkOutR(),
            Overview(),
            ProfilePage(),
          ]),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
