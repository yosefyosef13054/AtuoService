import 'dart:io';

import 'package:get/get.dart';
import '../../../services/httpService.dart';
import 'package:autoservice/app/modules/usedCars_add/models/model.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart' as dio;
import 'package:autoservice/app/widgets/MyAlertDialog.dart';
import 'package:autoservice/app/modules/HomeScreen/views/home_screen_view.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:autoservice/app/Colors.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:autoservice/app/modules/address_payment/model.dart';

class AddAddressController extends GetxController {
  TextEditingController controller0 = TextEditingController(text: '');
  TextEditingController controller1 = TextEditingController(text: '');
  TextEditingController controller2 = TextEditingController(text: '');
  TextEditingController controller3 = TextEditingController(text: '');
  TextEditingController controller4 = TextEditingController(text: '');
  TextEditingController controller5 = TextEditingController(text: '');
  TextEditingController controller6 = TextEditingController(text: '');
  oninit() {
    if (Get.arguments != null && Get.arguments['isedit'] == true) {
      if (Get.arguments['isedit'] == true) {
        Addresses data = Get.arguments['data'];
        // print(data.addressName);
        controller0.text = data.address;
        controller1.text = data.section;
        controller2.text = data.subSection;
        controller3.text = data.street;
        controller4.text = data.building;
        controller5.text = data.floor;
        controller6.text = data.apartment;
      }
    }
  }

  var isShop = false.obs;
  //TODO: Implement AddAddressController
  final http = Get.find<HttpService>();
  final RoundedLoadingButtonController btnController =
      new RoundedLoadingButtonController();
  var loading = false.obs;
//Create Add Request
  void submit(context, {c0, c1, c2, c3, c4, c5, c6}) async {
    // if (loading.value == true) {
    //   showDialog(
    //     context: context,
    //     builder: (context) => Center(
    //       child: SpinKitRing(
    //         color: AppColors.primaryColor,
    //         size: 50,
    //       ),
    //     ),
    //   );
    // }
    if (Get.arguments != null && Get.arguments['isedit'] == true) {
      Addresses data = Get.arguments['data'];
      http.postUrl('ClientAddress/Edit', {
        'id': data.id,
        'address': c0,
        'section': c1,
        'subSection': c2,
        'street': c3,
        'building': c4,
        'floor': c5,
        'apartment': c6
      }).then((response) {
        // Get.back();
        try {
          // Get.back();
          // // print(response.data.toString());
          // var token = response.data['access_token'];
          // print('');
          // updateUserData(result['token'], result['data'][0]);
          // http.setApiToken(token);

          //  Get.offNamed('/home');
          Future.delayed(Duration(milliseconds: 10), () {
            Fluttertoast.showToast(
                msg: 'addressSaved'.tr,
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.TOP,
                timeInSecForIosWeb: 0,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.0);
          });
          btnController.success();
          Future.delayed(
              Duration(milliseconds: 0), () => btnController.reset());
          if (Get.arguments != null) {
            if (Get.arguments['isProfile'] == true) {
              Future.delayed(
                  Duration(milliseconds: 0),
                  () => Get.offAndToNamed('/my-profile',
                      arguments: {'isShop': false}));
            } else {
              Future.delayed(
                  Duration(milliseconds: 0),
                  () => Get.offAndToNamed('/address-payment',
                      arguments: {'isShop': isShop.value}));
            }
          }
          loading.value = false;
        } catch (e) {
          btnController.error();
          Future.delayed(
              Duration(milliseconds: 1200), () => btnController.reset());
          loading.value = false;
          // print("Exepition with Login : ${e}");
        }
      }).catchError((onError) {
        btnController.error();
        Future.delayed(
            Duration(milliseconds: 1200), () => btnController.reset());
        loading.value = false;
        // print(onError);
        Fluttertoast.showToast(
            msg: onError.response.data.toString(),
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 0,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      });
    } else {
      http.postUrl('ClientAddress/Add', {
        'address': c0,
        'section': c1,
        'subSection': c2,
        'street': c3,
        'building': c4,
        'floor': c5,
        'apartment': c6
      }).then((response) {
        // print(response.data);
        // Get.back();
        try {
          // Get.back();
          // // print(response.data.toString());
          // var token = response.data['access_token'];
          // print('');
          // updateUserData(result['token'], result['data'][0]);
          // http.setApiToken(token);

          //  Get.offNamed('/home');
          Future.delayed(Duration(milliseconds: 10), () {
            Fluttertoast.showToast(
                msg: 'addressAdded'.tr,
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.TOP,
                timeInSecForIosWeb: 0,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.0);
          });
          btnController.success();
          Future.delayed(
              Duration(milliseconds: 600), () => btnController.reset());
          if (Get.arguments != null) {
            if (Get.arguments['isProfile'] == true) {
              Future.delayed(
                  Duration(milliseconds: 600),
                  () => Get.offAndToNamed('/my-profile',
                      arguments: {'isShop': false}));
            } else {
              Future.delayed(
                  Duration(milliseconds: 600),
                  () => Get.offAndToNamed('/address-payment',
                      arguments: {'isShop': isShop.value}));
            }
          }
          loading.value = false;
        } catch (e) {
          btnController.error();
          Future.delayed(
              Duration(milliseconds: 1200), () => btnController.reset());
          loading.value = false;
          // print("Exepition with Login : ${e}");
        }
      }).catchError((onError) {
        btnController.error();
        Future.delayed(
            Duration(milliseconds: 1200), () => btnController.reset());
        loading.value = false;
        // print(onError);
        Fluttertoast.showToast(
            msg: onError.response.data.toString(),
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 0,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      });
    }
  }

  final count = 0.obs;
  @override
  void onInit() {
    isShop.value = Get.arguments != null ? Get.arguments['isShop'] : false;
    oninit();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    controller0.clear();
    controller1.clear();
    controller2.clear();
    controller3.clear();
    controller4.clear();
    controller5.clear();
    controller6.clear();
  }

  void increment() => count.value++;
}
