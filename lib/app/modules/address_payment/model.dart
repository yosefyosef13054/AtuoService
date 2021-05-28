// To parse this JSON data, do
//
//     final addresses = addressesFromJson(jsonString);

import 'dart:convert';

List<Addresses> addressesFromJson(String str) =>
    List<Addresses>.from(json.decode(str).map((x) => Addresses.fromJson(x)));

String addressesToJson(List<Addresses> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Addresses {
  Addresses({
    this.id,
    this.clientId,
    this.clientName,
    this.address,
    this.areaId,
    this.areaName,
    this.section,
    this.subSection,
    this.street,
    this.building,
    this.floor,
    this.apartment,
    this.addressName,
    this.deleted,
    this.deliveryCharge,
  });

  var id;
  var clientId;
  var clientName;
  var address;
  var areaId;
  var areaName;
  var section;
  var subSection;
  var street;
  var building;
  var floor;
  var apartment;
  var addressName;
  var deleted;
  var deliveryCharge;

  factory Addresses.fromJson(Map<String, dynamic> json) => Addresses(
        id: json["id"],
        clientId: json["clientId"],
        clientName: json["clientName"],
        address: json["address"] == null ? null : json["address"],
        areaId: json["areaId"],
        areaName: json["areaName"],
        section: json["section"],
        subSection: json["subSection"],
        street: json["street"],
        building: json["building"],
        floor: json["floor"],
        apartment: json["apartment"],
        addressName: json["addressName"],
        deleted: json["deleted"],
        deliveryCharge: json["deliveryCharge"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "clientId": clientId,
        "clientName": clientName,
        "address": address == null ? null : address,
        "areaId": areaId,
        "areaName": areaName,
        "section": section,
        "subSection": subSection,
        "street": street,
        "building": building,
        "floor": floor,
        "apartment": apartment,
        "addressName": addressName,
        "deleted": deleted,
        "deliveryCharge": deliveryCharge,
      };
}

// To parse this JSON data, do
//
//     final paymentTypes = paymentTypesFromJson(jsonString);

List<PaymentTypes> paymentTypesFromJson(String str) => List<PaymentTypes>.from(
    json.decode(str).map((x) => PaymentTypes.fromJson(x)));

String paymentTypesToJson(List<PaymentTypes> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PaymentTypes {
  PaymentTypes({
    this.id,
    this.title,
    this.titleAr,
    this.titleEn,
    this.type,
    this.action,
  });

  int id;
  String title;
  String titleAr;
  String titleEn;
  String type;
  int action;

  factory PaymentTypes.fromJson(Map<String, dynamic> json) => PaymentTypes(
        id: json["id"],
        title: json["title"],
        titleAr: json["titleAr"],
        titleEn: json["titleEn"],
        type: json["type"],
        action: json["action"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "titleAr": titleAr,
        "titleEn": titleEn,
        "type": type,
        "action": action,
      };
}
