// To parse this JSON data, do
//
//     final usedCar = usedCarFromJson(jsonString);

import 'dart:convert';

List<UsedCar> usedCarFromJson(String str) =>
    List<UsedCar>.from(json.decode(str).map((x) => UsedCar.fromJson(x)));

String usedCarToJson(List<UsedCar> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UsedCar {
  UsedCar({
    this.id,
    this.regionId,
    this.regionName,
    this.imageURL,
    this.clientId,
    this.clientName,
    this.carTypeId,
    this.carTypeName,
    this.carModelId,
    this.carModelName,
    this.carYearId,
    this.carYearName,
    this.partNameEn,
    this.partNameAr,
    this.description,
    this.descriptionEn,
    this.descriptionAr,
    this.unitPrice,
    this.phone,
    this.status,
    this.outsideStatusId,
    this.outsideStatusName,
    this.insideStatusId,
    this.insideStatusName,
    this.electricityStatusId,
    this.electricityStatusName,
    this.tiresStatusId,
    this.tiresStatusName,
    this.carCheckId,
    this.carCheckName,
    this.carCheckComment,
    this.areaId,
    this.areaName,
    this.whatsApp,
    this.images,
    this.kmCounter,
  });

  int id;
  int regionId;
  String regionName;
  String imageURL;
  int clientId;
  String clientName;
  int carTypeId;
  String carTypeName;
  int carModelId;
  String carModelName;
  int carYearId;
  String carYearName;
  dynamic partNameEn;
  dynamic partNameAr;
  dynamic description;
  dynamic descriptionEn;
  dynamic descriptionAr;
  double unitPrice;
  String phone;
  bool status;
  int outsideStatusId;
  String outsideStatusName;
  int insideStatusId;
  String insideStatusName;
  int electricityStatusId;
  String electricityStatusName;
  int tiresStatusId;
  String tiresStatusName;
  int carCheckId;
  String carCheckName;
  dynamic carCheckComment;
  int areaId;
  String areaName;
  String whatsApp;
  var kmCounter;
  List<ImageModel> images;

  factory UsedCar.fromJson(Map<String, dynamic> json) => UsedCar(
        id: json["id"],
        regionId: json["regionId"],
        regionName: json["regionName"],
        imageURL: json["imageURL"],
        clientId: json["clientId"],
        clientName: json["clientName"],
        carTypeId: json["carTypeId"],
        carTypeName: json["carTypeName"],
        carModelId: json["carModelId"],
        carModelName: json["carModelName"],
        carYearId: json["carYearId"],
        carYearName: json["carYearName"],
        partNameEn: json["partNameEn"],
        partNameAr: json["partNameAr"],
        description: json["description"],
        descriptionEn: json["descriptionEn"],
        descriptionAr: json["descriptionAr"],
        unitPrice: json["unitPrice"].toDouble(),
        phone: json["phone"],
        status: json["status"],
        outsideStatusId: json["outsideStatusId"],
        outsideStatusName: json["outsideStatusName"],
        insideStatusId: json["insideStatusId"],
        insideStatusName: json["insideStatusName"],
        electricityStatusId: json["electricityStatusId"],
        electricityStatusName: json["electricityStatusName"],
        tiresStatusId: json["tiresStatusId"],
        tiresStatusName: json["tiresStatusName"],
        carCheckId: json["carCheckId"],
        carCheckName: json["carCheckName"],
        carCheckComment: json["carCheckComment"],
        kmCounter: json["kmCounter"],
        areaId: json["areaId"] == null ? null : json["areaId"],
        areaName: json["areaName"] == null ? null : json["areaName"],
        whatsApp: json["whatsApp"] == null ? null : json["whatsApp"],
        images: List<ImageModel>.from(
            json["images"].map((x) => ImageModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "regionId": regionId,
        "regionName": regionName,
        "imageURL": imageURL,
        "clientId": clientId,
        "clientName": clientName,
        "carTypeId": carTypeId,
        "carTypeName": carTypeName,
        "carModelId": carModelId,
        "carModelName": carModelName,
        "carYearId": carYearId,
        "carYearName": carYearName,
        "partNameEn": partNameEn,
        "partNameAr": partNameAr,
        "description": description,
        "descriptionEn": descriptionEn,
        "descriptionAr": descriptionAr,
        "unitPrice": unitPrice,
        "phone": phone,
        "status": status,
        "outsideStatusId": outsideStatusId,
        "outsideStatusName": outsideStatusName,
        "insideStatusId": insideStatusId,
        "insideStatusName": insideStatusName,
        "electricityStatusId": electricityStatusId,
        "electricityStatusName": electricityStatusName,
        "tiresStatusId": tiresStatusId,
        "tiresStatusName": tiresStatusName,
        "carCheckId": carCheckId,
        "carCheckName": carCheckName,
        "carCheckComment": carCheckComment,
        "kmCounter": kmCounter,
        "areaId": areaId == null ? null : areaId,
        "areaName": areaName == null ? null : areaName,
        "whatsApp": whatsApp == null ? null : whatsApp,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
      };
}

class ImageModel {
  ImageModel({
    this.id,
    this.carId,
    this.carName,
    this.imageUrl,
    this.fileName,
    this.isCover,
  });

  int id;
  int carId;
  dynamic carName;
  String imageUrl;
  dynamic fileName;
  bool isCover;

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        id: json["id"],
        carId: json["carId"],
        carName: json["carName"],
        imageUrl: json["imageURL"],
        fileName: json["fileName"],
        isCover: json["isCover"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "carId": carId,
        "carName": carName,
        "imageURL": imageUrl,
        "fileName": fileName,
        "isCover": isCover,
      };
}
