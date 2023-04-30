import 'dart:convert';

Order orderFromJson(String str) => Order.fromJson(json.decode(str));

String orderToJson(Order data) => json.encode(data.toJson());

class Order {
  String? userId;
  String? orderId;
  String? gasStationId;
  String? gasStation;
  String? fuelType;
  int? quantity;
  String? deliveryAddress;
  String? orderStatus;
  DateTime? orderDate;
  DateTime? deliveryDate;

  Order({
    this.userId,
    this.orderId,
    this.gasStationId,
    this.gasStation,
    this.fuelType,
    this.quantity,
    this.deliveryAddress,
    this.orderStatus,
    this.orderDate,
    this.deliveryDate,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        userId: json["userId"],
        orderId: json["orderId"],
        gasStationId: json["gasStationId"],
        gasStation: json["gasStation"],
        fuelType: json["fuelType"],
        quantity: json["quantity"],
        deliveryAddress: json["deliveryAddress"],
        orderStatus: json["orderStatus"],
        orderDate: json["orderDate"] == null
            ? null
            : DateTime.parse(json["orderDate"]),
        deliveryDate: json["deliveryDate"] == null
            ? null
            : DateTime.parse(json["deliveryDate"]),
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "orderId": orderId,
        "gasStationId": gasStationId,
        "gasStation": gasStation,
        "fuelType": fuelType,
        "quantity": quantity,
        "deliveryAddress": deliveryAddress,
        "orderStatus": orderStatus,
        "orderDate": orderDate?.toIso8601String(),
        "deliveryDate": deliveryDate?.toIso8601String(),
      };
}
