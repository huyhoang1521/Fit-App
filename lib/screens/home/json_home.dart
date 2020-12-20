import 'package:fit_app/algorithms/json/json_data.dart';
import 'package:fit_app/providers/workout_exercises.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_page.dart';

class JsonHome extends StatefulWidget {
  @override
  _JsonHome createState() => new _JsonHome();
}

JsonData jsonData = new JsonData('workoutData.json');
List<Map<String, dynamic>> completeList = new List();

class _JsonHome extends State<JsonHome> {
  @override
  Widget build(BuildContext context) {
    completeList =
        List<Map<String, dynamic>>.from(jsonData.getFileContent()['warmup']) +
            List<Map<String, dynamic>>.from(
                jsonData.getFileContent()['progressions']);

    // Get the warmup and progression lists from their respective collections
    final workoutExercises =
        Provider.of<WorkoutExercises>(context, listen: false);

    workoutExercises.setExercises(completeList);

    // Build the widget with data.
    return HomePage();
  }
}
