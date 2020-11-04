import 'package:fit_app/screens/home/app_drawer.dart';
import 'package:fit_app/screens/workout/test_page.dart';
import 'package:fit_app/screens/workout/workout_summary.dart';
import 'package:flutter/material.dart';
import '../../components/rounded_button.dart';
import 'package:fit_app/services/auth_service.dart';
import 'package:fit_app/widgets/provider_widget.dart';

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
      drawer: AppDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: ListView(
                    // mainAxisAlignment: MainAxisAlignment.end,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      WorkoutSummary(),
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
                    ]),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: RoundedButton(
                  color: Theme.of(context).buttonColor,
                  //textColor: Colors.white,
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TestPage()),
                      //MaterialPageRoute(builder: (context) => StartWorkout()),
                    );
                  },
                  text: 'Workout Test Page',
                  //onLongPress: ,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
