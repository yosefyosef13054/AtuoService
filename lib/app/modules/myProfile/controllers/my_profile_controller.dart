import 'package:get/get.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:flutter/material.dart';
import 'package:autoservice/app/modules/drawer_menu/model.dart';

import '../../../services/httpService.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyProfileController extends GetxController {
  //TODO: Implement MyProfileController
  final http = Get.find<HttpService>();
  final RoundedLoadingButtonController btnController =
      new RoundedLoadingButtonController();
  TextEditingController nameController1 = TextEditingController();
  TextEditingController numberController1 = TextEditingController();

  Profile profile;
  var loading = false.obs;
  var token = ''.obs;

  void submit(context) async {
    FocusScope.of(context).requestFocus(new FocusNode());
    // loading.value = true;

    http
        .postUrl(
            'Client/Edit',
            {
              'clientName': nameController1.text.toString(),
              // 'phone': countryCode1.value.text,
              // 'userPassword': passwordController1.text,
              'countryCode': profile.countryCode.toString(),
              'id': profile.id,
              'phone': numberController1.text.toString(),
            },
            true)
        .then((response) {
      // Get.back();
      try {
        btnController.success();
        Fluttertoast.showToast(
            msg: 'account_updated'.tr,
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 0,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        Future.delayed(Duration(milliseconds: 800), () {
          btnController.reset();
        });

        loading.value = false;
      } catch (e) {
        btnController.error();
        Future.delayed(Duration(milliseconds: 1200), () {
          btnController.reset();
        });
        // print("Exepition with Login : ${e}");
      }
    }).catchError((onError) {
      btnController.error();
      Future.delayed(Duration(milliseconds: 1200), () {
        btnController.reset();
      });
      Fluttertoast.showToast(
          msg: onError.response.data['ErrorMessage'],
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 0,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      // print('Login error ${onError.response}');
    });
  }

  void getuserData() async {
    loading.value = true;

    try {
      var response = await http.get('Client/GetClient');
      profile = Profile.fromJson(response.data);
      nameController1.text = profile.clientName;
      numberController1.text = profile.phone;
      // print(profile.id);
      update();
      loading.value = false;
      update();
    } catch (e) {
      getuserData();

      // // print(e.response.data);
      //errooor
      // print(e);
    }
  }

  final count = 0.obs;

  @override
  void onInit() {
    getuserData();

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
