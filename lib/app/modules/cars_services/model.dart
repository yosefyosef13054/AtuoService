/// To parse this JSON data, do
//
//     final services = servicesFromJson(jsonString);

import 'dart:convert';

List<Services> servicesFromJson(String str) =>
    List<Services>.from(json.decode(str).map((x) => Services.fromJson(x)));

String servicesToJson(List<Services> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Services {
  Services({
    this.id,
    this.companyId,
    this.companyLogoUrl,
    this.companyServiceId,
    this.duration,
    this.companyName,
    this.serviceNameEn,
    this.serviceNameAr,
    this.serviceName,
    this.serviceTypeId,
    this.serviceTypeName,
    this.imageUrl,
    this.serviceDescriptionEn,
    this.serviceDescriptionAr,
    this.serviceDescription,
    this.createdDate,
    this.unitPrice,
    this.isPackage,
    this.status,
    this.isActive,
    this.allowArea,
  });

  var id;
  var companyId;
  var companyLogoUrl;
  var companyServiceId;
  var duration;
  var companyName;
  var serviceNameEn;
  var serviceNameAr;
  var serviceName;
  var serviceTypeId;
  var serviceTypeName;
  var imageUrl;
  var serviceDescriptionEn;
  var serviceDescriptionAr;
  var serviceDescription;
  var createdDate;
  var unitPrice;
  var isPackage;
  var status;
  var isActive;
  var allowArea;

  factory Services.fromJson(Map<String, dynamic> json) => Services(
        id: json["id"],
        companyId: json["companyId"],
        companyLogoUrl: json["companyLogoURL"],
        companyServiceId: json["companyServiceId"],
        duration: json["duration"],
        companyName: json["companyName"],
        serviceNameEn: json["serviceNameEn"],
        serviceNameAr: json["serviceNameAr"],
        serviceName: json["serviceName"],
        serviceTypeId: json["serviceTypeId"],
        serviceTypeName: json["serviceTypeName"],
        imageUrl: json["imageURL"],
        serviceDescriptionEn: json["serviceDescriptionEn"],
        serviceDescriptionAr: json["serviceDescriptionAr"],
        serviceDescription: json["serviceDescription"],
        createdDate: json["createdDate"],
        unitPrice: json["unitPrice"],
        isPackage: json["isPackage"],
        status: json["status"],
        isActive: json["isActive"],
        allowArea: json["allowArea"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "companyId": companyId,
        "companyLogoURL": companyLogoUrl,
        "companyServiceId": companyServiceId,
        "duration": duration,
        "companyName": companyName,
        "serviceNameEn": serviceNameEn,
        "serviceNameAr": serviceNameAr,
        "serviceName": serviceName,
        "serviceTypeId": serviceTypeId,
        "serviceTypeName": serviceTypeName,
        "imageURL": imageUrl,
        "serviceDescriptionEn": serviceDescriptionEn,
        "serviceDescriptionAr": serviceDescriptionAr,
        "serviceDescription": serviceDescription,
        "createdDate": createdDate,
        "unitPrice": unitPrice,
        "isPackage": isPackage,
        "status": status,
        "isActive": isActive,
        "allowArea": allowArea,
      };
}

// To parse this JSON data, do
//
//     final serviceCategory = serviceCategoryFromJson(jsonString);

List<ServiceCategory> serviceCategoryFromJson(String str) =>
    List<ServiceCategory>.from(
        json.decode(str).map((x) => ServiceCategory.fromJson(x)));

String serviceCategoryToJson(List<ServiceCategory> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ServiceCategory {
  ServiceCategory({
    this.id,
    this.serviceTypeEn,
    this.serviceTypeAr,
    this.serviceType,
    this.lastModifiedDate,
    this.serviceTypeParent,
    this.parentId,
    this.companyId,
    this.adsImageUrl,
    this.status,
    this.allowArea,
    this.imageUrl,
    this.chiledServiceTypes,
    this.prices,
  });

  int id;
  String serviceTypeEn;
  String serviceTypeAr;
  String serviceType;
  DateTime lastModifiedDate;
  dynamic serviceTypeParent;
  dynamic parentId;
  dynamic companyId;
  String adsImageUrl;
  dynamic status;
  dynamic allowArea;
  String imageUrl;
  dynamic chiledServiceTypes;
  dynamic prices;

  factory ServiceCategory.fromJson(Map<String, dynamic> json) =>
      ServiceCategory(
        id: json["id"],
        serviceTypeEn: json["serviceTypeEn"],
        serviceTypeAr: json["serviceTypeAr"],
        serviceType: json["serviceType"],
        lastModifiedDate: DateTime.parse(json["lastModifiedDate"]),
        serviceTypeParent: json["serviceTypeParent"],
        parentId: json["parentId"],
        companyId: json["companyId"],
        adsImageUrl: json["adsImageURL"],
        status: json["status"],
        allowArea: json["allowArea"],
        imageUrl: json["imageURL"],
        chiledServiceTypes: json["ChiledServiceTypes"],
        prices: json["prices"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "serviceTypeEn": serviceTypeEn,
        "serviceTypeAr": serviceTypeAr,
        "serviceType": serviceType,
        "lastModifiedDate": lastModifiedDate.toIso8601String(),
        "serviceTypeParent": serviceTypeParent,
        "parentId": parentId,
        "companyId": companyId,
        "adsImageURL": adsImageUrl,
        "status": status,
        "allowArea": allowArea,
        "imageURL": imageUrl,
        "ChiledServiceTypes": chiledServiceTypes,
        "prices": prices,
      };
}

// To parse this JSON data, do
//
//     final serviceTypes = serviceTypesFromJson(jsonString);

List<ServiceTypes> serviceTypesFromJson(String str) => List<ServiceTypes>.from(
    json.decode(str).map((x) => ServiceTypes.fromJson(x)));

String serviceTypesToJson(List<ServiceTypes> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ServiceTypes {
  ServiceTypes({
    this.id,
    this.title,
    this.titleAr,
    this.titleEn,
  });

  int id;
  String title;
  String titleAr;
  String titleEn;

  factory ServiceTypes.fromJson(Map<String, dynamic> json) => ServiceTypes(
        id: json["id"],
        title: json["title"],
        titleAr: json["titleAr"],
        titleEn: json["titleEn"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "titleAr": titleAr,
        "titleEn": titleEn,
      };
}

// To parse this JSON data, do
//
//     final carTypes = carTypesFromJson(jsonString);

List<CarTypes> carTypesFromJson(String str) =>
    List<CarTypes>.from(json.decode(str).map((x) => CarTypes.fromJson(x)));

String carTypesToJson(List<CarTypes> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CarTypes {
  CarTypes({
    this.id,
    this.serviceTypeEn,
    this.serviceTypeAr,
    this.serviceType,
    this.lastModifiedDate,
    this.serviceTypeParent,
    this.parentId,
    this.companyId,
    this.adsImageUrl,
    this.status,
    this.allowArea,
    this.imageUrl,
    this.chiledServiceTypes,
    this.prices,
  });

  int id;
  String serviceTypeEn;
  String serviceTypeAr;
  String serviceType;
  DateTime lastModifiedDate;
  String serviceTypeParent;
  int parentId;
  dynamic companyId;
  String adsImageUrl;
  dynamic status;
  bool allowArea;
  String imageUrl;
  dynamic chiledServiceTypes;
  dynamic prices;

  factory CarTypes.fromJson(Map<String, dynamic> json) => CarTypes(
        id: json["id"],
        serviceTypeEn: json["serviceTypeEn"],
        serviceTypeAr: json["serviceTypeAr"],
        serviceType: json["serviceType"],
        lastModifiedDate: DateTime.parse(json["lastModifiedDate"]),
        serviceTypeParent: json["serviceTypeParent"],
        parentId: json["parentId"],
        companyId: json["companyId"],
        adsImageUrl: json["adsImageURL"],
        status: json["status"],
        allowArea: json["allowArea"],
        imageUrl: json["imageURL"],
        chiledServiceTypes: json["ChiledServiceTypes"],
        prices: json["prices"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "serviceTypeEn": serviceTypeEn,
        "serviceTypeAr": serviceTypeAr,
        "serviceType": serviceType,
        "lastModifiedDate": lastModifiedDate.toIso8601String(),
        "serviceTypeParent": serviceTypeParent,
        "parentId": parentId,
        "companyId": companyId,
        "adsImageURL": adsImageUrl,
        "status": status,
        "allowArea": allowArea,
        "imageURL": imageUrl,
        "ChiledServiceTypes": chiledServiceTypes,
        "prices": prices,
      };
}

// To parse this JSON data, do
//
//     final serviceTime = serviceTimeFromJson(jsonString);

List<ServiceTime> serviceTimeFromJson(String str) => List<ServiceTime>.from(
    json.decode(str).map((x) => ServiceTime.fromJson(x)));

String serviceTimeToJson(List<ServiceTime> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ServiceTime {
  ServiceTime({
    this.itemDate,
    this.dayOfMonth,
    this.month,
    this.monthName,
    this.dayName,
    this.times,
  });

  var itemDate;
  var dayOfMonth;
  var month;
  var monthName;
  var dayName;
  List<Time> times;

  factory ServiceTime.fromJson(Map<String, dynamic> json) => ServiceTime(
        itemDate: json["itemDate"],
        dayOfMonth: json["dayOfMonth"],
        month: json["month"],
        monthName: json["monthName"],
        dayName: json["dayName"],
        times: List<Time>.from(json["times"].map((x) => Time.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "itemDate": itemDate,
        "dayOfMonth": dayOfMonth,
        "month": month,
        "monthName": monthName,
        "dayName": dayName,
        "times": List<dynamic>.from(times.map((x) => x.toJson())),
      };
}

class Time {
  Time({
    this.id,
    this.companyId,
    this.deleted,
    this.timeId,
    this.companyName,
    this.timeLable,
    this.timeStart,
    this.timeFinish,
    this.dayNumber,
    this.startDate,
    this.finishDate,
    this.dayName,
    this.isActive,
  });

  var id;
  var companyId;
  var deleted;
  var timeId;
  var companyName;
  var timeLable;
  var timeStart;
  var timeFinish;
  var dayNumber;
  var startDate;
  var finishDate;
  var dayName;
  var isActive;

  factory Time.fromJson(Map<String, dynamic> json) => Time(
        id: json["id"],
        companyId: json["companyId"],
        deleted: json["deleted"],
        timeId: json["timeId"],
        companyName: json["companyName"],
        timeLable: json["timeLable"],
        timeStart: json["timeStart"],
        timeFinish: json["timeFinish"],
        dayNumber: json["dayNumber"],
        startDate: json["startDate"],
        finishDate: json["finishDate"],
        dayName: json["dayName"],
        isActive: json["isActive"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "companyId": companyId,
        "deleted": deleted,
        "timeId": timeId,
        "companyName": companyName,
        "timeLable": timeLable,
        "timeStart": timeStart,
        "timeFinish": timeFinish,
        "dayNumber": dayNumber,
        "startDate": startDate,
        "finishDate": finishDate,
        "dayName": dayName,
        "isActive": isActive,
      };
}
