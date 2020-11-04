class Exercise {
  String name;
  String description;
  int level;
  String image;
  String type;
  String position;
  String movement;
  String equipment;

  Exercise(this.name, this.description, this.image, this.equipment, this.type,
      this.position, this.level, this.movement);

  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
        'level': level,
        'image': image,
        'type': type,
        'position': position,
        'movement': movement,
        'equipment': equipment
      };
}
