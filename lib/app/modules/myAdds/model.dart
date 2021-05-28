// To parse this JSON data, do
//
//     final myAdds = myAddsFromJson(jsonString);

import 'dart:convert';

MyAdds myAddsFromJson(String str) => MyAdds.fromJson(json.decode(str));

String myAddsToJson(MyAdds data) => json.encode(data.toJson());

class MyAdds {
  MyAdds({
    this.scrapCars,
    this.accessories,
    this.usedCars,
    this.trucks,
  });

  List<Car> scrapCars;
  List<Accessory> accessories;
  List<Car> usedCars;
  List<Truck> trucks;

  factory MyAdds.fromJson(Map<String, dynamic> json) => MyAdds(
        scrapCars:
            List<Car>.from(json["scrapCars"].map((x) => Car.fromJson(x))),
        accessories: List<Accessory>.from(
            json["accessories"].map((x) => Accessory.fromJson(x))),
        usedCars: List<Car>.from(json["usedCars"].map((x) => Car.fromJson(x))),
        trucks: List<Truck>.from(json["trucks"].map((x) => Truck.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "scrapCars": List<dynamic>.from(scrapCars.map((x) => x.toJson())),
        "accessories": List<dynamic>.from(accessories.map((x) => x.toJson())),
        "usedCars": List<dynamic>.from(usedCars.map((x) => x.toJson())),
        "trucks": List<dynamic>.from(trucks.map((x) => x.toJson())),
      };
}

class Accessory {
  Accessory({
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
  var unitPrice;
  var phone;
  var status;
  var areaId;
  var areaName;
  var whatsApp;
  var adType;
  List images;

  factory Accessory.fromJson(Map<String, dynamic> json) => Accessory(
        id: json["id"],
        regionId: json["regionId"],
        imageUrl: json["imageURL"],
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
        unitPrice: json["unitPrice"],
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
        "imageURL": imageUrl,
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

class AccessoryImage {
  AccessoryImage({
    this.id,
    this.sparePartId,
    this.sparePartName,
    this.imageUrl,
    this.fileName,
    this.isCover,
  });

  var id;
  var sparePartId;
  var sparePartName;
  var imageUrl;
  var fileName;
  var isCover;

  factory AccessoryImage.fromJson(Map<String, dynamic> json) => AccessoryImage(
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

class Car {
  Car({
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
    this.adType,
    this.images,
    this.partName,
    this.insideStatusId,
    this.insideStatusName,
    this.electricityStatusId,
    this.electricityStatusName,
    this.carCheckId,
    this.carCheckName,
    this.carCheckComment,
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
  var adType;
  List<ScrapCarImage> images;
  dynamic partName;
  var insideStatusId;
  var insideStatusName;
  var electricityStatusId;
  var electricityStatusName;
  var carCheckId;
  var carCheckName;
  dynamic carCheckComment;
  var kmCounter;

  factory Car.fromJson(Map<String, dynamic> json) => Car(
        id: json["id"],
        regionId: json["regionId"],
        clientId: json["clientId"],
        imageUrl: json["imageURL"],
        kmCounter: json["kmCounter"],
        clientName: json["clientName"],
        regionName: json["regionName"],
        carTypeId: json["carTypeId"],
        carTypeName: json["carTypeName"],
        carModelId: json["carModelId"],
        carModelName: json["carModelName"],
        carYearId: json["carYearId"],
        carYearName: json["carYearName"],
        partNameEn: json["partNameEn"] == null ? null : json["partNameEn"],
        partNameAr: json["partNameAr"] == null ? null : json["partNameAr"],
        descriptionEn: json["descriptionEn"],
        descriptionAr: json["descriptionAr"],
        description: json["description"],
        unitPrice: json["unitPrice"].toString(),
        phone: json["phone"],
        status: json["status"],
        outsideStatusId: json["outsideStatusId"],
        outsideStatusName: json["outsideStatusName"],
        machineStatusId:
            json["machineStatusId"] == null ? null : json["machineStatusId"],
        machineStatusName: json["machineStatusName"] == null
            ? null
            : json["machineStatusName"],
        gearsStatusId:
            json["gearsStatusId"] == null ? null : json["gearsStatusId"],
        gearsStatusName:
            json["gearsStatusName"] == null ? null : json["gearsStatusName"],
        tiresStatusId: json["tiresStatusId"],
        tiresStatusName: json["tiresStatusName"],
        carTransferTypeId: json["carTransferTypeId"] == null
            ? null
            : json["carTransferTypeId"],
        carTransferTypeName: json["carTransferTypeName"] == null
            ? null
            : json["carTransferTypeName"],
        areaId: json["areaId"],
        areaName: json["areaName"],
        whatsApp: json["whatsApp"],
        adType: json["adType"],
        images: List<ScrapCarImage>.from(
            json["images"].map((x) => ScrapCarImage.fromJson(x))),
        partName: json["partName"],
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
        carCheckId: json["carCheckId"] == null ? null : json["carCheckId"],
        carCheckName:
            json["carCheckName"] == null ? null : json["carCheckName"],
        carCheckComment: json["carCheckComment"],
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
        "partNameEn": partNameEn == null ? null : partNameEn,
        "partNameAr": partNameAr == null ? null : partNameAr,
        "descriptionEn": descriptionEn,
        "descriptionAr": descriptionAr,
        "description": description,
        "unitPrice": unitPrice,
        "phone": phone,
        "status": status,
        "outsideStatusId": outsideStatusId,
        "outsideStatusName": outsideStatusName,
        "machineStatusId": machineStatusId == null ? null : machineStatusId,
        "machineStatusName":
            machineStatusName == null ? null : machineStatusName,
        "gearsStatusId": gearsStatusId == null ? null : gearsStatusId,
        "gearsStatusName": gearsStatusName == null ? null : gearsStatusName,
        "tiresStatusId": tiresStatusId,
        "tiresStatusName": tiresStatusName,
        "carTransferTypeId":
            carTransferTypeId == null ? null : carTransferTypeId,
        "carTransferTypeName":
            carTransferTypeName == null ? null : carTransferTypeName,
        "areaId": areaId,
        "areaName": areaName,
        "whatsApp": whatsApp,
        "adType": adType,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "partName": partName,
        "insideStatusId": insideStatusId == null ? null : insideStatusId,
        "insideStatusName": insideStatusName == null ? null : insideStatusName,
        "electricityStatusId":
            electricityStatusId == null ? null : electricityStatusId,
        "electricityStatusName":
            electricityStatusName == null ? null : electricityStatusName,
        "carCheckId": carCheckId == null ? null : carCheckId,
        "carCheckName": carCheckName == null ? null : carCheckName,
        "carCheckComment": carCheckComment,
        "kmCounter": kmCounter,
      };
}

class ScrapCarImage {
  ScrapCarImage({
    this.id,
    this.carId,
    this.carName,
    this.imageUrl,
    this.fileName,
    this.isCover,
  });

  var id;
  var carId;
  var carName;
  var imageUrl;
  var fileName;
  var isCover;

  factory ScrapCarImage.fromJson(Map<String, dynamic> json) => ScrapCarImage(
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

class Truck {
  Truck({
    this.id,
    this.clientId,
    this.clientName,
    this.imageUrl,
    this.carYearId,
    this.carYearName,
    this.partNameEn,
    this.partNameAr,
    this.descriptionEn,
    this.partName,
    this.description,
    this.descriptionAr,
    this.unitPrice,
    this.phone,
    this.status,
    this.areaId,
    this.areaName,
    this.whatsApp,
    this.adType,
    this.images,
  });

  var id;
  var clientId;
  var clientName;
  var imageUrl;
  var carYearId;
  var carYearName;
  var partNameEn;
  var partNameAr;
  var descriptionEn;
  var partName;
  var description;
  var descriptionAr;
  var unitPrice;
  var phone;
  var status;
  var areaId;
  var areaName;
  var whatsApp;
  var adType;
  List<TruckImage> images;

  factory Truck.fromJson(Map<String, dynamic> json) => Truck(
        id: json["id"],
        clientId: json["clientId"],
        clientName: json["clientName"],
        imageUrl: json["imageURL"],
        carYearId: json["carYearId"],
        carYearName: json["carYearName"],
        partNameEn: json["partNameEn"],
        partNameAr: json["partNameAr"],
        descriptionEn: json["descriptionEn"],
        partName: json["partName"],
        description: json["description"],
        descriptionAr: json["descriptionAr"],
        unitPrice: json["unitPrice"],
        phone: json["phone"],
        status: json["status"],
        areaId: json["areaId"],
        areaName: json["areaName"],
        whatsApp: json["whatsApp"],
        adType: json["adType"],
        images: List<TruckImage>.from(
            json["images"].map((x) => TruckImage.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "clientId": clientId,
        "clientName": clientName,
        "imageURL": imageUrl,
        "carYearId": carYearId,
        "carYearName": carYearName,
        "partNameEn": partNameEn,
        "partNameAr": partNameAr,
        "descriptionEn": descriptionEn,
        "partName": partName,
        "description": description,
        "descriptionAr": descriptionAr,
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

class TruckImage {
  TruckImage({
    this.id,
    this.truckId,
    this.truckName,
    this.imageUrl,
    this.fileName,
    this.isCover,
  });

  var id;
  var truckId;
  var truckName;
  var imageUrl;
  var fileName;
  var isCover;

  factory TruckImage.fromJson(Map<String, dynamic> json) => TruckImage(
        id: json["id"],
        truckId: json["truckId"],
        truckName: json["truckName"],
        imageUrl: json["imageURL"],
        fileName: json["fileName"],
        isCover: json["isCover"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "truckId": truckId,
        "truckName": truckName,
        "imageURL": imageUrl,
        "fileName": fileName,
        "isCover": isCover,
      };
}
