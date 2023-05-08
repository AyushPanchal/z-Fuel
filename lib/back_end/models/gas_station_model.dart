// To parse this JSON data, do
//
//     final gasStationModel = gasStationModelFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

GasStationModel gasStationModelFromJson(String str) =>
    GasStationModel.fromJson(json.decode(str));

String gasStationModelToJson(GasStationModel data) =>
    json.encode(data.toJson());

class GasStationModel {
  GasStationModel({
    this.gasStationId,
    this.name,
    this.area,
    this.city,
    this.zipCode,
    this.email,
    this.location,
    this.phoneNumber,
    this.fleetCapacity,
    this.fleetAvailability,
    this.orderHistory,
    this.gasStationImageURL,
  });

  String? gasStationId;
  String? gasStationImageURL;
  String? name;
  String? area;
  GeoPoint? location;
  String? city;
  String? zipCode;
  String? email;
  String? phoneNumber;
  int? fleetCapacity;
  int? fleetAvailability;
  List<OrderHistory>? orderHistory;

  factory GasStationModel.fromJson(Map<String, dynamic> json) =>
      GasStationModel(
        gasStationId: json["gasStationID"],
        gasStationImageURL: json["gasStationImageURL"],
        name: json["name"],
        location: json['location'],
        area: json["area"],
        city: json["city"],
        zipCode: json["zipCode"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        fleetCapacity: json["fleetCapacity"],
        fleetAvailability: json["fleetAvailability"],
        orderHistory: json["orderHistory"] == null
            ? []
            : List<OrderHistory>.from(
                json["orderHistory"]!.map((x) => OrderHistory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "gasStationID": gasStationId,
        "name": name,
        "area": area,
        "location": location,
        "gasStationImageURL": gasStationImageURL,
        "city": city,
        "zipCode": zipCode,
        "email": email,
        "phoneNumber": phoneNumber,
        "fleetCapacity": fleetCapacity,
        "fleetAvailability": fleetAvailability,
        "orderHistory": orderHistory == null
            ? []
            : List<dynamic>.from(orderHistory!.map((x) => x.toJson())),
      };
}

class OrderHistory {
  OrderHistory({
    this.orderId,
    this.date,
    this.amount,
    this.fuelType,
  });

  String? orderId;
  DateTime? date;
  int? amount;
  String? fuelType;

  factory OrderHistory.fromJson(Map<String, dynamic> json) => OrderHistory(
        orderId: json["orderID"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        amount: json["amount"],
        fuelType: json["fuelType"],
      );

  Map<String, dynamic> toJson() => {
        "orderID": orderId,
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "amount": amount,
        "fuelType": fuelType,
      };
}
