// To parse this JSON data, do
//
//     final compeny = compenyFromJson(jsonString);

import 'dart:convert';

List<Compeny> compenyFromJson(String str) =>
    List<Compeny>.from(json.decode(str).map((x) => Compeny.fromJson(x)));

String compenyToJson(List<Compeny> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Compeny {
  Compeny({
    this.id,
    this.areaId,
    this.areaName,
    this.userId,
    this.lastModifiedDate,
    this.userName,
    this.companyNameEn,
    this.companyNameAr,
    this.companyName,
    this.arrange,
    this.commotionPercent,
    this.smsPhone,
    this.phone,
    this.status,
    this.imageUrl,
    this.createdDate,
    this.userAccount,
    this.models,
  });

  int id;
  int areaId;
  String areaName;
  dynamic userId;
  DateTime lastModifiedDate;
  dynamic userName;
  String companyNameEn;
  String companyNameAr;
  String companyName;
  int arrange;
  dynamic commotionPercent;
  dynamic smsPhone;
  String phone;
  bool status;
  String imageUrl;
  DateTime createdDate;
  dynamic userAccount;
  dynamic models;

  factory Compeny.fromJson(Map<String, dynamic> json) => Compeny(
        id: json["id"],
        areaId: json["areaId"],
        areaName: json["areaName"],
        userId: json["userId"],
        lastModifiedDate: DateTime.parse(json["lastModifiedDate"]),
        userName: json["userName"],
        companyNameEn: json["companyNameEn"],
        companyNameAr: json["companyNameAr"],
        companyName: json["companyName"],
        arrange: json["arrange"],
        commotionPercent: json["commotionPercent"],
        smsPhone: json["smsPhone"],
        phone: json["phone"],
        status: json["status"],
        imageUrl: json["imageURL"],
        createdDate: DateTime.parse(json["createdDate"]),
        userAccount: json["userAccount"],
        models: json["models"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "areaId": areaId,
        "areaName": areaName,
        "userId": userId,
        "lastModifiedDate": lastModifiedDate.toIso8601String(),
        "userName": userName,
        "companyNameEn": companyNameEn,
        "companyNameAr": companyNameAr,
        "companyName": companyName,
        "arrange": arrange,
        "commotionPercent": commotionPercent,
        "smsPhone": smsPhone,
        "phone": phone,
        "status": status,
        "imageURL": imageUrl,
        "createdDate": createdDate.toIso8601String(),
        "userAccount": userAccount,
        "models": models,
      };
}
