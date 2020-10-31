class Workout {
  String uid;
  String length;
  String goal;
  List<Map<String, int>> exercises;
  List<int> warmup;
  double restTime;
  int coolDown;

  Workout(this.uid, this.length, this.goal, this.exercises, this.warmup,
      this.restTime, this.coolDown);

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'length': length,
        'goal': goal,
        'exercises': exercises,
        'warmup': warmup,
        'restTime': restTime,
        'coolDown': coolDown
      };
}
