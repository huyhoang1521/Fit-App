import 'package:cloud_firestore/cloud_firestore.dart';

import 'create_workout.dart';

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
