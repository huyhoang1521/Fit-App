import 'package:fit_app/components/workout/exercise_box.dart';
import 'package:fit_app/components/workout/exercise_title.dart';
import 'package:fit_app/components/general/appbar/custom_appbar.dart';
import 'package:fit_app/components/workout/buttons.dart';
import 'package:fit_app/providers/workout_exercises.dart';
import 'package:fit_app/providers/exercise_counter.dart';
//import 'package:fit_app/screens/workout/route_transition.dart';
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
  @override
  _ExercisePageState createState() => new _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  List<Widget> populateExerciseFields(
      List<Map<String, dynamic>> exerciseList, int exerciseCount) {
    List<Widget> exercisesFields = new List();

    if (exerciseList[exerciseCount].containsKey('subcategory')) {
      exercisesFields.add(new ExerciseBox(
          name: "Subcategory",
          value: exerciseList[exerciseCount]["subcategory"]));
    }
    if (exerciseList[exerciseCount].containsKey("reps")) {
      exercisesFields.add(new ExerciseBox(
          name: "Reps", value: exerciseList[exerciseCount]["reps"]));
    }
    if (exerciseList[exerciseCount].containsKey("sets")) {
      exercisesFields.add(new ExerciseBox(
          name: "Sets", value: exerciseList[exerciseCount]["sets"]));
    }
    if (exerciseList[exerciseCount].containsKey("duration")) {
      exercisesFields.add(new ExerciseBox(
          name: "Duration", value: exerciseList[exerciseCount]["duration"]));
    }
    return exercisesFields;
  }

  @override
  Widget build(BuildContext context) {
    workoutExercises = Provider.of<WorkoutExercises>(context, listen: false);
    exerciseCounter = Provider.of<ExerciseCounter>(context, listen: false);
    List<Widget> exercisesFields = populateExerciseFields(
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
          Text(
            (exerciseCounter.exerciseCount + 1).toString() +
                "/" +
                workoutExercises.exercises.length.toString(),
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
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            _descriptionDialog(context),
                      );
                    },
                  ),
                ),
              ],
            ),
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
              exerciseCounter.incrementExerciseCount();
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
}

Widget _descriptionDialog(BuildContext context) {
  return new AlertDialog(
    title: const Text('Exercise Description'),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum maximus libero id odio tincidunt, ut maximus nisi congue. Donec pellentesque elit ex. Ut pulvinar massa ut risus suscipit, eget scelerisque lorem vulputate. Integer eget quam at tellus vulputate varius eget in mi. Nam nec enim maximus, pharetra orci non, ullamcorper nunc. Suspendisse at eleifend enim. Ut vitae augue eleifend, gravida augue sed, dignissim leo. Praesent eget malesuada leo."),
      ],
    ),
    actions: <Widget>[
      new FlatButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        textColor: Theme.of(context).primaryColor,
        child: const Text('Close'),
      ),
    ],
  );
}
