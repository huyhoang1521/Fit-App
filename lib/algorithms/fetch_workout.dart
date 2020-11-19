import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fit_app/algorithms/create_workout.dart';
import 'package:fit_app/algorithms/select_exercise.dart';
import 'package:fit_app/models/user_workout.dart';

SelectExercise selectExercise = new SelectExercise();
List<Map<String, dynamic>> warmupList = new List();
List<Map<String, dynamic>> progressionList = new List();

final workoutDoc =
    FirebaseFirestore.instance.collection('Workouts').doc(user.uid);

class FetchWorkout {
  Future<UserWorkout> fetchUserWorkout() =>
      Future.delayed(Duration(seconds: 1), () async {
        UserWorkout workout;
        await workoutDoc.get().then((DocumentSnapshot userData) async {
          if (userData.exists) {
            List<Map<String, int>> exerciseList = new List();
            List<int> warmupList = new List.from(userData.data()['warmup']);

            List<Map<String, int>>.from(
                userData.data()["exercises"].map((item) {
              exerciseList.add({
                "exerciseID": item["exerciseID"],
                "progressionID": item["progressionID"]
              });
            }));
            workout = new UserWorkout(
              userData.data()['uid'],
              userData.data()['length'],
              userData.data()['goal'],
              userData.data()['restTime'],
              userData.data()['coolDown'],
              exerciseList,
              warmupList,
            );

            await getExerciseLists(workout);
          }
        });

        return workout;
      });

  Future<void> getExerciseLists(UserWorkout workout) =>
      Future.delayed(Duration(seconds: 1), () async {
        progressionList = await selectExercise.setProgressionsList(workout);
        warmupList = await selectExercise.setWarmupList(workout);
      });

  List<Map<String, dynamic>> getProgressionList() {
    return progressionList;
  }

  List<Map<String, dynamic>> getWarmupList() {
    return warmupList;
  }
}
