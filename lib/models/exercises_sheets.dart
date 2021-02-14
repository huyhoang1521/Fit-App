/// FeedbackForm is a data class which stores data fields of Feedback.
class ExercisesSheets {
  String name;
  int id;
  int progressionID;
  int level;
  String type;
  String movement;
  String equipment;
  String difficulty;
  int maxProgression;
  String position;
  String description;

  ExercisesSheets(
      this.name,
      this.id,
      this.progressionID,
      this.level,
      this.type,
      this.movement,
      this.equipment,
      this.difficulty,
      this.maxProgression,
      this.position,
      this.description);

  factory ExercisesSheets.fromJson(dynamic json) {
    return ExercisesSheets(
        "${json['name']}",
        int.parse("${json['id']}"),
        int.parse("${json['progressionID']}"),
        int.parse("${json['level']}"),
        "${json['type']}",
        "${json['movement']}",
        "${json['equipment']}",
        "${json['difficulty']}",
        int.parse("${json['maxProgression']}"),
        "${json['position']}",
        "${json['description']}");
  }

  // Method to make GET parameters.
  Map<String, dynamic> toJson() => {
        'name': name,
        'id': id,
        'progressionID': progressionID,
        'level': level,
        'type': type,
        'movement': movement,
        'equipment': equipment,
        'difficulty': difficulty,
        'maxProgression': maxProgression,
        'position': position,
        'description': description,
      };
}
