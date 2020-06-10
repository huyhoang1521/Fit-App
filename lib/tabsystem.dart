import 'package:fit_app/WorkoutRoutinePage.dart';
import 'package:flutter/material.dart';
import 'package:fit_app/ProfilePage.dart';

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
            backgroundColor: Colors.deepPurpleAccent,
          ),
          body: TabBarView(children: [
            WorkOutR(),
            Icon(Icons.games),
            ProfilePage(),
          ]),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
