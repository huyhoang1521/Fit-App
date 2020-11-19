import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fit_app/algorithms/progressions.dart';
import 'package:fit_app/algorithms/warmup.dart';
import 'package:fit_app/models/user_progression.dart';
import 'package:fit_app/models/user_warmup.dart';
import 'package:fit_app/models/user_workout.dart';
import 'package:flutter/material.dart';

UserWarmup userWarmup =
    new UserWarmup(null, null, null, null, null, null, null, null);
List<Widget> exercisesFields = new List();
UserWorkout userWorkout;
UserProgression userProgression;
Warmup warmup = new Warmup();
Progressions progressions = new Progressions();

class SelectExercise {
  Future<List<Map<String, dynamic>>> setWarmupList(UserWorkout userWorkout) =>
      Future.delayed(Duration(seconds: 1), () async {
        List<Map<String, dynamic>> warmupList = new List();

        for (int i = 0; i < userWorkout.warmup.length; i++) {
          String subcategory;
          int reps;
          int sets;
          int duration;
          print("workout.warmup[" +
              i.toString() +
              "] = " +
              userWorkout.warmup[i].toString());
          DocumentSnapshot warmupDoc =
              await warmup.getWarmup(userWorkout.warmup[i]);

          if (warmupDoc.data().containsKey('subcategory')) {
            subcategory = warmupDoc.get('subcategory');
          }
          if (warmupDoc.data().containsKey('reps')) {
            reps = warmupDoc.get('reps');
          }
          if (warmupDoc.data().containsKey('sets')) {
            sets = warmupDoc.get('sets');
          }
          if (warmupDoc.data().containsKey('duration')) {
            duration = warmupDoc.get('duration');
          }

          warmupList.add({
            "name": warmupDoc.get('name'),
            "id": warmupDoc.get('id'),
            "category": warmupDoc.get('category'),
            "subcategory": subcategory,
            "reps": reps,
            "sets": sets,
            "duration": duration,
            "description": warmupDoc.get('description'),
          });
        }

        return warmupList;
      });

  Future<List<Map<String, dynamic>>> setProgressionsList(
          UserWorkout userWorkout) =>
      Future.delayed(Duration(seconds: 1), () async {
        List<Map<String, dynamic>> progressionsList = new List();

        for (int i = 0; i < userWorkout.exercises.length; i++) {
          print("workout.exercises[" +
              i.toString() +
              "][1] = " +
              userWorkout.exercises[i].values.elementAt(1).toString());
          DocumentSnapshot progDoc = await progressions
              .getProgressionByID(userWorkout.exercises[i].values.elementAt(1));

          progressionsList.add({
            "name": progDoc.get('name'),
            "id": progDoc.get('id'),
            "exerciseID": progDoc.get('exerciseID'),
            "level": progDoc.get('level'),
            "description": progDoc.get('description'),
          });
        }

        return progressionsList;
      });

  List<Map<String, dynamic>> createExerciseList(
      List<Map<String, dynamic>> warmupList,
      List<Map<String, dynamic>> progressionsList) {
    List<Map<String, dynamic>> exerciseList = new List();
    exerciseList += warmupList + progressionsList;

    return exerciseList;
  }
}
