class UserProgression {
  String name;
  int id;
  int exerciseID;
  int level;
  String description;
  String image;

  UserProgression(this.name, this.id, this.exerciseID, this.level,
      this.description, this.image);

  Map<String, dynamic> toJson() => {
        'name': name,
        'id': id,
        'exerciseID': exerciseID,
        'level': level,
        'description': description,
        'image': image,
      };
}
