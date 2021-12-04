import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

User user = auth.currentUser;
final userDoc = FirebaseFirestore.instance.collection('Users').doc(user.uid);
final db = FirebaseFirestore.instance;
final auth = FirebaseAuth.instance;
final uid = user.uid;

class UpdateDatabase {
  void updateDatabase() async {
    // warmup
    /*await db.collection('Warmups').get().then((docs) {
      docs.docs.forEach((document) async {
        document.reference.update(<String, dynamic>{
          "name": document.reference.id,
          "description": "description"
        });
      });
    });*/
    // Exercise
    /*await db.collection('Exercises').get().then((docs) {
      docs.docs.forEach((document) async {
        document.reference.update(<String, dynamic>{
          "name": document.reference.id,
          "description": "description"
        });
      });
    });*/
    // Progressions
    /*await db.collection('Progressions').get().then((docs) {
      docs.docs.forEach((document) async {
        document.reference.update(<String, dynamic>{
          "name": document.reference.id,
          "description": "description"
        });
      });
    });*/

    /*for (int i = 0; i < 19; i++) {
      int count = 1;
      await db
          .collection('Progressions')
          .where('exerciseID', isEqualTo: i)
          .orderBy('id', descending: false)
          .get()
          .then((docs) {
        docs.docs.forEach((document) async {
          document.reference.update(<String, dynamic>{"level": count});
          count++;
        });
      });
    }*/
    /*List<QueryDocumentSnapshot> progressionsList;
    await db.collection('Progressions').get().then((docs) {
      docs.docs.forEach((document) async {
        progressionsList = docs.docs;
      });
    });

    await db.collection('Exercises').get().then((docs) {
      docs.docs.forEach((document) async {
        int count = 0;
        for (int i = 0; i < progressionsList.length; i++) {
          if (progressionsList[i].data()['exerciseID'] ==
              document.data()['id']) {
            count++;
          }
        }
        document.reference.update(<String, dynamic>{
          "progressions": count,
        });
      });
    });*/
  }
}
