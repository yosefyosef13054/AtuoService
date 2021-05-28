// To parse this JSON data, do
//
//     final accessories = accessoriesFromJson(jsonString);

import 'dart:convert';

List<Accessories> accessoriesFromJson(String str) => List<Accessories>.from(
    json.decode(str).map((x) => Accessories.fromJson(x)));

String accessoriesToJson(List<Accessories> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Accessories {
  Accessories({
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
    this.images,
  });

  var id;
  var regionId;
  var imageUrl;
  var regionName;
  var startYear;
  var endYear;
  var clientId;
  var clientName;
  var carTypeId;
  var carTypeName;
  var carModelId;
  var carModelName;
  var carYearId;
  var carYearName;
  var partNameEn;
  var partNameAr;
  var partName;
  var descriptionEn;
  var descriptionAr;
  var description;
  double unitPrice;
  var phone;
  bool status;
  var areaId;
  var areaName;
  var whatsApp;
  List images;

  factory Accessories.fromJson(Map<String, dynamic> json) => Accessories(
        id: json["id"],
        regionId: json["regionId"],
        imageUrl: json["imageURL"],
        regionName: json["regionName"],
        startYear: json["startYear"] == null ? null : json["startYear"],
        endYear: json["endYear"] == null ? null : json["endYear"],
        clientId: json["clientId"],
        clientName: json["clientName"],
        carTypeId: json["carTypeId"],
        carTypeName: json["carTypeName"],
        carModelId: json["carModelId"],
        carModelName: json["carModelName"],
        carYearId: json["carYearId"] == null ? null : json["carYearId"],
        carYearName: json["carYearName"] == null ? null : json["carYearName"],
        partNameEn: json["partNameEn"] == null ? null : json["partNameEn"],
        partNameAr: json["partNameAr"] == null ? null : json["partNameAr"],
        partName: json["partName"] == null ? null : json["partName"],
        descriptionEn: json["descriptionEn"],
        descriptionAr: json["descriptionAr"],
        description: json["description"],
        unitPrice: json["unitPrice"].toDouble(),
        phone: json["phone"] == null ? null : json["phone"],
        status: json["status"],
        areaId: json["areaId"] == null ? null : json["areaId"],
        areaName: json["areaName"] == null ? null : json["areaName"],
        whatsApp: json["whatsApp"] == null ? null : json["whatsApp"],
        images: List<Imagemodel>.from(
            json["images"].map((x) => Imagemodel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "regionId": regionId,
        "imageURL": imageUrl,
        "regionName": regionName,
        "startYear": startYear == null ? null : startYear,
        "endYear": endYear == null ? null : endYear,
        "clientId": clientId,
        "clientName": clientName,
        "carTypeId": carTypeId,
        "carTypeName": carTypeName,
        "carModelId": carModelId,
        "carModelName": carModelName,
        "carYearId": carYearId == null ? null : carYearId,
        "carYearName": carYearName == null ? null : carYearName,
        "partNameEn": partNameEn == null ? null : partNameEn,
        "partNameAr": partNameAr == null ? null : partNameAr,
        "partName": partName == null ? null : partName,
        "descriptionEn": descriptionEn,
        "descriptionAr": descriptionAr,
        "description": description,
        "unitPrice": unitPrice,
        "phone": phone == null ? null : phone,
        "status": status,
        "areaId": areaId == null ? null : areaId,
        "areaName": areaName == null ? null : areaName,
        "whatsApp": whatsApp == null ? null : whatsApp,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
      };
}

class Imagemodel {
  Imagemodel({
    this.id,
    this.sparePartId,
    this.sparePartName,
    this.imageUrl,
    this.fileName,
    this.isCover,
  });

  var id;
  var sparePartId;
  dynamic sparePartName;
  String imageUrl;
  dynamic fileName;
  bool isCover;

  factory Imagemodel.fromJson(Map<String, dynamic> json) => Imagemodel(
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

// To parse this JSON data, do
//
//     final mainCategory = mainCategoryFromJson(jsonString);

List<MainCategory> mainCategoryFromJson(String str) => List<MainCategory>.from(
    json.decode(str).map((x) => MainCategory.fromJson(x)));

String mainCategoryToJson(List<MainCategory> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MainCategory {
  MainCategory({
    this.id,
    this.titleEn,
    this.titleAr,
    this.title,
    this.parentId,
    this.parentName,
    this.deleted,
  });

  int id;
  String titleEn;
  String titleAr;
  String title;
  dynamic parentId;
  dynamic parentName;
  dynamic deleted;

  factory MainCategory.fromJson(Map<String, dynamic> json) => MainCategory(
        id: json["id"],
        titleEn: json["titleEn"],
        titleAr: json["titleAr"],
        title: json["title"],
        parentId: json["parentId"],
        parentName: json["parentName"],
        deleted: json["deleted"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "titleEn": titleEn,
        "titleAr": titleAr,
        "title": title,
        "parentId": parentId,
        "parentName": parentName,
        "deleted": deleted,
      };
}

// To parse this JSON data, do
//
//     final newAccessoriesModel = newAccessoriesModelFromJson(jsonString);

List<NewAccessoriesModel> newAccessoriesModelFromJson(String str) =>
    List<NewAccessoriesModel>.from(
        json.decode(str).map((x) => NewAccessoriesModel.fromJson(x)));

String newAccessoriesModelToJson(List<NewAccessoriesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NewAccessoriesModel {
  NewAccessoriesModel({
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
  int shopCompanyId;
  int imageId;
  String imageUrl;
  String shopCompanyName;
  bool approvalStatus;
  DateTime lastModifiedDate;
  dynamic models;
  dynamic images;

  factory NewAccessoriesModel.fromJson(Map<String, dynamic> json) =>
      NewAccessoriesModel(
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
