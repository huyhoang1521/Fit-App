class UserWarmup {
  String name;
  int id;
  String category;
  String subCategory;
  String type;
  String description;

  UserWarmup(this.name, this.id, this.category, this.subCategory, this.type,
      this.description);

  Map<String, dynamic> toJson() => {
        'name': name,
        'description': id,
        'level': category,
        'image': subCategory,
        'type': type,
        'position': description,
      };
}
