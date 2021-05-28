// To parse this JSON data, do
//
//     final defaultLists = defaultListsFromJson(jsonString);

import 'dart:convert';

DefaultLists defaultListsFromJson(String str) =>
    DefaultLists.fromJson(json.decode(str));

String defaultListsToJson(DefaultLists data) => json.encode(data.toJson());

class DefaultLists {
  DefaultLists({
    this.carStatus,
    this.machineStatus,
    this.gearsStatus,
    this.tireWheelStatus,
    this.carTransferType,
  });

  List<CarStatus> carStatus;
  List<CarStatus> machineStatus;
  List<CarStatus> gearsStatus;
  List<CarStatus> tireWheelStatus;
  List<CarStatus> carTransferType;

  factory DefaultLists.fromJson(Map<String, dynamic> json) => DefaultLists(
        carStatus: List<CarStatus>.from(
            json["carStatus"].map((x) => CarStatus.fromJson(x))),
        machineStatus: List<CarStatus>.from(
            json["machineStatus"].map((x) => CarStatus.fromJson(x))),
        gearsStatus: List<CarStatus>.from(
            json["gearsStatus"].map((x) => CarStatus.fromJson(x))),
        tireWheelStatus: List<CarStatus>.from(
            json["tireWheelStatus"].map((x) => CarStatus.fromJson(x))),
        carTransferType: List<CarStatus>.from(
            json["carTransferType"].map((x) => CarStatus.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "carStatus": List<dynamic>.from(carStatus.map((x) => x.toJson())),
        "machineStatus":
            List<dynamic>.from(machineStatus.map((x) => x.toJson())),
        "gearsStatus": List<dynamic>.from(gearsStatus.map((x) => x.toJson())),
        "tireWheelStatus":
            List<dynamic>.from(tireWheelStatus.map((x) => x.toJson())),
        "carTransferType":
            List<dynamic>.from(carTransferType.map((x) => x.toJson())),
      };
}

class CarStatus {
  CarStatus({
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

  factory CarStatus.fromJson(Map<String, dynamic> json) => CarStatus(
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
