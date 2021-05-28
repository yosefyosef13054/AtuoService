import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DetectLocale {
  static var storage = GetStorage();
  static detectLocale() {
    return Get.locale == Locale('en');
  }

  static saveLocale(locale) {
    // print(locale);
    storage.write('locale', locale);
  }

  static getLocale() {
    String locale = storage.read('locale');

    return Locale(locale ?? 'en');
  }
}
