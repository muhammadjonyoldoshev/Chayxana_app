import 'dart:convert';
ApiResponse apiResponseFromJson(String str) => ApiResponse.fromJson(json.decode(str));
String apiResponseToJson(ApiResponse data) => json.encode(data.toJson());
class ApiResponse {
  ApiResponse({
      this.success, 
      this.message, 
      this.object, 
      this.totalElements,});

  ApiResponse.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    if (json['object'] != null) {
      object = [];
      json['object'].forEach((v) {
        object?.add(Order.fromJson(v));
      });
    }
    totalElements = json['totalElements'];
  }
  bool? success;
  String? message;
  List<Order>? object;
  int? totalElements;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    if (object != null) {
      map['object'] = object?.map((v) => v.toJson()).toList();
    }
    map['totalElements'] = totalElements;
    return map;
  }

}

Order objectFromJson(String str) => Order.fromJson(json.decode(str));
String objectToJson(Order data) => json.encode(data.toJson());
class Order {
  Order({
      this.orderId,
      this.userDto, 
      this.roomDto, 
      this.orderTime, 
      this.personAmount, 
      this.price, 
      this.status, 
      this.message,});

  Order.fromJson(dynamic json) {
    orderId = json['orderId'];
    userDto = json['userDto'];
    roomDto = json['roomDto'] != null ? RoomDto.fromJson(json['roomDto']) : null;
    orderTime = json['orderTime'];
    personAmount = json['personAmount'];
    price = json['price'];
    status = json['status'];
    message = json['message'];
  }
  dynamic userDto;
  String? orderId;
  RoomDto? roomDto;
  int? orderTime;
  int? personAmount;
  double? price;
  String? status;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userDto'] = userDto;
    if (roomDto != null) {
      map['roomDto'] = roomDto?.toJson();
    }
    map['orderTime'] = orderTime;
    map['personAmount'] = personAmount;
    map['price'] = price;
    map['status'] = status;
    map['message'] = message;
    return map;
  }

}

RoomDto roomDtoFromJson(String str) => RoomDto.fromJson(json.decode(str));
String roomDtoToJson(RoomDto data) => json.encode(data.toJson());
class RoomDto {
  RoomDto({
      this.id, 
      this.roomNumber, 
      this.bron, 
      this.maxPerson, 
      this.minPerson, 
      this.chayxanaId, 
      this.chayxanaDto, 
      this.price, 
      this.roomDetailDTOS,});

  RoomDto.fromJson(dynamic json) {
    id = json['id'];
    roomNumber = json['roomNumber'];
    bron = json['bron'];
    maxPerson = json['maxPerson'];
    minPerson = json['minPerson'];
    chayxanaId = json['chayxana_id'];
    chayxanaDto = json['chayxanaDto'] != null ? ChayxanaDto.fromJson(json['chayxanaDto']) : null;
    price = json['price'];
    roomDetailDTOS = json['roomDetailDTOS'];
  }
  String? id;
  int? roomNumber;
  bool? bron;
  int? maxPerson;
  int? minPerson;
  dynamic chayxanaId;
  ChayxanaDto? chayxanaDto;
  dynamic price;
  dynamic roomDetailDTOS;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['roomNumber'] = roomNumber;
    map['bron'] = bron;
    map['maxPerson'] = maxPerson;
    map['minPerson'] = minPerson;
    map['chayxana_id'] = chayxanaId;
    if (chayxanaDto != null) {
      map['chayxanaDto'] = chayxanaDto?.toJson();
    }
    map['price'] = price;
    map['roomDetailDTOS'] = roomDetailDTOS;
    return map;
  }

}

ChayxanaDto chayxanaDtoFromJson(String str) => ChayxanaDto.fromJson(json.decode(str));
String chayxanaDtoToJson(ChayxanaDto data) => json.encode(data.toJson());
class ChayxanaDto {
  ChayxanaDto({
      this.chayxanaId, 
      this.addressDto, 
      this.userId, 
      this.chayxanaName, 
      this.descriptionUz, 
      this.descriptionRu, 
      this.descriptionEn, 
      this.startTime, 
      this.endTime, 
      this.phoneNumber, 
      this.roomNumber, 
      this.price, 
      this.chayxanaDetailDtos, 
      this.active,});

  ChayxanaDto.fromJson(dynamic json) {
    chayxanaId = json['chayxanaId'];
    addressDto = json['addressDto'] != null ? AddressDto.fromJson(json['addressDto']) : null;
    userId = json['userId'];
    chayxanaName = json['chayxanaName'];
    descriptionUz = json['descriptionUz'];
    descriptionRu = json['descriptionRu'];
    descriptionEn = json['descriptionEn'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    phoneNumber = json['phoneNumber'];
    roomNumber = json['roomNumber'];
    price = json['price'];
    chayxanaDetailDtos = json['chayxanaDetailDtos'];
    active = json['active'];
  }
  String? chayxanaId;
  AddressDto? addressDto;
  dynamic userId;
  String? chayxanaName;
  dynamic descriptionUz;
  dynamic descriptionRu;
  dynamic descriptionEn;
  dynamic startTime;
  dynamic endTime;
  String? phoneNumber;
  int? roomNumber;
  double? price;
  dynamic chayxanaDetailDtos;
  bool? active;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['chayxanaId'] = chayxanaId;
    if (addressDto != null) {
      map['addressDto'] = addressDto?.toJson();
    }
    map['userId'] = userId;
    map['chayxanaName'] = chayxanaName;
    map['descriptionUz'] = descriptionUz;
    map['descriptionRu'] = descriptionRu;
    map['descriptionEn'] = descriptionEn;
    map['startTime'] = startTime;
    map['endTime'] = endTime;
    map['phoneNumber'] = phoneNumber;
    map['roomNumber'] = roomNumber;
    map['price'] = price;
    map['chayxanaDetailDtos'] = chayxanaDetailDtos;
    map['active'] = active;
    return map;
  }

}

AddressDto addressDtoFromJson(String str) => AddressDto.fromJson(json.decode(str));
String addressDtoToJson(AddressDto data) => json.encode(data.toJson());
class AddressDto {
  AddressDto({
      this.id, 
      this.districtDto, 
      this.streetName, 
      this.lan, 
      this.lat,});

  AddressDto.fromJson(dynamic json) {
    id = json['id'];
    districtDto = json['districtDto'] != null ? DistrictDto.fromJson(json['districtDto']) : null;
    streetName = json['streetName'];
    lan = json['lan'];
    lat = json['lat'];
  }
  dynamic id;
  DistrictDto? districtDto;
  String? streetName;
  double? lan;
  double? lat;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (districtDto != null) {
      map['districtDto'] = districtDto?.toJson();
    }
    map['streetName'] = streetName;
    map['lan'] = lan;
    map['lat'] = lat;
    return map;
  }

}

DistrictDto districtDtoFromJson(String str) => DistrictDto.fromJson(json.decode(str));
String districtDtoToJson(DistrictDto data) => json.encode(data.toJson());
class DistrictDto {
  DistrictDto({
      this.id, 
      this.name, 
      this.regionDto,});

  DistrictDto.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    regionDto = json['regionDto'] != null ? RegionDto.fromJson(json['regionDto']) : null;
  }
  int? id;
  String? name;
  RegionDto? regionDto;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    if (regionDto != null) {
      map['regionDto'] = regionDto?.toJson();
    }
    return map;
  }

}

RegionDto regionDtoFromJson(String str) => RegionDto.fromJson(json.decode(str));
String regionDtoToJson(RegionDto data) => json.encode(data.toJson());
class RegionDto {
  RegionDto({
      this.id, 
      this.name,});

  RegionDto.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
  int? id;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

}