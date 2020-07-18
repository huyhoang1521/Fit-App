class Workout {
  String uid;
  String length;
  String goal;
  List<String> exercises;
  double restTime;
  String coolDown;

  Workout(this.uid, this.length, this.goal, this.exercises, this.restTime,
      this.coolDown);

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'length': length,
        'goal': goal,
        'exercises': exercises,
        'restTime': restTime,
        'coolDown': coolDown
      };
}
