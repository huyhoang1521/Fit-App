import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

/* 
 * Selects the exercises for the Users's workout.
 * Also sets a list of exercises to keep track of what 
 * levels the user is on. Once a progression is completed, 
 * the level will be incremented and stored in the user's 
 * list of progression id's.
*/
class Exercises {
  final db = FirebaseFirestore.instance;
  var userDoc;
  var uid;
  String length;

  // Constructor
  Exercises([this.uid, this.length]);

  Future<List<Map<String, dynamic>>> setExercisesList() async {
    List<Map<String, dynamic>> exercisesList = [];
    await db
        .collection('Exercises')
        .orderBy('id', descending: false)
        .where('level', isEqualTo: 1)
        .get()
        .then((collection) {
      if (length == "Short") {
        exercisesList.addAll([
          (collection.docs
              .where((doc) => doc["type"] == "Push")
              .map((category) => category.data())
              .first),
          (collection.docs
              .where((doc) => doc["type"] == "Pull")
              .map((category) => category.data())
              .first)
        ]);
      } else {
        exercisesList.addAll([
          (collection.docs
              .where((doc) => doc["type"] == "Push")
              .where((doc) => doc["position"] == "Vertical")
              .map((category) => category.data())
              .first),
          (collection.docs
              .where((doc) => doc["type"] == "Push")
              .where((doc) => doc["position"] == "Horizontal")
              .map((category) => category.data())
              .first),
          (collection.docs
              .where((doc) => doc["type"] == "Pull")
              .where((doc) => doc["position"] == "Vertical")
              .map((category) => category.data())
              .first),
          (collection.docs
              .where((doc) => doc["type"] == "Pull")
              .where((doc) => doc["position"] == "Horizontal")
              .map((category) => category.data())
              .first),
        ]);
      }
      exercisesList.add((collection.docs
          .where((doc) => doc["type"] == "Legs")
          .map((category) => category.data())
          .first));
    });

    return exercisesList;
  }

  /* 
   * Selects the warmup exercises for the Users's workout.
   * Depending on the age of the user, a certain number of exercises
   * will be added to their workout. After each workout is completed, 
   * the user will receive a different set of warmups for the next workout, 
   * since each time warmup exercises are selected at random.
  */
  Future<int> getMaxLevelProgression(int exerciseID) async {
    int level;
    await db
        .collection('Exercises')
        .where('exerciseID', isEqualTo: exerciseID)
        .orderBy('level', descending: true)
        .limit(1)
        .get()
        .then((QuerySnapshot docs) {
      if (docs.docs.isNotEmpty) {
        level = docs.docs[0].get('level');
      }
    });
    return level;
  }

  /* 
   * Prints the exercises list that will be added to the user's workout
   * Only prints id's of each exercise However, all data from each exercise 
   * is added to the workout
  */
  void printProgressionWorkoutList(List<Map<String, dynamic>> exercisesList) {
    if (exercisesList.isEmpty) {
      print('EXERCISES LIST IS EMPTY');
    } else {
      String str = "EXERCISES LIST: ";
      for (int i = 0; i < exercisesList.length; i++) {
        if (i == 0) {
          str += "[" + exercisesList[i]['id'].toString() + ", ";
        } else if (i == exercisesList.length - 1) {
          str += exercisesList[i]['id'].toString() + "]";
        } else {
          str += exercisesList[i]['id'].toString() + ", ";
        }
      }
      print(str);
    }
  }
}
