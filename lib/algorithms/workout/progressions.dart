import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

/* 
 * Selects the progression exercises for the Users's workout.
 * Also sets a list of progressions to keep track of what 
 * levels the user is on. Once a progression is completed, 
 * the level will be incremented and stored in the user's 
 * list of progression id's.
*/
class Progressions {
  final db = FirebaseFirestore.instance;
  var userDoc;
  var uid;
  List<int> userProgressions = new List();

  // Constructor
  Progressions([this.userDoc, this.uid, this.userProgressions]);

  /* 
   * Sets the progression list for the user's workout.
   * Takes in the user's exercise list and uses the id's to
   * fetch the lowest id progression in that exercise category
  */
  Future<List<Map<String, dynamic>>> setProgressionsList(
      List<Map<String, dynamic>> exercisesList) async {
    List<Map<String, dynamic>> progressionsList = new List();
    await db
        .collection('Progressions')
        .orderBy('id', descending: false)
        .get()
        .then((collection) async {
      // query progressions collection to get value
      for (int i = 0; i < exercisesList.length; i++) {
        progressionsList.add((collection.docs
            .where((doc) => doc["exerciseID"] == exercisesList[i]['id'])
            .map((category) => category.data())
            .first));

        // increment selected progressions in workout
        int maxLevel = await getMaxLevelProgression(exercisesList[i]['id']);
        if (userProgressions[exercisesList[i]['id']] < maxLevel) {
          userProgressions[exercisesList[i]['id']]++;
        }
      }
    });

    printProgressionWorkoutList(progressionsList);
    return progressionsList;
  }

  /* 
   * Selects the warmup exercises for the Users's workout.
   * Depending on the age of the user, a certain number of exercises
   * will be added to their workout. After each workout is completed, 
   * the user will receive a different set of warmups for the next workout, 
   * since each time warmup exercises are selected at random.
  */
  Future<int> getMaxLevelProgression(int exerciseID) async {
    int progressionID;
    await db
        .collection('Progressions')
        .where('exerciseID', isEqualTo: exerciseID)
        .orderBy('level', descending: true)
        .limit(1)
        .get()
        .then((QuerySnapshot docs) {
      if (docs.docs.isNotEmpty) {
        progressionID = docs.docs[0].data()['id'];
      }
    });
    return progressionID;
  }

  /* 
   * Updates the progression id for the user's workout.
   * Called when a user completes a progression, indicating 
   * that they are ready to go to the next exercise. Stores 
   * the data in the user's document in firebase
  */
  Future<void> updateProgression(List<int> progressions) async {
    await userDoc.update({"progressions": progressions});
    printProgressionList();
  }

  /* 
   * Prints the progression list that will be added to the user's workout
   * Only prints id's of each exercise However, all data from each exercise 
   * is added to the workout
  */
  void printProgressionWorkoutList(
      List<Map<String, dynamic>> progressionsList) {
    if (progressionsList.isEmpty) {
      print('PROGRESSIONS LIST IS EMPTY');
    } else {
      String str = "PROGRESSIONS LIST: ";
      for (int i = 0; i < progressionsList.length; i++) {
        if (i == 0) {
          str += "[" + progressionsList[i]['id'].toString() + ", ";
        } else if (i == progressionsList.length - 1) {
          str += progressionsList[i]['id'].toString() + "]";
        } else {
          str += progressionsList[i]['id'].toString() + ", ";
        }
      }
      print(str);
    }
  }

  /* 
   * Prints the progression list that will be added to the user's document
   * Only prints id's of each exercise However, all data from each exercise
   * is added to the user's document
  */
  void printProgressionList() {
    if (userProgressions.isEmpty) {
      print('PROGRESSIONS LEVEL LIST IS EMPTY');
    } else {
      String str = "PROGRESSIONS LEVEL LIST: ";
      for (int i = 0; i < userProgressions.length; i++) {
        if (i == 0) {
          str += "[" + userProgressions[i].toString() + ", ";
        } else if (i == userProgressions.length - 1) {
          str += userProgressions[i].toString() + "]";
        } else {
          str += userProgressions[i].toString() + ", ";
        }
      }
      print(str);
    }
  }
}
