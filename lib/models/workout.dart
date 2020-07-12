class Workout {
  String length;
  int type;
  List<int> exercises;
  int restTime;

  Workout(this.length, this.type, this.exercises, this.restTime);

  Map<String, dynamic> toJson() => {
        'length': length,
        'type': type,
        'exercises': exercises,
        'restTime': restTime,
      };
}
