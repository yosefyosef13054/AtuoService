// To parse this JSON data, do
//
//     final profile = profileFromJson(jsonString);

import 'dart:convert';

Profile profileFromJson(String str) => Profile.fromJson(json.decode(str));

String profileToJson(Profile data) => json.encode(data.toJson());

class Profile {
  Profile({
    this.id,
    this.clientName,
    this.fmcToken,
    this.notificationType,
    this.phone,
    this.countryCode,
    this.deviceType,
    this.address,
    this.notes,
    this.deleted,
    this.email,
    this.userPassword,
    this.status,
    this.userName,
    this.creationDate,
    this.primaryAddress,
  });

  int id;
  String clientName;
  dynamic fmcToken;
  dynamic notificationType;
  String phone;
  dynamic countryCode;
  dynamic deviceType;
  dynamic address;
  dynamic notes;
  dynamic deleted;
  dynamic email;
  String userPassword;
  dynamic status;
  String userName;
  DateTime creationDate;
  dynamic primaryAddress;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["id"],
        clientName: json["clientName"],
        fmcToken: json["fmcToken"],
        notificationType: json["notificationType"],
        phone: json["phone"],
        countryCode: json["countryCode"],
        deviceType: json["deviceType"],
        address: json["address"],
        notes: json["notes"],
        deleted: json["deleted"],
        email: json["email"],
        userPassword: json["userPassword"],
        status: json["status"],
        userName: json["userName"],
        creationDate: DateTime.parse(json["creationDate"]),
        primaryAddress: json["primaryAddress"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "clientName": clientName,
        "fmcToken": fmcToken,
        "notificationType": notificationType,
        "phone": phone,
        "countryCode": countryCode,
        "deviceType": deviceType,
        "address": address,
        "notes": notes,
        "deleted": deleted,
        "email": email,
        "userPassword": userPassword,
        "status": status,
        "userName": userName,
        "creationDate": creationDate.toIso8601String(),
        "primaryAddress": primaryAddress,
      };
}
