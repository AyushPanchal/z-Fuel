import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zfuel/export_all.dart';

UserModel userFromJson(String str) => UserModel.fromJson(json.decode(str));

String userToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  final AuthController _authController = Get.find();
  UserModel({
    this.id, //firebase auth
    this.fullName, //signup page
    this.email, //signup page or null is phone number
    this.phoneNumber, //signup page or null if email
    this.city, //if grants location permission
    this.state, //if grants location permission
    this.country, //if grants location permission
    this.zipCode, //if grants location permission
    this.profilePictureURL, //Other page
    this.createdAt, //while registering
    this.updatedAt, //if profile is updated
  });

  String? id;
  String? fullName;
  String? email;
  String? phoneNumber;
  String? city;
  String? state;
  String? country;
  String? zipCode;
  String? profilePictureURL;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        fullName: json["fullName"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        city: json["city"],
        state: json["state"],
        country: json["country"],
        zipCode: json["zipCode"],
        profilePictureURL: json["profilePictureURL"],
        createdAt: json["createdAt"] == null
            ? null
            : (json["createdAt"] as Timestamp).toDate(),
        updatedAt: json["updatedAt"] == null
            ? null
            : (json["updatedAt"] as Timestamp).toDate(),
      );

  Map<String, dynamic> toJson() => {
        "id": _authController.currentUser.value!.uid,
        "fullName": fullName,
        "email": email,
        "phoneNumber": phoneNumber,
        "city": city,
        "state": state,
        "country": country,
        "zipCode": zipCode,
        "profilePictureURL": profilePictureURL,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
      };
}
