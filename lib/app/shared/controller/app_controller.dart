import 'package:autoservice/app/shared/data/api_token.dart';

import 'package:autoservice/app/shared/data/user_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//The Function detected User Country
import '../data/detect_user_country.dart';

class AppController extends GetxController {
  //Vars For Detect User Country
  // RxString detectedCountryShortName = RxString("");

  @override
  void onInit() {
    // //Detect user Country and save it in get storage and replace country code in all app to it (in first time)
    // DetectCountry.detectUserCountry(detectedCountryShortName);
    // //Get user country from get storage (this work in all times after first time)
    // detectedCountryShortName(DetectCountry.getDetectCountry());
    APIToken.gatApiToken();
    // UserData.getUserName();
    super.onInit();
  }
}
