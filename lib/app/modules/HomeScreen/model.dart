// To parse this JSON data, do
//
//     final homeScreemModel = homeScreemModelFromJson(jsonString);

import 'dart:convert';

HomeScreemModel homeScreemModelFromJson(String str) =>
    HomeScreemModel.fromJson(json.decode(str));

String homeScreemModelToJson(HomeScreemModel data) =>
    json.encode(data.toJson());

class HomeScreemModel {
  HomeScreemModel({
    this.topSlider,
    this.bottomSlider,
    this.usedCars,
    this.newAccessories,
  });

  List<Slider> topSlider;
  List<Slider> bottomSlider;
  List<UsedCar> usedCars;
  List<NewAccessory> newAccessories;

  factory HomeScreemModel.fromJson(Map<String, dynamic> json) =>
      HomeScreemModel(
        topSlider:
            List<Slider>.from(json["topSlider"].map((x) => Slider.fromJson(x))),
        bottomSlider: List<Slider>.from(
            json["bottomSlider"].map((x) => Slider.fromJson(x))),
        usedCars: List<UsedCar>.from(
            json["usedCars"].map((x) => UsedCar.fromJson(x))),
        newAccessories: List<NewAccessory>.from(
            json["newAccessories"].map((x) => NewAccessory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "topSlider": List<dynamic>.from(topSlider.map((x) => x.toJson())),
        "bottomSlider": List<dynamic>.from(bottomSlider.map((x) => x.toJson())),
        "usedCars": List<dynamic>.from(usedCars.map((x) => x.toJson())),
        "newAccessories":
            List<dynamic>.from(newAccessories.map((x) => x.toJson())),
      };
}

class Slider {
  Slider({
    this.id,
    this.carId,
    this.carName,
    this.lastModifiedDate,
    this.imageUrl,
    this.location,
  });

  int id;
  dynamic carId;
  dynamic carName;
  DateTime lastModifiedDate;
  String imageUrl;
  String location;

  factory Slider.fromJson(Map<String, dynamic> json) => Slider(
        id: json["id"],
        carId: json["carId"],
        carName: json["carName"],
        lastModifiedDate: DateTime.parse(json["lastModifiedDate"]),
        imageUrl: json["imageURL"],
        location: json["location"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "carId": carId,
        "carName": carName,
        "lastModifiedDate": lastModifiedDate.toIso8601String(),
        "imageURL": imageUrl,
        "location": location,
      };
}

class NewAccessory {
  NewAccessory({
    this.id,
    this.categoryId,
    this.categoryName,
    this.productNameEn,
    this.productNameAr,
    this.productName,
    this.descriptionEn,
    this.descriptionAr,
    this.description,
    this.unitPrice,
    this.deleted,
    this.isActive,
    this.isFavorite,
    this.enableDiscount,
    this.unitPriceDiscount,
    this.shopCompanyId,
    this.imageId,
    this.imageUrl,
    this.shopCompanyName,
    this.approvalStatus,
    this.lastModifiedDate,
    this.models,
    this.images,
  });

  int id;
  int categoryId;
  String categoryName;
  String productNameEn;
  String productNameAr;
  String productName;
  String descriptionEn;
  String descriptionAr;
  String description;
  double unitPrice;
  dynamic deleted;
  bool isActive;
  bool isFavorite;
  bool enableDiscount;
  dynamic unitPriceDiscount;
  int shopCompanyId;
  int imageId;
  String imageUrl;
  String shopCompanyName;
  bool approvalStatus;
  DateTime lastModifiedDate;
  dynamic models;
  dynamic images;

  factory NewAccessory.fromJson(Map<String, dynamic> json) => NewAccessory(
        id: json["id"],
        categoryId: json["categoryId"],
        categoryName: json["categoryName"],
        productNameEn: json["productNameEn"],
        productNameAr: json["productNameAr"],
        productName: json["productName"],
        descriptionEn: json["descriptionEn"],
        descriptionAr: json["descriptionAr"],
        description: json["description"],
        unitPrice: json["unitPrice"].toDouble(),
        deleted: json["deleted"],
        isActive: json["isActive"],
        isFavorite: json["isFavorite"],
        enableDiscount: json["enableDiscount"],
        unitPriceDiscount: json["unitPriceDiscount"],
        shopCompanyId: json["shopCompanyId"],
        imageId: json["imageId"],
        imageUrl: json["imageURL"],
        shopCompanyName: json["shopCompanyName"],
        approvalStatus: json["approvalStatus"],
        lastModifiedDate: DateTime.parse(json["lastModifiedDate"]),
        models: json["models"] == null ? [] : json["models"],
        images: json["images"] == null ? [] : json["images"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "categoryId": categoryId,
        "categoryName": categoryName,
        "productNameEn": productNameEn,
        "productNameAr": productNameAr,
        "productName": productName,
        "descriptionEn": descriptionEn,
        "descriptionAr": descriptionAr,
        "description": description,
        "unitPrice": unitPrice,
        "deleted": deleted,
        "isActive": isActive,
        "isFavorite": isFavorite,
        "enableDiscount": enableDiscount,
        "unitPriceDiscount": unitPriceDiscount,
        "shopCompanyId": shopCompanyId,
        "imageId": imageId,
        "imageURL": imageUrl,
        "shopCompanyName": shopCompanyName,
        "approvalStatus": approvalStatus,
        "lastModifiedDate": lastModifiedDate.toIso8601String(),
        "models": models,
        "images": images,
      };
}

class UsedCar {
  UsedCar({
    this.id,
    this.regionId,
    this.regionName,
    this.imageUrl,
    this.clientId,
    this.clientName,
    this.carTypeId,
    this.carTypeName,
    this.carModelId,
    this.carModelName,
    this.carYearId,
    this.carYearName,
    this.partName,
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
    this.kmCounter,
    this.adType,
    this.images,
  });

  int id;
  int regionId;
  String regionName;
  String imageUrl;
  int clientId;
  String clientName;
  int carTypeId;
  String carTypeName;
  int carModelId;
  String carModelName;
  int carYearId;
  String carYearName;
  String partName;
  String partNameEn;
  String partNameAr;
  String description;
  String descriptionEn;
  String descriptionAr;
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
  String kmCounter;
  String adType;
  List<Image> images;

  factory UsedCar.fromJson(Map<String, dynamic> json) => UsedCar(
        id: json["id"],
        regionId: json["regionId"],
        regionName: json["regionName"],
        imageUrl: json["imageURL"],
        clientId: json["clientId"],
        clientName: json["clientName"],
        carTypeId: json["carTypeId"],
        carTypeName: json["carTypeName"],
        carModelId: json["carModelId"],
        carModelName: json["carModelName"],
        carYearId: json["carYearId"],
        carYearName: json["carYearName"],
        partName: json["partName"],
        partNameEn: json["partNameEn"],
        partNameAr: json["partNameAr"],
        description: json["description"],
        descriptionEn: json["descriptionEn"],
        descriptionAr: json["descriptionAr"],
        unitPrice: json["unitPrice"].toDouble(),
        phone: json["phone"],
        status: json["status"],
        outsideStatusId:
            json["outsideStatusId"] == null ? null : json["outsideStatusId"],
        outsideStatusName: json["outsideStatusName"] == null
            ? null
            : json["outsideStatusName"],
        insideStatusId:
            json["insideStatusId"] == null ? null : json["insideStatusId"],
        insideStatusName:
            json["insideStatusName"] == null ? null : json["insideStatusName"],
        electricityStatusId: json["electricityStatusId"] == null
            ? null
            : json["electricityStatusId"],
        electricityStatusName: json["electricityStatusName"] == null
            ? null
            : json["electricityStatusName"],
        tiresStatusId:
            json["tiresStatusId"] == null ? null : json["tiresStatusId"],
        tiresStatusName:
            json["tiresStatusName"] == null ? null : json["tiresStatusName"],
        carCheckId: json["carCheckId"],
        carCheckName: json["carCheckName"],
        carCheckComment: json["carCheckComment"],
        areaId: json["areaId"],
        areaName: json["areaName"],
        whatsApp: json["whatsApp"],
        kmCounter: json["kmCounter"],
        adType: json["adType"],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "regionId": regionId,
        "regionName": regionName,
        "imageURL": imageUrl,
        "clientId": clientId,
        "clientName": clientName,
        "carTypeId": carTypeId,
        "carTypeName": carTypeName,
        "carModelId": carModelId,
        "carModelName": carModelName,
        "carYearId": carYearId,
        "carYearName": carYearName,
        "partName": partName,
        "partNameEn": partNameEn,
        "partNameAr": partNameAr,
        "description": description,
        "descriptionEn": descriptionEn,
        "descriptionAr": descriptionAr,
        "unitPrice": unitPrice,
        "phone": phone,
        "status": status,
        "outsideStatusId": outsideStatusId == null ? null : outsideStatusId,
        "outsideStatusName":
            outsideStatusName == null ? null : outsideStatusName,
        "insideStatusId": insideStatusId == null ? null : insideStatusId,
        "insideStatusName": insideStatusName == null ? null : insideStatusName,
        "electricityStatusId":
            electricityStatusId == null ? null : electricityStatusId,
        "electricityStatusName":
            electricityStatusName == null ? null : electricityStatusName,
        "tiresStatusId": tiresStatusId == null ? null : tiresStatusId,
        "tiresStatusName": tiresStatusName == null ? null : tiresStatusName,
        "carCheckId": carCheckId,
        "carCheckName": carCheckName,
        "carCheckComment": carCheckComment,
        "areaId": areaId,
        "areaName": areaName,
        "whatsApp": whatsApp,
        "kmCounter": kmCounter,
        "adType": adType,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
      };
}

class Image {
  Image({
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

  factory Image.fromJson(Map<String, dynamic> json) => Image(
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
