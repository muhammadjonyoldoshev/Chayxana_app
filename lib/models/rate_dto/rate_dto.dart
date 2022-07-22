class RateDto {
  late String chayxanaId;
  late String comment;
  late int createdAt;
  late int rate;
  late int roomNumber;

  RateDto({required this.chayxanaId, required this.comment, required this.createdAt, required this.rate, required this.roomNumber});

  RateDto.fromJson(Map<String, dynamic> json) {
    chayxanaId = json['chayxanaId'];
    comment = json['comment'];
    createdAt = json['createdAt'];
    rate = json['rate'];
    roomNumber = json['roomNumber'];
  }

  Map<String, dynamic> toJson () {
    final map = <String, dynamic>{};
    map['chayxanaId'] = chayxanaId;
    map['comment'] = comment;
    map['createdAt'] = createdAt;
    map['rate'] = rate;
    map['roomNumber'] = roomNumber;
    return map;
  }
}