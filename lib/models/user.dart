class User {
  String firstName;
  String lastName;
  String email;
  String dob;
  int weight;
  String goal;
  String equipment;
  String prefferedExercises;

  User(this.firstName, this.lastName, this.email, this.dob, this.weight,
      this.goal, this.equipment, this.prefferedExercises);

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'dob': dob,
        'weight': weight,
        'goal': goal,
        'equipment': equipment,
        'prefferedExercises': prefferedExercises
      };
}
