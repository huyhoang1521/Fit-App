import '../models/workout.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user.dart';

var age;
var length;
var weight; // long vs short
var type; // hyper vs strength

bool temp(String stringA, String stringB) {
  final Workout workout = new Workout(null, null, null, null);
  final dbRef = Firestore.instance
      .collection('Exercise General')
      .where('type', isEqualTo: 'push');
  final dbRef2 = Firestore.instance.collection('Exercise Specific');

  print(dbRef.toString());
  if (type == "Strength") {
    if (length == "Short") {
      // 1 push
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

  return true;
}
