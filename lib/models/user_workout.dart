class UserWorkout {
  String uid;
  String goal;
  String length;
  double restTime;
  int coolDown;
  List<Map<String, int>> exercises;
  List<int> warmup;

  UserWorkout(this.uid, this.goal, this.length, this.restTime, this.coolDown,
      this.exercises, this.warmup);

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'goal': goal,
        'length': length,
        'restTime': restTime,
        'coolDown': coolDown,
        'exercises': exercises,
        'warmup': warmup,
      };
}
