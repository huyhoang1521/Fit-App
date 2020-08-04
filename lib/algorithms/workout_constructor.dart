import '../models/workout.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../widgets/provider_widget.dart';
import 'package:flutter/material.dart';

final db = Firestore.instance;
List<String> pushList;
List<String> pullList;
List<String> pushHorizontalList;
List<String> pushVerticalList;
List<String> pullHorizontalList;
List<String> pullVerticalList;
List<String> legsExerciseList;
List<String> exercises;
String userId;
String length;
String goal;
List<int> progressions;
double restTime;
String coolDown;

class WorkoutConstructor {
  /* 
  * Creates a workout using the user fields
  * Finds the user id and uses it to query the database
  * Assigns the exercise to the corresponding list
  * If the length is short (40 min), only assign the user 1 push and 1 pull
  * If the length is long (1 hour), assigns a vertical and horizontal for push and pull
  * Once the exercises have been added, the rest time and cool down is set
  * After the workout data has been set, a Workout object is created and inialized with the data
  * Finally, it stores the information into Firebase, using the object data
  */
  void createWorkout(BuildContext context) async {
    final uid = await ProviderWidget.of(context).auth.getCurrentUID();
    userId = uid;

    final user = Firestore.instance.collection('Users').document(uid);

    user.get().then((userData) {
      length = userData.data['length'];
      goal = userData.data['goal'];
      progressions = userData.data['progressions'];
    }).whenComplete(() async {
      exercises = new List();
      if (length == "Short") {
        pushList = new List();
        pushList = await getExercises("Push", '');

        if (pushList.isNotEmpty) {
          exercises.add(pushList[0]);
          print(
              "-------------- PUSH ELEMENT ADDED TO EXERCISE ARRAY --------------");
          print(pushList[0]);
          print("");
        }

        pullList = new List();
        pullList = await getExercises("Pull", '');

        if (pullList.isNotEmpty) {
          exercises.add(pullList[0]);
          print(
              "-------------- PULL ELEMENT ADDED TO EXERCISE ARRAY --------------");
          print(pullList[0]);
          print("");
        }
      } else {
        pushHorizontalList = new List();
        pushHorizontalList = await getExercises("Push", 'Horizontal');

        if (pushHorizontalList.isNotEmpty) {
          exercises.add(pushHorizontalList[0]);
          print(
              "--------- PUSH HORIZONTAL ELEMENT ADDED TO EXERCISE ARRAY ---------");

          print(pushHorizontalList[0]);
          print("");
        }

        pushVerticalList = new List();
        pushVerticalList = await getExercises("Push", 'Vertical');

        if (pushVerticalList.isNotEmpty) {
          exercises.add(pushVerticalList[0]);
          print(
              "---------- PUSH VERTICAL ELEMENT ADDED TO EXERCISE ARRAY ----------");

          print(pushVerticalList[0]);
          print("");
        }

        pullHorizontalList = new List();
        pullHorizontalList = await getExercises("Pull", 'Horizontal');

        if (pullHorizontalList.isNotEmpty) {
          exercises.add(pullHorizontalList[0]);
          print(
              "--------- PULL HORIZONTAL ELEMENT ADDED TO EXERCISE ARRAY ---------");
          print(pullHorizontalList[0]);
          print("");
        }

        pullVerticalList = new List();
        pullVerticalList = await getExercises("Pull", 'Vertical');

        if (pullVerticalList.isNotEmpty) {
          exercises.add(pullVerticalList[0]);
          print(
              "---------- PULL VERTICAL ELEMENT ADDED TO EXERCISE ARRAY ----------");
          print(pullVerticalList[0]);
          print("");
        }
      }

      legsExerciseList = new List();
      legsExerciseList = await getExercises("Legs", '');

      if (legsExerciseList.isNotEmpty) {
        exercises.add(legsExerciseList[0]);
        print(
            "-------------- LEGS ELEMENT ADDED TO EXERCISE ARRAY --------------");
        print(legsExerciseList[0]);
        print("");
      }

      if (goal == "Strength") {
        // 3 min rest
        restTime = 3;
      } else {
        // 1.5 min rest
        restTime = 1.5;
      }

      // cool down
      coolDown = "Cool Down";
    });

    await Future.delayed(Duration(seconds: 1));
    final Workout workout =
        new Workout(userId, length, goal, exercises, restTime, coolDown);
    await db.collection("Workouts").document(uid).setData(workout.toJson());
  }

  /* 
   * Returns a list of exercises that are of the desired type
   * Starts by checking the length of the workout (short vs long)
   * It then queries the database for exercises of the desired type and position
   * The query orders them by ascending id
   * If the query is succesful, the data is added to a list and returned
  */
  Future<List<String>> getExercises(String type, String position) async {
    List<String> exerciseList = new List();
    if (position == '') {
      await db
          .collection('Exercise General')
          .where('type', isEqualTo: type)
          .orderBy('id', descending: false)
          .getDocuments()
          .then((QuerySnapshot docs) {
        if (docs.documents.isNotEmpty) {
          exerciseList = addToList(exerciseList, docs, type);
        }
      });
    } else {
      await db
          .collection('Exercise General')
          .where('type', isEqualTo: type)
          .where('position', isEqualTo: position)
          .orderBy('id', descending: false)
          .getDocuments()
          .then((QuerySnapshot docs) {
        if (docs.documents.isNotEmpty) {
          exerciseList = addToList(exerciseList, docs, type);
        }
      });
    }
    return exerciseList;
  }

  /* 
   * Adds exercises of the desired type to a list
   * Loops though the data from the QuerySnapshot and adds each element to a list
   * Returns the list when completed
  */
  List<String> addToList(
      List<String> exerciseList, QuerySnapshot docs, String type) {
    print("--------------------------- FROM QUERY ---------------------------");
    for (int i = 0; i < docs.documents.length; i++) {
      if (!exerciseList.contains(docs.documents[i].data.toString())) {
        exerciseList.add(docs.documents[i].data.toString());
        print(type +
            " workouts[" +
            i.toString() +
            "] = " +
            exerciseList[i].toString());
      }
    }
    print("");
    return exerciseList;
  }

  /*
   * Creates a list of exercise specific ID's
   * In: 
   * exerciseList - list of exercise general IDs for workout 
   * progressions - user's levels for each exercise general
   * Out: 
   * res -  list of exercise specific IDs generated 
   * in the same order as exercise list
   */
  List<int> generateID(List<int> exerciseList, List<int> progressions) {
    List<int> res = new List(exerciseList.length);
    for (int i = 0; i < res.length; i++) {
      int generalID = exerciseList[i];
      int level = progressions[generalID];
      //Generate specific ID by "concatenating" generalID to their level
      int specificID = (generalID * 100) + level;
      res[i] = specificID;
    }
    return res;
  }

  //TODO
}
