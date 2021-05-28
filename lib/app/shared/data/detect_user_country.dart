// import 'package:flutter/material.dart';
// import 'package:geocoder/geocoder.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:get/get.dart';
// class DetectCountry {
//   static final storage = GetStorage();
//   static Future detectUserCountry(RxString detectCountry) async {
//     try {
//       Position position = await Geolocator()
//           .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//       debug// print('location: ${position.latitude}');
//       final coordinates =
//           new Coordinates(position.latitude, position.longitude);
//       var addresses =
//           await Geocoder.local.findAddressesFromCoordinates(coordinates);
//       saveDetectCountry(addresses.first.countryCode);
//       detectCountry(getDetectCountry());
//     } catch (e) {
//       // print(e);
//     }
//   }
//
//   static saveDetectCountry(detectCountry) {
//     storage.write('detectCountry', detectCountry);
//   }
//
//   static getDetectCountry() {
//     String detectCountry = storage.read('detectCountry');
//     return detectCountry;
//   }
// }
