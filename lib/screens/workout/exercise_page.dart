import 'package:fit_app/components/workout/exercise_fields_creator.dart';
import 'package:fit_app/components/workout/exercise_title.dart';
import 'package:fit_app/components/general/appbar/custom_appbar.dart';
import 'package:fit_app/components/workout/buttons.dart';
import 'package:fit_app/providers/workout_exercises.dart';
import 'package:fit_app/screens/workout/rest.dart';
import 'package:fit_app/providers/exercise_counter.dart';
import 'package:fit_app/screens/workout/route_transition.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

IconData pause = Icons.pause_circle_filled;
IconData play = Icons.play_circle_filled;
IconData button = play;
bool pressed = false;
ExerciseCounter exerciseCounter = new ExerciseCounter();
WorkoutExercises workoutExercises = new WorkoutExercises();
Offset start = Offset(1, 0);
Offset end = Offset.zero;

class ExercisePage extends StatefulWidget {
  const ExercisePage({Key key}) : super(key: key);

  @override
  _ExercisePageState createState() => new _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  @override
  Widget build(BuildContext context) {
    workoutExercises = Provider.of<WorkoutExercises>(context);

    exerciseCounter = Provider.of<ExerciseCounter>(context, listen: true);

    ExerciseFieldsCreator exerciseFieldsCreator = new ExerciseFieldsCreator();
    List<Widget> exercisesFields = exerciseFieldsCreator.populateExerciseFields(
        workoutExercises.exercises, exerciseCounter.exerciseCount);

    double width = (MediaQuery.of(context).size.width);
    double height = (MediaQuery.of(context).size.height);

    // Build the widget with data.
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ExerciseTitle(
              name: workoutExercises.exercises[exerciseCounter.exerciseCount]
                  ["name"]),
          Image.asset(
            'assets/images/pullup_up.png',
            width: width * .75,
          ),
          Expanded(
            child: Center(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                  child: new ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: exercisesFields.length,
                    itemBuilder: (context, index) {
                      return exercisesFields[index];
                    },
                  ),
                ),
              ),
            ),
          ),
          Buttons(
            enabled: pressed,
            rWPressed: () {},
            fFPressed: () {
              Navigator.push(context,
                  RouteTransition(page: RestPage(), start: start, end: end));
              //Todo Clean up after choosing transition method
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => RestPage()),
              // );
              exerciseCounter.incrementExerciseCount();
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
}
