import 'package:fit_app/components/progress/exercise_info.dart';
import 'package:fit_app/components/workout/exercise_title.dart';
import 'package:fit_app/components/general/appbar/custom_appbar.dart';
import 'package:fit_app/components/workout/buttons.dart';
import 'package:fit_app/providers/workout_exercises.dart';
import 'package:fit_app/providers/workout_process.dart';
//import 'package:fit_app/screens/workout/route_transition.dart';
import 'package:flutter/material.dart';

IconData pause = Icons.pause_circle_filled;
IconData play = Icons.play_circle_filled;
IconData button = play;
bool pressed = false;
WorkoutProcess workoutProcess = new WorkoutProcess();
WorkoutExercises workoutExercises = new WorkoutExercises();
Offset start = Offset(1, 0);
Offset end = Offset.zero;
List<Map<String, dynamic>> workoutList = [];

class MaxTest extends StatefulWidget {
  @override
  _MaxTest createState() => new _MaxTest();
}

class _MaxTest extends State<MaxTest> {
  // List<Widget> populateExerciseFields(int exerciseCount) {
  //   List<Widget> exercisesFields = new List();

  //   if (workoutList[exerciseCount].containsKey('subcategory')) {
  //     exercisesFields.add(new ExerciseBox(
  //         name: "Subcategory",
  //         value: workoutList[exerciseCount]["subcategory"]));
  //   }
  //   if (workoutList[exerciseCount].containsKey("reps")) {
  //     exercisesFields.add(new ExerciseBox(
  //         name: "Reps", value: workoutList[exerciseCount]["reps"]));
  //   }
  //   if (workoutList[exerciseCount].containsKey("sets")) {
  //     exercisesFields.add(new ExerciseBox(
  //         name: "Sets", value: workoutList[exerciseCount]["sets"]));
  //   }
  //   if (workoutList[exerciseCount].containsKey("duration")) {
  //     exercisesFields.add(new ExerciseBox(
  //         name: "Duration", value: workoutList[exerciseCount]["duration"]));
  //   }
  //   return exercisesFields;
  // }

  @override
  Widget build(BuildContext context) {
    // workoutExercises = Provider.of<WorkoutExercises>(context, listen: false);
    // workoutProcess = Provider.of<WorkoutProcess>(context, listen: false);
    // workoutList = workoutExercises.warmups + workoutExercises.exercises;
    // List<Widget> exercisesFields =
    //     populateExerciseFields(workoutProcess.exerciseCount);
    double width = (MediaQuery.of(context).size.width);
    double height = (MediaQuery.of(context).size.height);

    // Build the widget with data.
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ExerciseTitle(
              name: workoutList[workoutProcess.exerciseCount]["name"]),
          Text(
            (workoutProcess.exerciseCount + 1).toString() +
                "/" +
                workoutList.length.toString(),
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          FittedBox(
            fit: BoxFit.fill,
            child: Stack(
              children: [
                Container(
                  width: width,
                  child: Image.asset(
                    'assets/images/pullup_up.png',
                  ),
                ),
                Positioned(
                  right: width * 0.05,
                  child: IconButton(
                    icon: Icon(Icons.info_outlined),
                    onPressed: () => _onButtonPressed(),
                  ),
                ),
              ],
            ),
          ),
          // Expanded(
          //   child: Center(
          //     child: Container(
          //       child: Padding(
          //         padding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
          //         child: new ListView.builder(
          //           shrinkWrap: true,
          //           physics: const NeverScrollableScrollPhysics(),
          //           itemCount: exercisesFields.length,
          //           itemBuilder: (context, index) {
          //             return exercisesFields[index];
          //           },
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          Buttons(
            enabled: pressed,
            rWPressed: () {},
            fFPressed: () {
              workoutProcess.incrementExerciseCount();
              Navigator.pushNamed(context, '/restPage');
            },
            pPPressed: () {
              setState(() {
                pressed = !pressed;
              });
            },
          ),
          SizedBox(height: height * .15)
        ],
      ),
    );
  }

  //Remove when Pull in real description
  String _descr =
      "Start in plank postion with arms straight and hands shoulder width apart and rings turned out with palms facing forward. Slowly lower body down by bending one arm while keeping the other arm as straight as possible. Lower until chest reaches hands and then push explosively until in starting position. Repeat and switch roles of arms. Keep body as straight as possible for duration of exercise by squezing glutes and keeping core engaged. ";
  // function that calls Exercise info
  void _onButtonPressed() {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        )),
        context: context,
        builder: (context) {
          return Container(
            child: ExerciseInfo(
              tier: 'Fundamentals',
              exerciseType: 'Push',
              movementType: 'Concentric',
              position: 'vertical',
              description: _descr,
            ),
          );
        });
  }
}
