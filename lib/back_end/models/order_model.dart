import 'dart:convert';

OrderModel orderFromJson(String str) => OrderModel.fromJson(json.decode(str));

String orderToJson(OrderModel data) => json.encode(data.toJson());

class OrderModel {
  String? userId;
  String? orderId;
  String? gasStationId;
  String? gasStation;
  String? fuelType;
  String? fuelName;
  double? totalAmount;
  double? quantity;
  String? deliveryAddress;
  String? orderStatus;
  DateTime? orderDate;
  DateTime? deliveryDate;

  OrderModel({
    this.userId,
    this.orderId,
    this.gasStationId,
    this.fuelName,
    this.gasStation,
    this.fuelType,
    this.totalAmount,
    this.quantity,
    this.deliveryAddress,
    this.orderStatus,
    this.orderDate,
    this.deliveryDate,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        userId: json["userId"],
        orderId: json["orderId"],
        gasStationId: json["gasStationId"],
        fuelName: json["fuelName"],
        gasStation: json["gasStation"],
        fuelType: json["fuelType"],
        quantity: json["quantity"].toDouble(),
        totalAmount: json["totalAmount"].toDouble(),
        deliveryAddress: json["deliveryAddress"],
        orderStatus: json["orderStatus"],
        orderDate: json["orderDate"].toDate(),
        deliveryDate: json["deliveryDate"].toDate(),
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "orderId": orderId,
        "gasStationId": gasStationId,
        "gasStation": gasStation,
        "fuelType": fuelType,
        "quantity": quantity,
        "fuelName": fuelName,
        "totalAmount": totalAmount,
        "deliveryAddress": deliveryAddress,
        "orderStatus": orderStatus,
        "orderDate": orderDate,
        "deliveryDate": deliveryDate,
      };
}
