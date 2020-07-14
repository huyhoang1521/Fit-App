import '../models/workout.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../widgets/provider_widget.dart';
import 'package:flutter/material.dart';

class WorkoutConstructor {
  var age;
  var length;
  var weight; // long vs short
  var goal; // hyper vs strength
  var push;
  var verticalPush;
  var horizontalPush;
  var pull;
  var verticalPull;
  var horizontalPull;

  final Workout workout = new Workout(null, null, null, null);

  // Calls all functions for push
  void pushQuery(BuildContext context) {
    List<String> pushExerciseList = new List();
    pushExerciseList = pushExercises(pushExerciseList);
    createWorkout(context, pushExerciseList);
  }

  /* 
   * Returns a list of exercises that are of type Push
   * Starts by querying the database for push exercises
   * Order them by id and add them to a list
  */
  List<String> pushExercises(List<String> pushExerciseList) {
    pushExerciseList = new List();

    // Query database for push exercises
    Firestore.instance
        .collection('Exercise General')
        .where('type', isEqualTo: 'Push')
        .orderBy('id', descending: true)
        .getDocuments()
        .then((QuerySnapshot docs) {
      print("returning list of push workouts");
      print("length of push workouts list is " +
          docs.documents.length.toString());

      // Add exercises to the list
      if (docs.documents.isNotEmpty) {
        for (int i = 0; i < docs.documents.length; i++) {
          if (!pushExerciseList.contains(docs.documents[i].data.toString())) {
            pushExerciseList.add(docs.documents[i].data.toString());
            print("pushworkouts[" +
                i.toString() +
                "] = " +
                pushExerciseList[i].toString());
          }
        }
      }
    });
    return pushExerciseList;
  }

  /* 
  * Creates a workout using the user fields
  * Finds the user id and uses it to query the database
  * Assigns the push exercise to the push variable
  * If the length is Short(40 min), only assign the user 1 push
  * If the length is long(1 hour), a vertical and horizontal push query must be implemented
  */
  void createWorkout(
      BuildContext context, List<String> pushExerciseList) async {
    // Get user id
    final uid = await ProviderWidget.of(context).auth.getCurrentUID();
    print("uid: " + uid.toString());

    // Find user by id
    final user = Firestore.instance.collection('Users').document(uid);
    user.get().then((userData) {
      goal = userData.data['goal'];
      length = userData.data['length'];
      print("goal is: " + goal);
      print("length is: " + length);

      // Assign exercises based on user fields
      if (goal == "Strength") {
        if (length == "Short") {
          // 1 push
          push = pushExerciseList[0];
          print("push asigned for short workout is: " + push);
          // 1 pull
          // 1 leg
          // 3 min rest
        } else {
          // 1 horizontal push
          // 1 vertical push
          // 1 horizontal pull
          // 1 vertical pull
          // 1 leg
          // 3 min rest
        }
      } else {
        if (length == "Short") {
          // 1 push
          // 1 pull
          // 1 leg
          // 1.5 min rest
        } else {
          // 1 horizontal push
          // 1 vertical push
          // 1 horizontal pull
          // 1 vertical pull
          // 1 leg
          // 1.5 min rest
        }
      }
    });
  }
}
