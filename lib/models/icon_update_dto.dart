class IconUpdateDto {
  late String id;
  late String name;

  IconUpdateDto({required this.id, required this.name});

  IconUpdateDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson () {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }
}