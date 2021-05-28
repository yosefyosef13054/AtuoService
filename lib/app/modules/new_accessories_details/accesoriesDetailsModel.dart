// To parse this JSON data, do
//
//     final accessoriesDetailsModel = accessoriesDetailsModelFromJson(jsonString);

import 'dart:convert';

AccessoriesDetailsModel accessoriesDetailsModelFromJson(String str) =>
    AccessoriesDetailsModel.fromJson(json.decode(str));

String accessoriesDetailsModelToJson(AccessoriesDetailsModel data) =>
    json.encode(data.toJson());

class AccessoriesDetailsModel {
  AccessoriesDetailsModel({
    this.id,
    this.categoryId,
    this.isFavorite,
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

  var id;
  var categoryId;
  var categoryName;
  var productNameEn;
  var productNameAr;
  var productName;
  var descriptionEn;
  var descriptionAr;
  var description;
  var unitPrice;
  var deleted;
  var isActive;
  var enableDiscount;
  var unitPriceDiscount;
  var shopCompanyId;
  var imageId;
  var imageUrl;
  var shopCompanyName;
  var approvalStatus;
  var lastModifiedDate;
  List<Model> models;
  List<Image> images;
  var isFavorite;

  factory AccessoriesDetailsModel.fromJson(Map<String, dynamic> json) =>
      AccessoriesDetailsModel(
        id: json["id"],
        categoryId: json["categoryId"],
        isFavorite: json["isFavorite"],
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
        models: List<Model>.from(json["models"].map((x) => Model.fromJson(x))),
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "categoryId": categoryId,
        "isFavorite": isFavorite,
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
        "models": List<dynamic>.from(models.map((x) => x.toJson())),
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
      };
}

class Image {
  Image({
    this.id,
    this.productId,
    this.productName,
    this.isDefault,
  });

  var id;
  var productId;
  var productName;
  var isDefault;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        productId: json["productId"],
        productName: json["productName"],
        isDefault: json["isDefault"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "productId": productId,
        "productName": productName,
        "isDefault": isDefault,
      };
}

class Model {
  Model({
    this.id,
    this.titleAr,
    this.titleEn,
    this.title,
    this.regionId,
    this.carTypeId,
    this.modelName,
    this.carTypeName,
    this.regionName,
    this.name,
    this.startYear,
    this.finishYear,
    this.years,
    this.status,
  });

  var id;
  var titleAr;
  var titleEn;
  var title;
  var regionId;
  var carTypeId;
  var modelName;
  var carTypeName;
  var regionName;
  var name;
  var startYear;
  var finishYear;
  var years;
  var status;

  factory Model.fromJson(Map<String, dynamic> json) => Model(
        id: json["id"],
        titleAr: json["titleAr"],
        titleEn: json["titleEn"],
        title: json["title"],
        regionId: json["regionId"],
        carTypeId: json["carTypeId"],
        modelName: json["modelName"],
        carTypeName: json["carTypeName"],
        regionName: json["regionName"],
        name: json["name"],
        startYear: json["startYear"],
        finishYear: json["finishYear"],
        years: List.from(json["years"].map((x) => x)),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "titleAr": titleAr,
        "titleEn": titleEn,
        "title": title,
        "regionId": regionId,
        "carTypeId": carTypeId,
        "modelName": modelName,
        "carTypeName": carTypeName,
        "regionName": regionName,
        "name": name,
        "startYear": startYear,
        "finishYear": finishYear,
        "years": List<dynamic>.from(years.map((x) => x)),
        "status": status,
      };
}
