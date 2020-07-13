class User {
  String firstName;
  String lastName;
  String email;
  String dob;
  int weight;
  String goal;
  String length;
  String equipment;
  String prefferedExercises;

  User(this.firstName, this.lastName, this.email, this.dob, this.weight,
      this.goal, this.length, this.equipment, this.prefferedExercises);

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'dob': dob,
        'weight': weight,
        'goal': goal,
        'length': length,
        'equipment': equipment,
        'prefferedExercises': prefferedExercises
      };
}
