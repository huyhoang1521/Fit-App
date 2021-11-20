import 'package:fit_app/components/workout/exercise_box.dart';
import 'package:flutter/material.dart';

class ExerciseFieldsCreator {
  List<Widget> populateExerciseFields(
      List<Map<String, dynamic>> exerciseList, int exerciseCount) {
    List<Widget> exercisesFields = [];
    if (exerciseList[exerciseCount]["subcategory"] != null) {
      exercisesFields.add(new ExerciseBox(
          name: "Subcategory",
          value: exerciseList[exerciseCount]["subcategory"]));
    }
    if (exerciseList[exerciseCount]["reps"] != null) {
      exercisesFields.add(new ExerciseBox(
          name: "Reps", value: exerciseList[exerciseCount]["reps"]));
    }
    if (exerciseList[exerciseCount]["sets"] != null) {
      exercisesFields.add(new ExerciseBox(
          name: "Sets", value: exerciseList[exerciseCount]["sets"]));
    }
    if (exerciseList[exerciseCount]["duration"] != null) {
      exercisesFields.add(new ExerciseBox(
          name: "Duration", value: exerciseList[exerciseCount]["duration"]));
    }
    return exercisesFields;
  }
}
