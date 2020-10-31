import 'package:cloud_firestore/cloud_firestore.dart';
import 'progressions.dart';

final db = FirebaseFirestore.instance;
Progressions progressions;
QuerySnapshot collection;
List<Map<String, int>> exercises = new List();
List<int> exerciseList = new List();

/* 
  * Class for exercises
  * Provides functions to update exercises in a User's workout
  */
class Exercises {
  var userDoc;
  var uid;
  String length;
  List<int> userProgressions = new List();
  Exercises(this.userDoc, this.uid, this.length, this.userProgressions);

  Future<void> queryExercises() async {
    progressions = new Progressions(userDoc, uid, userProgressions);
    await db
        .collection('Exercises')
        .orderBy('id', descending: false)
        .get()
        .then((coll) {
      collection = coll;
    });
  }

  Future<List<Map<String, int>>> setExerciseList() async {
    await queryExercises();
    if (length == "Short") {
      exerciseList.addAll([
        (collection.docs
            .where((doc) => doc["type"] == "Push")
            .map((category) => category.data()['id'])).toList()[0],
        (collection.docs
            .where((doc) => doc["type"] == "Pull")
            .map((category) => category.data()['id'])).toList()[0]
      ]);
    } else {
      exerciseList.addAll([
        (collection.docs
            .where((doc) => doc["type"] == "Push")
            .where((doc) => doc["position"] == "Vertical")
            .map((category) => category.data()['id'])).toList()[0],
        (collection.docs
            .where((doc) => doc["type"] == "Push")
            .where((doc) => doc["position"] == "Horizontal")
            .map((category) => category.data()['id'])).toList()[0],
        (collection.docs
            .where((doc) => doc["type"] == "Pull")
            .where((doc) => doc["position"] == "Vertical")
            .map((category) => category.data()['id'])).toList()[0],
        (collection.docs
            .where((doc) => doc["type"] == "Pull")
            .where((doc) => doc["position"] == "Horizontal")
            .map((category) => category.data()['id'])).toList()[0],
      ]);
    }
    exerciseList.add((collection.docs
        .where((doc) => doc["type"] == "Legs")
        .map((category) => category.data()['id'])).toList()[0]);

    await addProgressionsToList();
    return exercises;
  }

  Future<void> addProgressionsToList() async {
    // query progressions collection to get value
    for (int i = 0; i < exerciseList.length; i++) {
      int progressionID = await progressions.getProgression(exerciseList[i]);
      exercises
          .add({"exerciseID": exerciseList[i], "progressionID": progressionID});

      // increment selected progressions in workout
      int maxLevel = await progressions.getMaxLevelProgression(exerciseList[i]);
      if (userProgressions[exerciseList[i]] < maxLevel) {
        userProgressions[exerciseList[i]]++;
      }

      print("ELEMENT ADDED TO EXERCISE LIST - " +
          exercises.last.toString() +
          "\n");
    }
  }
}
