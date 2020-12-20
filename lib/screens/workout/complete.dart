import 'package:fit_app/components/general/appbar/custom_appbar.dart';
import 'package:fit_app/algorithms/database/update_database.dart';
import 'package:fit_app/components/general/buttons/rounded_button.dart';
import 'package:fit_app/components/general/drawer/app_drawer.dart';
import 'package:fit_app/models/user_workout.dart';
import 'package:fit_app/providers/exercise_counter.dart';
import 'package:fit_app/providers/workout_in_progress.dart';
import 'package:fit_app/screens/progress/progress.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Complete extends StatefulWidget {
  final UserWorkout workout;

  const Complete({Key key, this.workout}) : super(key: key);

  @override
  _CompleteState createState() => new _CompleteState(workout: this.workout);
}

class _CompleteState extends State<Complete> {
  UserWorkout workout;
  _CompleteState({this.workout});

  Future<void> updateProgression(List<int> progressions) async {
    await userDoc.update({"progressions": progressions});
  }

  @override
  Widget build(BuildContext context) {
    final workoutInProgress =
        Provider.of<WorkoutInProgress>(context, listen: false);
    final exerciseCounter = Provider.of<ExerciseCounter>(context);
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: AppDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Great Job!',
                  style: Theme.of(context).textTheme.headline1),
            )),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RoundedButton(
                  color: Theme.of(context).buttonColor,
                  press: () {
                    exerciseCounter.clearCount();
                    workoutInProgress.setWorkoutInProgress(false);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Progress()),
                      //MaterialPageRoute(builder: (context) => StartWorkout()),
                    );
                  },
                  text: 'See My Progress!',
                  //onLongPress: ,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: RoundedButton(
                  color: Theme.of(context).buttonColor,
                  press: () {
                    exerciseCounter.clearCount();
                    workoutInProgress.setWorkoutInProgress(false);
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                  text: 'Finish',
                  //onLongPress: ,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
