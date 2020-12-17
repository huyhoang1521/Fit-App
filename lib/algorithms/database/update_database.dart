import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final User user = auth.currentUser;
final userDoc = FirebaseFirestore.instance.collection('Users').doc(user.uid);
final db = FirebaseFirestore.instance;
final auth = FirebaseAuth.instance;
final uid = user.uid;

class UpdateDatabase {
  void createWorkout() async {
    // warmup
    await db.collection('Warmups').get().then((docs) {
      docs.docs.forEach((document) async {
        document.reference.update(<String, dynamic>{
          "name": document.reference.id,
          "description": "description"
        });
      });
    });
    // Exercise
    await db.collection('Exercises').get().then((docs) {
      docs.docs.forEach((document) async {
        document.reference.update(<String, dynamic>{
          "name": document.reference.id,
          "description": "description"
        });
      });
    });
    // Progressions
    await db.collection('Progressions').get().then((docs) {
      docs.docs.forEach((document) async {
        document.reference.update(<String, dynamic>{
          "name": document.reference.id,
          "description": "description"
        });
      });
    });
  }
}
