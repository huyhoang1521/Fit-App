import 'package:fit_app/components/general/buttons/rounded_button.dart';
import 'package:fit_app/components/general/drawer/app_drawer.dart';
import 'package:fit_app/components/themes/constants.dart';
import 'package:fit_app/components/workout/exercise_overview_item.dart';
import 'package:fit_app/providers/workout_exercises.dart';
import 'package:fit_app/providers/workout_in_progress.dart';
import 'package:flutter/material.dart';
import 'package:fit_app/providers/auth_service.dart';
import 'package:fit_app/providers/provider_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => new _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final workoutInProgress = Provider.of<WorkoutInProgress>(context);
    final workoutExercises = Provider.of<WorkoutExercises>(context);
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.timer,
                    color: kPrimaryColor,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "57 minutes",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                  child: ListView.builder(
                    itemCount: workoutExercises.exercises.length,
                    itemBuilder: (BuildContext context, int index) {
                      return new ExerciseOverviewItem(
                        name: workoutExercises.exercises[index]['name'],
                        img: 'assets/images/pullup_up.png',
                        time: 5,
                      );
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: new RoundedButton(
                color: Theme.of(context).buttonColor,
                press: () async {
                  workoutInProgress.setWorkoutInProgress(true);
                },
                text: 'Start Workout',
                //onLongPress: ,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
