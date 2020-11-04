import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fit_app/algorithms/progressions.dart';
import 'package:fit_app/components/constants.dart';
import 'package:fit_app/models/user_workout.dart';
import 'package:fit_app/screens/workout/widgets/exercise_tab.dart';
import 'package:flutter/material.dart';
import '../../algorithms/warmup.dart';

List<Map<String, dynamic>> workoutList = new List();

Warmup warmup = new Warmup();
Progressions progressions = new Progressions();

class WorkoutSummary extends StatefulWidget {
  final UserWorkout workout;

  const WorkoutSummary({Key key, this.workout}) : super(key: key);

  @override
  _WorkoutSummary createState() => new _WorkoutSummary(workout: this.workout);
}

class _WorkoutSummary extends State<WorkoutSummary> {
  UserWorkout workout;
  _WorkoutSummary({this.workout});

  @override
  Widget build(BuildContext context) => FutureBuilder(
        future: setWorkout(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // Build the widget with data.
            return ListView.builder(
              itemCount: workoutList.length,
              itemBuilder: (BuildContext context, int index) {
                if (workoutList[index].values.elementAt(0) == 'timer') {
                  return Padding(
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
                          workoutList[index].values.elementAt(1),
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ],
                    ),
                  );
                } else {
                  return new ExerciseTab(
                    name: workoutList[index].values.elementAt(0),
                    img: workoutList[index].values.elementAt(1),
                    time: workoutList[index].values.elementAt(2),
                  );
                }
              },
            );
          } else {
            // We can show the loading view until the data comes back.
            debugPrint('Step 1, build loading widget');
            return CircularProgressIndicator();
          }
        },
      );

  Future<List<Map<String, dynamic>>> setWorkout() =>
      Future.delayed(Duration(seconds: 1), () async {
        workoutList.add({"name": ('timer'), "time": '57 minutes'});
        for (int i = 0; i < workout.warmup.length; i++) {
          print("workout.warmup[i] = " + workout.warmup[i].toString());
          DocumentSnapshot warmupDoc =
              await warmup.getWarmup(workout.warmup[i]);

          workoutList.add({
            "name": warmupDoc.get('name'),
            "img": 'assets/images/pullup_up.png',
            "time": 5
          });
        }
        for (int i = 0; i < workout.exercises.length; i++) {
          print("workout.exercises[i][1] = " +
              workout.exercises[i].values.elementAt(1).toString());
          DocumentSnapshot progDoc = await progressions
              .getProgressionByID(workout.exercises[i].values.elementAt(1));

          workoutList.add({
            "name": progDoc.get('name'),
            "img": 'assets/images/pullup_up.png',
            "time": 5
          });
        }
        return workoutList;
      });
}
