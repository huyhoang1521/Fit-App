import 'package:cloud_firestore/cloud_firestore.dart';

import 'create_workout.dart';

//TODO - implement level up after workout is complete

final db = FirebaseFirestore.instance;
int subProgression;

class PostWorkout {
  Future<void> incrementSubProgression() async {
    await FirebaseFirestore.instance
        .collection('Workouts')
        .doc(user.uid)
        .update({"subProgression": subProgression++});
  }
}
