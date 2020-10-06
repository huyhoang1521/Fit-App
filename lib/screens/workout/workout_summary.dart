import 'package:fit_app/components/constants.dart';
import 'package:fit_app/screens/workout/widgets/exercise_tab.dart';
import 'package:flutter/material.dart';

class WorkoutSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
      child: Column(
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
                  '57 minutes',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          ),
          ExerciseTab(
            name: 'Warm up 1',
            img: 'assets/images/pullup_up.png',
            time: 5,
          ),
          ExerciseTab(
            name: 'Warm up 2',
            img: 'assets/images/pullup_up.png',
            time: 8,
          ),
          ExerciseTab(
            name: 'Warm up 3',
            img: 'assets/images/pullup_up.png',
            time: 15,
          ),
          ExerciseTab(
            name: 'Warm up 4',
            img: 'assets/images/pullup_up.png',
            time: 15,
          ),
          ExerciseTab(
            name: 'Warm up 5',
            img: 'assets/images/pullup_up.png',
            time: 15,
          ),
          ExerciseTab(
            name: 'Push 1',
            img: 'assets/images/pullup_up.png',
            time: 15,
          ),
          ExerciseTab(
            name: 'Pull 1',
            img: 'assets/images/pullup_up.png',
            time: 15,
          ),
          ExerciseTab(
            name: 'Push 2',
            img: 'assets/images/pullup_up.png',
            time: 15,
          ),
          ExerciseTab(
            name: 'Pull 2',
            img: 'assets/images/pullup_up.png',
            time: 15,
          ),
          ExerciseTab(
            name: 'Cool Down 1',
            img: 'assets/images/pullup_up.png',
            time: 15,
          ),
          ExerciseTab(
            name: 'Cool Down 2',
            img: 'assets/images/pullup_up.png',
            time: 15,
          ),
        ],
      ),
    );
  }
}
