// To parse this JSON data, do
//
//     final carsType = carsTypeFromJson(jsonString);

import 'dart:convert';

List<CarsType> carsTypeFromJson(String str) =>
    List<CarsType>.from(json.decode(str).map((x) => CarsType.fromJson(x)));

String carsTypeToJson(List<CarsType> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CarsType {
  CarsType({
    this.id,
    this.title,
    this.refId,
    this.arrange,
    this.passengers,
    this.services,
  });

  int id;
  String title;
  int refId;
  dynamic arrange;
  dynamic passengers;
  dynamic services;

  factory CarsType.fromJson(Map<String, dynamic> json) => CarsType(
        id: json["id"],
        title: json["title"],
        refId: json["refId"],
        arrange: json["arrange"],
        passengers: json["passengers"],
        services: json["services"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "refId": refId,
        "arrange": arrange,
        "passengers": passengers,
        "services": services,
      };
}

// To parse this JSON data, do
//
//     final carConditionLists = carConditionListsFromJson(jsonString);

CarConditionLists carConditionListsFromJson(String str) =>
    CarConditionLists.fromJson(json.decode(str));

String carConditionListsToJson(CarConditionLists data) =>
    json.encode(data.toJson());

class CarConditionLists {
  CarConditionLists({
    this.carStatus,
    this.insideStatus,
    this.electricityStatus,
    this.tiresStatus,
    this.carCheckType,
  });

  List<CarCheckType> carStatus;
  List<CarCheckType> insideStatus;
  List<CarCheckType> electricityStatus;
  List<CarCheckType> tiresStatus;
  List<CarCheckType> carCheckType;

  factory CarConditionLists.fromJson(Map<String, dynamic> json) =>
      CarConditionLists(
        carStatus: List<CarCheckType>.from(
            json["carStatus"].map((x) => CarCheckType.fromJson(x))),
        insideStatus: List<CarCheckType>.from(
            json["insideStatus"].map((x) => CarCheckType.fromJson(x))),
        electricityStatus: List<CarCheckType>.from(
            json["electricityStatus"].map((x) => CarCheckType.fromJson(x))),
        tiresStatus: List<CarCheckType>.from(
            json["tiresStatus"].map((x) => CarCheckType.fromJson(x))),
        carCheckType: List<CarCheckType>.from(
            json["carCheckType"].map((x) => CarCheckType.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "carStatus": List<dynamic>.from(carStatus.map((x) => x.toJson())),
        "insideStatus": List<dynamic>.from(insideStatus.map((x) => x.toJson())),
        "electricityStatus":
            List<dynamic>.from(electricityStatus.map((x) => x.toJson())),
        "tiresStatus": List<dynamic>.from(tiresStatus.map((x) => x.toJson())),
        "carCheckType": List<dynamic>.from(carCheckType.map((x) => x.toJson())),
      };
}

class CarCheckType {
  CarCheckType({
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
  dynamic action;

  factory CarCheckType.fromJson(Map<String, dynamic> json) => CarCheckType(
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

// To parse this JSON data, do
//
//     final carRegions = carRegionsFromJson(jsonString);

List<CarRegions> carRegionsFromJson(String str) =>
    List<CarRegions>.from(json.decode(str).map((x) => CarRegions.fromJson(x)));

String carRegionsToJson(List<CarRegions> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CarRegions {
  CarRegions({
    this.id,
    this.regionName,
    this.name,
    this.regionNameAr,
    this.regionNameEn,
  });

  int id;
  String regionName;
  String name;
  String regionNameAr;
  String regionNameEn;

  factory CarRegions.fromJson(Map<String, dynamic> json) => CarRegions(
        id: json["id"],
        regionName: json["regionName"],
        name: json["name"],
        regionNameAr: json["regionNameAr"],
        regionNameEn: json["regionNameEn"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "regionName": regionName,
        "name": name,
        "regionNameAr": regionNameAr,
        "regionNameEn": regionNameEn,
      };
}

// To parse this JSON data, do
//
//     final carModels = carModelsFromJson(jsonString);

List<CarModels> carModelsFromJson(String str) =>
    List<CarModels>.from(json.decode(str).map((x) => CarModels.fromJson(x)));

String carModelsToJson(List<CarModels> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CarModels {
  CarModels({
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
  });

  int id;
  String titleAr;
  String titleEn;
  String title;
  int regionId;
  int carTypeId;
  String modelName;
  String carTypeName;
  String regionName;
  String name;

  factory CarModels.fromJson(Map<String, dynamic> json) => CarModels(
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
      };
}

// To parse this JSON data, do
//
//     final carYears = carYearsFromJson(jsonString);

List<CarYears> carYearsFromJson(String str) =>
    List<CarYears>.from(json.decode(str).map((x) => CarYears.fromJson(x)));

String carYearsToJson(List<CarYears> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CarYears {
  CarYears({
    this.id,
    this.titleAr,
    this.titleEn,
    this.title,
    this.regionId,
    this.carTypeId,
    this.modelId,
    this.yearName,
    this.modelName,
    this.carTypeName,
    this.regionName,
    this.name,
  });

  int id;
  String titleAr;
  String titleEn;
  String title;
  int regionId;
  int carTypeId;
  int modelId;
  String yearName;
  String modelName;
  String carTypeName;
  String regionName;
  String name;

  factory CarYears.fromJson(Map<String, dynamic> json) => CarYears(
        id: json["id"],
        titleAr: json["titleAr"],
        titleEn: json["titleEn"],
        title: json["title"],
        regionId: json["regionId"],
        carTypeId: json["carTypeId"],
        modelId: json["modelId"],
        yearName: json["yearName"],
        modelName: json["modelName"],
        carTypeName: json["carTypeName"],
        regionName: json["regionName"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "titleAr": titleAr,
        "titleEn": titleEn,
        "title": title,
        "regionId": regionId,
        "carTypeId": carTypeId,
        "modelId": modelId,
        "yearName": yearName,
        "modelName": modelName,
        "carTypeName": carTypeName,
        "regionName": regionName,
        "name": name,
      };
}
// To parse this JSON data, do
//
//     final governorate = governorateFromJson(jsonString);

List<Governorate> governorateFromJson(String str) => List<Governorate>.from(
    json.decode(str).map((x) => Governorate.fromJson(x)));

String governorateToJson(List<Governorate> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Governorate {
  Governorate({
    this.id,
    this.areaName,
    this.areaNameAr,
    this.areaNameEn,
    this.parentId,
    this.parentName,
    this.status,
    this.statusName,
    this.statusComment,
    this.deliveryCharge,
  });

  int id;
  String areaName;
  String areaNameAr;
  String areaNameEn;
  dynamic parentId;
  dynamic parentName;
  dynamic status;
  String statusName;
  dynamic statusComment;
  dynamic deliveryCharge;

  factory Governorate.fromJson(Map<String, dynamic> json) => Governorate(
        id: json["id"],
        areaName: json["areaName"],
        areaNameAr: json["areaNameAr"],
        areaNameEn: json["areaNameEn"],
        parentId: json["parentId"],
        parentName: json["parentName"],
        status: json["status"],
        statusName: json["statusName"],
        statusComment: json["statusComment"],
        deliveryCharge: json["deliveryCharge"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "areaName": areaName,
        "areaNameAr": areaNameAr,
        "areaNameEn": areaNameEn,
        "parentId": parentId,
        "parentName": parentName,
        "status": status,
        "statusName": statusName,
        "statusComment": statusComment,
        "deliveryCharge": deliveryCharge,
      };
}
// To parse this JSON data, do
//
//     final heavyCarYear = heavyCarYearFromJson(jsonString);

List<HeavyCarYear> heavyCarYearFromJson(String str) => List<HeavyCarYear>.from(
    json.decode(str).map((x) => HeavyCarYear.fromJson(x)));

String heavyCarYearToJson(List<HeavyCarYear> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HeavyCarYear {
  HeavyCarYear({
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
  Type type;
  dynamic action;

  factory HeavyCarYear.fromJson(Map<String, dynamic> json) => HeavyCarYear(
        id: json["id"],
        title: json["title"],
        titleAr: json["titleAr"],
        titleEn: json["titleEn"],
        type: typeValues.map[json["type"]],
        action: json["action"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "titleAr": titleAr,
        "titleEn": titleEn,
        "type": typeValues.reverse[type],
        "action": action,
      };
}

enum Type { YEARS }

final typeValues = EnumValues({"years": Type.YEARS});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
