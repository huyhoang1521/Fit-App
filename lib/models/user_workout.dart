class UserWorkout {
  String uid;
  String goal;
  String length;
  double restTime;
  int coolDown;
  List<Map<String, dynamic>> exercises;
  List<Map<String, dynamic>> progressions;
  List<Map<String, dynamic>> warmup;

  UserWorkout(this.uid, this.goal, this.length, this.restTime, this.coolDown,
      this.exercises, this.progressions, this.warmup);

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'goal': goal,
        'length': length,
        'restTime': restTime,
        'coolDown': coolDown,
        'exercises': exercises,
        'progressions': progressions,
        'warmup': warmup,
      };
}
