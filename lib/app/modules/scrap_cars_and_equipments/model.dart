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
    this.clientId,
    this.imageUrl,
    this.clientName,
    this.regionName,
    this.carTypeId,
    this.carTypeName,
    this.carModelId,
    this.carModelName,
    this.carYearId,
    this.carYearName,
    this.partNameEn,
    this.partNameAr,
    this.descriptionEn,
    this.descriptionAr,
    this.description,
    this.unitPrice,
    this.phone,
    this.status,
    this.outsideStatusId,
    this.outsideStatusName,
    this.machineStatusId,
    this.machineStatusName,
    this.gearsStatusId,
    this.gearsStatusName,
    this.tiresStatusId,
    this.tiresStatusName,
    this.carTransferTypeId,
    this.carTransferTypeName,
    this.areaId,
    this.areaName,
    this.whatsApp,
    this.images,
    this.kmCounter,
  });

  var id;
  var regionId;
  var clientId;
  var imageUrl;
  var clientName;
  var regionName;
  var carTypeId;
  var carTypeName;
  var carModelId;
  var carModelName;
  var carYearId;
  var carYearName;
  var partNameEn;
  var partNameAr;
  var descriptionEn;
  var descriptionAr;
  var description;
  var unitPrice;
  var phone;
  var status;
  var outsideStatusId;
  var outsideStatusName;
  var machineStatusId;
  var machineStatusName;
  var gearsStatusId;
  var gearsStatusName;
  var tiresStatusId;
  var tiresStatusName;
  var carTransferTypeId;
  var carTransferTypeName;
  var areaId;
  var areaName;
  var whatsApp;
  var kmCounter;

  List<ImageModel> images;

  factory UsedCar.fromJson(Map<String, dynamic> json) => UsedCar(
        id: json["id"],
        regionId: json["regionId"],
        clientId: json["clientId"],
        imageUrl: json["imageURL"],
        clientName: json["clientName"],
        regionName: json["regionName"],
        carTypeId: json["carTypeId"],
        carTypeName: json["carTypeName"],
        carModelId: json["carModelId"],
        carModelName: json["carModelName"],
        carYearId: json["carYearId"],
        carYearName: json["carYearName"],
        partNameEn: json["partNameEn"],
        partNameAr: json["partNameAr"],
        descriptionEn:
            json["descriptionEn"] == null ? null : json["descriptionEn"],
        descriptionAr:
            json["descriptionAr"] == null ? null : json["descriptionAr"],
        description: json["description"] == null ? null : json["description"],
        unitPrice: json["unitPrice"].toDouble(),
        phone: json["phone"] == null ? null : json["phone"],
        status: json["status"],
        outsideStatusId: json["outsideStatusId"],
        outsideStatusName: json["outsideStatusName"],
        machineStatusId: json["machineStatusId"],
        machineStatusName: json["machineStatusName"],
        gearsStatusId: json["gearsStatusId"],
        gearsStatusName: json["gearsStatusName"],
        tiresStatusId: json["tiresStatusId"],
        tiresStatusName: json["tiresStatusName"],
        carTransferTypeId: json["carTransferTypeId"],
        kmCounter: json["kmCounter"],
        carTransferTypeName: json["carTransferTypeName"],
        areaId: json["areaId"] == null ? null : json["areaId"],
        areaName: json["areaName"] == null ? null : json["areaName"],
        whatsApp: json["whatsApp"] == null ? null : json["whatsApp"],
        images: List<ImageModel>.from(
            json["images"].map((x) => ImageModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "regionId": regionId,
        "clientId": clientId,
        "imageURL": imageUrl,
        "clientName": clientName,
        "regionName": regionName,
        "carTypeId": carTypeId,
        "carTypeName": carTypeName,
        "carModelId": carModelId,
        "carModelName": carModelName,
        "carYearId": carYearId,
        "carYearName": carYearName,
        "partNameEn": partNameEn,
        "partNameAr": partNameAr,
        "descriptionEn": descriptionEn == null ? null : descriptionEn,
        "descriptionAr": descriptionAr == null ? null : descriptionAr,
        "description": description == null ? null : description,
        "unitPrice": unitPrice,
        "phone": phone == null ? null : phone,
        "status": status,
        "outsideStatusId": outsideStatusId,
        "outsideStatusName": outsideStatusName,
        "machineStatusId": machineStatusId,
        "machineStatusName": machineStatusName,
        "gearsStatusId": gearsStatusId,
        "gearsStatusName": gearsStatusName,
        "tiresStatusId": tiresStatusId,
        "tiresStatusName": tiresStatusName,
        "carTransferTypeId": carTransferTypeId,
        "carTransferTypeName": carTransferTypeName,
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
