// To parse this JSON data, do
//
//     final accessoriesHomeModel = accessoriesHomeModelFromJson(jsonString);

import 'dart:convert';

AccessoriesHomeModel accessoriesHomeModelFromJson(String str) =>
    AccessoriesHomeModel.fromJson(json.decode(str));

String accessoriesHomeModelToJson(AccessoriesHomeModel data) =>
    json.encode(data.toJson());

class AccessoriesHomeModel {
  AccessoriesHomeModel({
    this.topSlider,
    this.newAccessories,
    this.usedAccessories,
  });

  List<TopSlider> topSlider;
  List<NewAccessory> newAccessories;
  List<UsedAccessory> usedAccessories;

  factory AccessoriesHomeModel.fromJson(Map<String, dynamic> json) =>
      AccessoriesHomeModel(
        topSlider: List<TopSlider>.from(
            json["topSlider"].map((x) => TopSlider.fromJson(x))),
        newAccessories: List<NewAccessory>.from(
            json["newAccessories"].map((x) => NewAccessory.fromJson(x))),
        usedAccessories: List<UsedAccessory>.from(
            json["usedAccessories"].map((x) => UsedAccessory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "topSlider": List<dynamic>.from(topSlider.map((x) => x.toJson())),
        "newAccessories":
            List<dynamic>.from(newAccessories.map((x) => x.toJson())),
        "usedAccessories":
            List<dynamic>.from(usedAccessories.map((x) => x.toJson())),
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
        enableDiscount: json["enableDiscount"],
        unitPriceDiscount: json["unitPriceDiscount"],
        shopCompanyId: json["shopCompanyId"],
        imageId: json["imageId"],
        imageUrl: json["imageURL"],
        shopCompanyName: json["shopCompanyName"],
        approvalStatus: json["approvalStatus"],
        lastModifiedDate: DateTime.parse(json["lastModifiedDate"]),
        models: json["models"],
        images: json["images"],
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

class TopSlider {
  TopSlider({
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

  factory TopSlider.fromJson(Map<String, dynamic> json) => TopSlider(
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

class UsedAccessory {
  UsedAccessory({
    this.id,
    this.regionId,
    this.imageUrl,
    this.regionName,
    this.startYear,
    this.endYear,
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
    this.partName,
    this.descriptionEn,
    this.descriptionAr,
    this.description,
    this.unitPrice,
    this.phone,
    this.status,
    this.areaId,
    this.areaName,
    this.whatsApp,
    this.adType,
    this.images,
  });

  int id;
  int regionId;
  String imageUrl;
  String regionName;
  dynamic startYear;
  dynamic endYear;
  int clientId;
  String clientName;
  int carTypeId;
  String carTypeName;
  int carModelId;
  String carModelName;
  int carYearId;
  String carYearName;
  String partNameEn;
  String partNameAr;
  String partName;
  String descriptionEn;
  String descriptionAr;
  String description;
  double unitPrice;
  String phone;
  bool status;
  dynamic areaId;
  dynamic areaName;
  dynamic whatsApp;
  String adType;
  List images;

  factory UsedAccessory.fromJson(Map<String, dynamic> json) => UsedAccessory(
        id: json["id"],
        regionId: json["regionId"],
        imageUrl: json["imageURL"] == null ? null : json["imageURL"],
        regionName: json["regionName"],
        startYear: json["startYear"],
        endYear: json["endYear"],
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
        partName: json["partName"],
        descriptionEn: json["descriptionEn"],
        descriptionAr: json["descriptionAr"],
        description: json["description"],
        unitPrice: json["unitPrice"].toDouble(),
        phone: json["phone"],
        status: json["status"],
        areaId: json["areaId"],
        areaName: json["areaName"],
        whatsApp: json["whatsApp"],
        adType: json["adType"],
        images: json["images"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "regionId": regionId,
        "imageURL": imageUrl == null ? null : imageUrl,
        "regionName": regionName,
        "startYear": startYear,
        "endYear": endYear,
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
        "partName": partName,
        "descriptionEn": descriptionEn,
        "descriptionAr": descriptionAr,
        "description": description,
        "unitPrice": unitPrice,
        "phone": phone,
        "status": status,
        "areaId": areaId,
        "areaName": areaName,
        "whatsApp": whatsApp,
        "adType": adType,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
      };
}

class ImageModel {
  ImageModel({
    this.id,
    this.sparePartId,
    this.sparePartName,
    this.imageUrl,
    this.fileName,
    this.isCover,
  });

  int id;
  int sparePartId;
  dynamic sparePartName;
  String imageUrl;
  dynamic fileName;
  bool isCover;

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        id: json["id"],
        sparePartId: json["sparePartId"],
        sparePartName: json["sparePartName"],
        imageUrl: json["imageURL"],
        fileName: json["fileName"],
        isCover: json["isCover"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sparePartId": sparePartId,
        "sparePartName": sparePartName,
        "imageURL": imageUrl,
        "fileName": fileName,
        "isCover": isCover,
      };
}
