import 'package:cloud_firestore/cloud_firestore.dart';
import 'progressions.dart';

/* 
 * Selects the warmup exercises for the Users's workout.
 * Depending on the length of the workout, a different number
 * of exercises will be added to the workout.
*/

final db = FirebaseFirestore.instance;
Progressions progressions;
QuerySnapshot collection;
List<Map<String, dynamic>> exerciseList = new List();

class Exercises {
  var userDoc;
  var uid;
  String length;
  List<int> userProgressions = new List();
  Exercises(this.userDoc, this.uid, this.length, this.userProgressions);

  /* 
   * Sets the exercise list for the user's workout. Gets the exercise 
   * collection from the getExercise function. If the legnth of the 
   * workout is short, add 1 push, 1 pull, and 1 leg. Else, add 2 push,
   * 2 pull, and 1 leg to the workout.
  */
  Future<List<Map<String, dynamic>>> setExerciseList() async {
    await db
        .collection('Exercises')
        .orderBy('id', descending: false)
        .get()
        .then((collection) {
      if (length == "Short") {
        exerciseList.addAll([
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
        exerciseList.addAll([
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
      exerciseList.add((collection.docs
          .where((doc) => doc["type"] == "Legs")
          .map((category) => category.data())
          .first));
    });

    printExerciseList(exerciseList);
    return exerciseList;
  }

  /* 
   * Prints the exercise list that will be added to the user's workout.
   * Only prints id's of each exercise. However, all data from each 
   * exercise is added to the workout.
  */
  void printExerciseList(List<Map<String, dynamic>> exerciseList) {
    if (exerciseList.isEmpty) {
      print('EXERCISE LIST IS EMPTY');
    } else {
      String str = "EXERCISE LIST: ";
      for (int i = 0; i < exerciseList.length; i++) {
        if (i == 0) {
          str += "[" + exerciseList[i]['id'].toString() + ", ";
        } else if (i == exerciseList.length - 1) {
          str += exerciseList[i]['id'].toString() + "]";
        } else {
          str += exerciseList[i]['id'].toString() + ", ";
        }
      }
      print(str);
    }
  }
}
