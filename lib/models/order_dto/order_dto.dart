class OrderDto {
  late String orderId;
  late String message;
  late int orderTime;
  late int personAmount;
  late num price;
  late String status;

  OrderDto({required this.message, required this.orderTime, required this.personAmount, required this.price, required this.status});

  OrderDto.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    orderTime = json['orderTime'];
    personAmount = json['personAmount'];
    price = json['price'];
    status = json['status'];
  }

  Map<String, dynamic> toJson () {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['orderTime'] = orderTime;
    map['personAmount'] = personAmount;
    map['price'] = price;
    map['status'] = status;
    return map;
  }
}