class UserWarmup {
  String name;
  int id;
  String category;
  String subCategory;
  int reps;
  int sets;
  int duration;
  String description;

  UserWarmup(this.name, this.id, this.category, this.subCategory, this.reps,
      this.sets, this.duration, this.description);

  Map<String, dynamic> toJson() => {
        'name': name,
        'description': id,
        'level': category,
        'image': subCategory,
        'reps': reps,
        'sets': sets,
        'duration': duration,
        'position': description,
      };
}
