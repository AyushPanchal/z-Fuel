// To parse this JSON data, do
//
//final fleetDriverModel = fleetDriverModelFromJson(jsonString);

import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

FleetDriverModel fleetDriverModelFromJson(String str) =>
    FleetDriverModel.fromJson(json.decode(str));
String fleetDriverModelToJson(FleetDriverModel data) =>
    json.encode(data.toJson());

class FleetDriverModel {
  String? vehicleId;
  String? driverId;
  int? fuelPumpId;
  String? fuelPumpName;
  String? driverName;
  String? driverPhoneNumber;
  String? vehicleType;
  int? fuelCapacity;
  GeoPoint? location;
  bool? availabilityStatus;

  FleetDriverModel({
    this.vehicleId,
    this.driverId,
    this.fuelPumpId,
    this.fuelPumpName,
    this.driverName,
    this.driverPhoneNumber,
    this.vehicleType,
    this.fuelCapacity,
    this.location,
    this.availabilityStatus,
  });

  factory FleetDriverModel.fromJson(Map<String, dynamic> json) =>
      FleetDriverModel(
        vehicleId: json["vehicleId"],
        fuelPumpId: json["fuelPumpId"],
        fuelPumpName: json["fuelPumpName"],
        driverName: json["driverName"],
        driverPhoneNumber: json["driverPhoneNumber"],
        vehicleType: json["vehicleType"],
        fuelCapacity: json["fuelCapacity"],
        location: json["location"],
        availabilityStatus: json["availabilityStatus"],
      );

  Map<String, dynamic> toJson() => {
        "vehicleId": vehicleId,
        "fuelPumpId": fuelPumpId,
        "fuelPumpName": fuelPumpName,
        "driverName": driverName,
        "driverPhoneNumber": driverPhoneNumber,
        "vehicleType": vehicleType,
        "fuelCapacity": fuelCapacity,
        "location": location,
        "availabilityStatus": availabilityStatus,
      };
}
