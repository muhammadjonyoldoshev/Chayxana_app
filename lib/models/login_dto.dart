class LoginDto {
  late String phoneNumber;
  late String verificationCode;

  LoginDto({required this.phoneNumber, required this.verificationCode});

  LoginDto.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phoneNumber'];
    verificationCode = json['verificationCode'];
  }

  Map<String, dynamic> toJson () {
    final map = <String, dynamic>{};
    map['phoneNumber'] = phoneNumber;
    map['verificationCode'] = verificationCode;
    return map;
  }
}