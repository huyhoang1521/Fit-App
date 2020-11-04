import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

final db = FirebaseFirestore.instance;

/* 
  * Class for progressions
  * Store User's current progression for each exercise
  */
class Progressions {
  var userDoc;
  var uid;
  List<int> userProgressions = new List();
// In the constructor
  Progressions([this.userDoc, this.uid, this.userProgressions]);

  Future<void> updateProgression(List<int> progressions) async {
    await userDoc.update({"progressions": progressions});
  }

  Future<int> getProgression(int exerciseID) async {
    int progressionID;
    await db
        .collection('Progressions')
        .where('exerciseID', isEqualTo: exerciseID)
        .orderBy('id', descending: false)
        .limit(1)
        .get()
        .then((QuerySnapshot docs) {
      if (docs.docs.isNotEmpty) {
        progressionID = docs.docs[0].data()['id'];
      }
    });
    return progressionID;
  }

  Future<DocumentSnapshot> getProgressionByID(int id) async {
    DocumentSnapshot prog;
    await db
        .collection('Progressions')
        .where('id', isEqualTo: id)
        .limit(1)
        .get()
        .then((snapshot) {
      prog = snapshot.docs[0];
    });

    return prog;
  }

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

  void printProgressionList() {
    if (userProgressions.isEmpty) {
      print('PROGRESSIONS LIST IS EMPTY');
    } else {
      String str = "PROGRESSIONS LIST: ";
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
