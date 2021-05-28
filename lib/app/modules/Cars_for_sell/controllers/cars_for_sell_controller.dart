import 'package:get/get.dart';
import 'dart:io';

import 'package:autoservice/app/Colors.dart';
import 'package:flutter/material.dart' as flutter;
import 'package:get/get.dart';
import 'package:autoservice/app/services/helper.dart';
import 'package:autoservice/app/modules/drawer_menu/model.dart';
import '../../../services/httpService.dart';
import 'package:dio/dio.dart' as dio;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:autoservice/app/modules/HomeScreen/model.dart';
import 'dart:convert';

class CarsForSellController extends GetxController {
  //TODO: Implement CarsForSellController
  final http = Get.find<HttpService>();
  var loading = false.obs;
  var response;
  List<Bottom> topSlider = [];
  List<Bottom> bottomlider = [];

  void getData() async {
    loading.value = true;
    try {
      response = await http.get('HomeImage/GetCarSales');
      var topSliderjson = response.data['top'];
      var bottomliderjson = response.data['bottom'];

      for (var json in topSliderjson) {
        topSlider.contains(Bottom(
                  id: json["id"],
                  carId: json["carId"],
                  carName: json["carName"],
                  lastModifiedDate: DateTime.parse(json["lastModifiedDate"]),
                  imageUrl: json["imageURL"],
                  location: json["location"],
                )) ==
                true
            ? null
            : topSlider.add(Bottom(
                id: json["id"],
                carId: json["carId"],
                carName: json["carName"],
                lastModifiedDate: DateTime.parse(json["lastModifiedDate"]),
                imageUrl: json["imageURL"],
                location: json["location"],
              ));
      }
      for (var json in bottomliderjson) {
        bottomlider.contains(Bottom(
                  id: json["id"],
                  carId: json["carId"],
                  carName: json["carName"],
                  lastModifiedDate: DateTime.parse(json["lastModifiedDate"]),
                  imageUrl: json["imageURL"],
                  location: json["location"],
                )) ==
                true
            ? null
            : bottomlider.add(Bottom(
                id: json["id"],
                carId: json["carId"],
                carName: json["carName"],
                lastModifiedDate: DateTime.parse(json["lastModifiedDate"]),
                imageUrl: json["imageURL"],
                location: json["location"],
              ));
      }
      // // print(profile.id);
      update();
      loading.value = false;
    } catch (e) {
      getData();
      // if (token.value.toString() == null.toString()) {}
      // havetoken();
      // // print(e.response.data);
      //errooor
      // print(e);
    }
  }

  final count = 0.obs;
  @override
  void onInit() {
    getData();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}

// To parse this JSON data, do
//
//     final garages = garagesFromJson(jsonString);

Garages garagesFromJson(String str) => Garages.fromJson(json.decode(str));

String garagesToJson(Garages data) => json.encode(data.toJson());

class Garages {
  Garages({
    this.top,
    this.bottom,
  });

  List<Bottom> top;
  List<Bottom> bottom;

  factory Garages.fromJson(Map<String, dynamic> json) => Garages(
        top: List<Bottom>.from(json["top"].map((x) => Bottom.fromJson(x))),
        bottom:
            List<Bottom>.from(json["bottom"].map((x) => Bottom.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "top": List<dynamic>.from(top.map((x) => x.toJson())),
        "bottom": List<dynamic>.from(bottom.map((x) => x.toJson())),
      };
}

class Bottom {
  Bottom({
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

  factory Bottom.fromJson(Map<String, dynamic> json) => Bottom(
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
