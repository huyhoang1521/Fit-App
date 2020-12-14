import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_app/algorithms/workout/exercises.dart';
import 'package:fit_app/models/fit_user.dart';
import '../../models/user_workout.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'warmup.dart';
import 'progressions.dart';

/* 
 * Creates a workout for the User using the fields provided. Finds
 * the user id and uses it to query the database. After the data
 * has been set, a Workout object is inialized with the data.
 * Stores the information into Firebase, using the object data.
*/

final User user = auth.currentUser;
final userDoc = FirebaseFirestore.instance.collection('Users').doc(user.uid);
final db = FirebaseFirestore.instance;
final auth = FirebaseAuth.instance;
final uid = user.uid;

class CreateWorkout {
  /* 
   * Writes the workout data to firebase. Creates an object for each
   * of the 3 main exercises classes. For each object, calculate the
   * specific data for each exercise. Calcuate the rest time based
   * on the user's workout goal. Create a workout object with all
   * of the data calculated and write to firebase. Update the users'
   * progressions to indicate that they are in work.
  */
  Future<void> createWorkout() async {
    List<Map<String, dynamic>> workoutExercises = new List();
    List<Map<String, dynamic>> workoutProgressions = new List();
    List<Map<String, dynamic>> workoutWarmups = new List();
    FitUser fitUser;
    int coolDown = 2;
    double restTime;
    double age;

    await fetchUserData().then((value) => fitUser = value);
    age = getAge(fitUser.dob);

    Exercises exercises =
        new Exercises(userDoc, uid, fitUser.length, fitUser.progressions);
    Progressions progressions =
        new Progressions(userDoc, uid, fitUser.progressions);
    Warmup warmup = new Warmup(age);

    workoutExercises = await exercises.setExerciseList();
    workoutWarmups = await warmup.setWarmUpList();
    workoutProgressions =
        await progressions.setProgressionsList(workoutExercises);

    if (fitUser.goal == "Strength") {
      restTime = 3;
    } else {
      restTime = 1.5;
    }

    await Future.delayed(Duration(seconds: 1));
    final UserWorkout workout = new UserWorkout(
        uid,
        fitUser.length,
        fitUser.goal,
        restTime,
        coolDown,
        workoutExercises,
        workoutProgressions,
        workoutWarmups);

    await db.collection("Workouts").doc(uid).set(workout.toJson());
    await progressions.updateProgression(fitUser.progressions);
  }

  /* 
   * Fetches the user document from firebase using the uid.
   * Stores the data in a user object that will be used to 
   * create the workout. Returns the user object
  */
  Future<FitUser> fetchUserData() async {
    FitUser fitUser;
    print("CREATING WORKOUT");
    print("User ID: " + uid);

    await userDoc.get().then((DocumentSnapshot userData) {
      if (userData.exists) {
        fitUser = new FitUser(
            userData.data()['firstName'],
            userData.data()['lastName'],
            userData.data()['email'],
            userData.data()['dob'],
            userData.data()['weight'],
            userData.data()['goal'],
            userData.data()['length'],
            userData.data()['equipment'],
            userData.data()['primaryPushGoal'],
            userData.data()['primaryPullGoal'],
            userData.data()['height'],
            List.from(userData.data()['progressions']));
      }
    });

    return fitUser;
  }

  /* 
   * Gets the age of the current user. Subtracts the current
   * date from the user's birthday. Age will be used to calculate
   * the length of the warmup.
  */
  double getAge(String dob) {
    double age;
    DateTime dateTime;
    //if (userDob != null) {
    dateTime = new DateFormat("MM-dd-yyyy").parse(dob);
    final date2 = DateTime.now();
    age = (date2.difference(dateTime).inDays / 365);
    print("Age: " + age.toString());
    return age;
    //}
  }
}
