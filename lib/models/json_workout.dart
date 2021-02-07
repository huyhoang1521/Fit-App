class JsonWorkout {
  String uid;
  String goal;
  String length;
  double restTime;
  int coolDown;
  List<Map<String, dynamic>> exerciseMap;
  List<Map<String, dynamic>> exercises;
  List<Map<String, dynamic>> progressions;
  List<Map<String, dynamic>> warmup;

  JsonWorkout(this.uid, this.goal, this.length, this.restTime, this.coolDown,
      this.exerciseMap, this.exercises, this.progressions, this.warmup);

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'goal': goal,
        'length': length,
        'restTime': restTime,
        'coolDown': coolDown,
        'exerciseMap': exerciseMap,
        'exercises': exercises,
        'progressions': progressions,
        'warmup': warmup,
      };
}
