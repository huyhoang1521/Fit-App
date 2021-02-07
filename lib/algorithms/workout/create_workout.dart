import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_app/algorithms/workout/exercises.dart';
import 'package:fit_app/models/exercise_structures.dart';
import 'package:fit_app/models/fit_user.dart';
import 'package:fit_app/models/json_workout.dart';
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
final auth = FirebaseAuth.instance;
final uid = user.uid;
ExerciseStructures exerciseStructures = new ExerciseStructures();
List<Map<String, dynamic>> exerciseMap = exerciseStructures.workoutExercisesMap;

class CreateWorkout {
  /* 
   * Writes the workout data to firebase. Creates an object for each
   * of the 3 main exercises classes. For each object, calculate the
   * specific data for each exercise. Calcuate the rest time based
   * on the user's workout goal. Create a workout object with all
   * of the data calculated and write to firebase. Update the users'
   * progressions to indicate that they are in work.
  */
  Future<JsonWorkout> createWorkout(FitUser fitUser) async {
    print("CREATING WORKOUT");
    print("User ID: " + uid);

    int coolDown = 2;
    double restTime;
    double age;
    age = getAge(fitUser.dob);

    Exercises exercises = new Exercises(uid, fitUser.length);
    Progressions progressions = new Progressions(uid);
    Warmup warmup = new Warmup(age);

    List<Map<String, dynamic>> workoutExercises = new List();
    List<Map<String, dynamic>> workoutProgressions = new List();
    List<Map<String, dynamic>> workoutWarmups = new List();

    workoutExercises = await exercises.setExerciseList();
    workoutWarmups = await warmup.setWarmUpList();
    workoutProgressions =
        await progressions.setProgressionsList(workoutExercises);

    if (fitUser.goal == "Strength") {
      restTime = 3;
    } else {
      restTime = 1.5;
    }

    await Future.delayed(Duration(seconds: 2));

    for (int i = 0; i < exerciseStructures.workoutExercisesMap.length; i++) {
      // increment selected progressions in workout
      int maxLevel = await progressions.getMaxLevelProgression(i);
      exerciseMap[i]['maxProgressionLevel'] = maxLevel;
      for (int j = 0; j < workoutExercises.length; j++) {
        if (workoutExercises[j]['id'] == i) {
          exerciseMap[workoutExercises[j]['id']]['inWorkout'] = true;
          exerciseMap[workoutExercises[j]['id']]['progressionLevel']++;
          //exerciseMap[workoutExercises[j]['id']]['subProgressionLevel']++;
        }
      }
    }

    final UserWorkout userWorkout = new UserWorkout(uid, fitUser.length,
        fitUser.goal, restTime, coolDown, exerciseMap, workoutWarmups);

    await FirebaseFirestore.instance
        .collection("Workouts")
        .doc(uid)
        .set(userWorkout.toJson());

    final JsonWorkout workout = new JsonWorkout(
        uid,
        fitUser.length,
        fitUser.goal,
        restTime,
        coolDown,
        exerciseMap,
        workoutExercises,
        workoutProgressions,
        workoutWarmups);

    return workout;
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
