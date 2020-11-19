import 'package:fit_app/algorithms/progressions.dart';
import 'package:fit_app/components/themes/constants.dart';
import 'package:fit_app/components/workout/exercise_tab.dart';
import 'package:flutter/material.dart';

Progressions progressions = new Progressions();

class WorkoutSummary extends StatefulWidget {
  final List<Map<String, dynamic>> exerciseList;

  const WorkoutSummary({Key key, this.exerciseList}) : super(key: key);

  @override
  _WorkoutSummary createState() =>
      new _WorkoutSummary(exerciseList: this.exerciseList);
}

class _WorkoutSummary extends State<WorkoutSummary> {
  List<Map<String, dynamic>> exerciseList;

  _WorkoutSummary({this.exerciseList});

  @override
  Widget build(BuildContext context) {
    // Build the widget with data.
    return ListView.builder(
      itemCount: exerciseList.length,
      itemBuilder: (BuildContext context, int index) {
        if (exerciseList[index].values.elementAt(0) == 'timer') {
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
                  exerciseList[index].values.elementAt(1),
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          );
        } else {
          return new ExerciseTab(
            name: exerciseList[index].values.elementAt(0),
            img: 'assets/images/pullup_up.png',
            time: 5,
          );
        }
      },
    );
  }
}
