import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_app/algorithms/exercises.dart';
import '../models/workout.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'warmup.dart';
import 'progressions.dart';

final User user = auth.currentUser;
final userDoc = FirebaseFirestore.instance.collection('Users').doc(user.uid);
final db = FirebaseFirestore.instance;
final auth = FirebaseAuth.instance;
final uid = user.uid;

List<Map<String, int>> exercisesList = new List();
List<int> warmupList = new List();
List<int> userProgressions = new List();
Progressions progressions;
Exercises exercises;
Warmup warmup;
int coolDown = 2;
double restTime;
double age;
String userLength;
String userGoal;
String userDob;

/* 
  * Creates a workout for the User using the fields provided
  * Finds the user id and uses it to query the database
  * After the data has been set, a Workout object is inialized with the data
  * Stores the information into Firebase, using the object data
  */
class CreateWorkout {
  void createWorkout() async {
    print("CREATING WORKOUT");
    print("User ID: " + uid);

    userDoc.get().then((DocumentSnapshot userData) {
      if (userData.exists) {
        userProgressions = List.from(userData.data()['progressions']);
        userLength = userData.data()['length'];
        userGoal = userData.data()['goal'];
        userDob = userData.data()['dob'];
      }
    }).whenComplete(() async {
      getAge();
      exercises = new Exercises(userDoc, uid, userLength, userProgressions);
      progressions = new Progressions(userDoc, uid, userProgressions);
      warmup = new Warmup(age);
      warmupList = await warmup.createWarmUp();
      exercisesList = await exercises.setExerciseList();

      setWorkout();
    });
  }

  Future<void> setWorkout() async {
    if (userGoal == "Strength") {
      restTime = 3;
    } else {
      restTime = 1.5;
    }

    await Future.delayed(Duration(seconds: 1));
    final Workout workout = new Workout(uid, userLength, userGoal,
        exercisesList, warmupList, restTime, coolDown);

    await db.collection("Workouts").doc(uid).set(workout.toJson());
    progressions.updateProgression(userProgressions);
    warmup.printWarmupList(warmupList);
    progressions.printProgressionList();
  }

  void getAge() {
    DateTime dateTime;
    //if (userDob != null) {
    dateTime = new DateFormat("MM-dd-yyyy").parse(userDob);
    final date2 = DateTime.now();
    age = (date2.difference(dateTime).inDays / 365);
    print("Age: " + age.toString());
    //}
  }
}
