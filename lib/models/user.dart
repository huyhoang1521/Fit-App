class User {
  String firstName;
  String lastName;
  String email;
  String dob;
  int height;
  int weight;
  String goal;
  String length;
  String equipment;
  String prefferedExercises;
  List<int> progressions = new List(19);

  User(
      this.firstName,
      this.lastName,
      this.email,
      this.dob,
      this.weight,
      this.goal,
      this.length,
      this.equipment,
      this.prefferedExercises,
      this.height,
      this.progressions);

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'dob': dob,
        'height': height,
        'weight': weight,
        'goal': goal,
        'length': length,
        'equipment': equipment,
        'prefferedExercises': prefferedExercises,
        'progressions': progressions
      };
}
