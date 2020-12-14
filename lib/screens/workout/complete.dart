import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fit_app/algorithms/database/update_database.dart';
import 'package:fit_app/components/general/buttons/rounded_button.dart';
import 'package:fit_app/models/user_workout.dart';
import 'package:fit_app/providers/exercise_counter.dart';
import 'package:fit_app/providers/workout_exercises.dart';
import 'package:fit_app/providers/workout_in_progress.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final userDoc = FirebaseFirestore.instance.collection('Users').doc(user.uid);
WorkoutExercises workoutExercises;

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
    final exerciseCounter = Provider.of<ExerciseCounter>(context);
    final workoutInProgress =
        Provider.of<WorkoutInProgress>(context, listen: false);
    workoutExercises = Provider.of<WorkoutExercises>(context, listen: false);
    return Scaffold(
      body: Column(
        children: [
          RoundedButton(
            color: Theme.of(context).buttonColor,
            //textColor: Colors.white,
            press: () {
              workoutInProgress.setWorkoutInProgress(false);
              exerciseCounter.clearCount();
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
            text: 'Finish',
            //onLongPress: ,
          )
        ],
      ),
    );
  }
}
