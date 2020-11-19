import 'package:fit_app/components/general/buttons/rounded_button.dart';
import 'package:fit_app/models/user_workout.dart';
import 'package:fit_app/components/general/drawer/app_drawer.dart';
import 'package:fit_app/providers/workout_exercises.dart';
import 'package:fit_app/providers/workout_in_progress.dart';
import 'package:fit_app/screens/home/workout_summary.dart';
import 'package:flutter/material.dart';
import 'package:fit_app/providers/auth_service.dart';
import 'package:fit_app/providers/provider_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  final UserWorkout userWorkout;
  const HomePage({Key key, this.userWorkout}) : super(key: key);

  @override
  _HomePage createState() => new _HomePage(userWorkout: this.userWorkout);
}

class _HomePage extends State<HomePage> {
  UserWorkout userWorkout;
  _HomePage({this.userWorkout});

  @override
  Widget build(BuildContext context) {
    final workoutInProgress = Provider.of<WorkoutInProgress>(context);
    final workoutExercises = Provider.of<WorkoutExercises>(context);
    List<Map<String, dynamic>> exerciseSummaryList = workoutExercises.exercises;
    exerciseSummaryList.insert(0, {"name": 'timer', "time": '57 minutes'});
    // Build the widget with data.
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
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                  child: WorkoutSummary(exerciseList: exerciseSummaryList),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: new RoundedButton(
                color: Theme.of(context).buttonColor,
                press: () {
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
