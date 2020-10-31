class FitUser {
  String firstName;
  String lastName;
  String email;
  String dob;
  String height;
  int weight;
  String goal;
  String length;
  String equipment;
  String primaryPushGoal;
  String primaryPullGoal;
  List<int> progressions;

  FitUser(
      this.firstName,
      this.lastName,
      this.email,
      this.dob,
      this.weight,
      this.goal,
      this.length,
      this.equipment,
      this.primaryPushGoal,
      this.primaryPullGoal,
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
        'primaryPushGoal': primaryPushGoal,
        'primaryPullGoal': primaryPullGoal,
        'progressions': progressions
      };
}
