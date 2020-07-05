class Exercise {
  String name;
  int level;
  String image;
  String type;
  String position;
  String movement;
  String equipment;

  Exercise(this.name, this.image, this.equipment, this.type, this.position,
      this.level, this.movement);

  Map<String, dynamic> toJson() => {
        'name': name,
        'level': level,
        'image': image,
        'type': type,
        'position': position,
        'movement': movement,
        'equipment': equipment
      };
}
