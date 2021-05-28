import 'package:autoservice/app/Colors.dart';
import 'package:autoservice/app/modules/HomeScreen/views/home_screen_view.dart';
import 'package:autoservice/app/modules/otp/views/otp_view.dart';
import 'package:autoservice/app/services/helper.dart';
import 'package:autoservice/app/widgets/MyAlertDialog.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:flutter_sim_country_code/flutter_sim_country_code.dart';

import 'package:flutter/material.dart';
import 'package:autoservice/app/services/auth.dart' as auth;
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import '../../../services/httpService.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:autoservice/services/notification_service.dart';
import 'package:autoservice/services/socket_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:autoservice/app/modules/HomeScreen/controllers/home_screen_controller.dart';

class OtpController extends GetxController {
  //TODO: Implement OtpController
  // final HomeScreenController homecontroller = Get.put(HomeScreenController());

  final http = Get.find<HttpService>();
  FocusNode myFocusNode = FocusNode();
  var endtime = 0.obs;
  TextEditingController textEditingController = TextEditingController();
  final RoundedLoadingButtonController btnController =
      new RoundedLoadingButtonController();
  TextEditingController detailsController = TextEditingController();
  // final RoundedLoadingButtonController btnController =
  //     new RoundedLoadingButtonController();
  final count = 0.obs;
  var loading = false.obs;
  var token = ''.obs;
  void submit(context, number, countryCode, otpCode) async {
    loading.value = true;
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
    final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
    String pushToken;
    pushToken = await _firebaseMessaging.getToken();

    var fcmToken = NotificationsService().setupNotifications();
    print(pushToken);
    await http
        .postUrl(
            'token',
            {
              'countryCode': countryCode,
              // number.value.parseNumber(),
              'userName': number,
              'grant_type': 'password',
              'password': otpCode,
              'uid': 'client',
              'fcmToken': pushToken
            },
            true)
        .then((response) async {
      // print(response);
      // Get.back();
      try {
        // Get.back();
        // print(response.data.toString());
        token.value = response.data['access_token'].toString();
        textEditingController.clear();
        // homecontroller.havetoken();
        print('the toooooooooooken');
        print(token.value);
        print('the toooooooooooken');
        // homecontroller.token.value = response.data['access_token'].toString();

        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token.value);
        await http.setApiToken(token.value);
        await http.init();

        // btnController.success();
        Future.delayed(Duration(milliseconds: 10), () {
          Fluttertoast.showToast(
              msg: "logged_in".tr,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.TOP,
              timeInSecForIosWeb: 0,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);
        });
        Get.offAllNamed('/home-screen', arguments: {'token': token.value});
        loading.value = false;
      } catch (e) {
        print(e);
      }
    }).catchError((onError) {
      Fluttertoast.showToast(
          msg: 'codeError'.tr,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 0,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      //Get.back();
// onError.response['error_description']
      // print('Login error ${onError.response.data}');
    });
  }

  var resendPassword = ''.obs;
  void resendCode(number, countryCode) async {
    endtime.value = DateTime.now().millisecondsSinceEpoch + 1000 * 60;
    loading.value = true;

    http
        .postUrl(
            'Client/Login', {'countryCode': countryCode, 'phone': number}, true)
        .then((response) {
      resendPassword.value = response.data['userPassword'];
      // Get.back();
      try {
        // Get.back();
        print(response.data.toString());

        Fluttertoast.showToast(
            msg: 'otpsent'.tr,
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 0,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);

        btnController.success();
        Future.delayed(
            Duration(milliseconds: 1200), () => btnController.reset());
        loading.value = false;
      } catch (e) {
        btnController.error();

        Future.delayed(
            Duration(milliseconds: 1200), () => btnController.reset());

        // print("Exepition with Login : ${e}");
      }
    }).catchError((onError) {
      btnController.error();
      Future.delayed(Duration(milliseconds: 1200), () => btnController.reset());

      // Navigator.pop(context);
      // showDialog(
      //   context: context,
      //   builder: (BuildContext context) {
      //     // .data['errors'].toString()
      //     return SucsessDialog(
      //         label: onError.response.data['error_description'].toString(),
      //         error: true);
      //   },
      // );
      // برجاء التأكد من رقم الموبايل أو تسجيل مستخدم جديد
      Fluttertoast.showToast(
          msg: 'validationError'.tr,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 0,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      //Get.back();
// onError.response['error_description']
      // print('Login error ${onError.response.data['error_description']}');
    });
  }

  @override
  void onInit() {
    super.onInit();
    myFocusNode = FocusNode();
    myFocusNode.reactive;
    textEditingController.reactive;
    endtime.value = DateTime.now().millisecondsSinceEpoch + 1000 * 60;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    // textEditingController.dispose();
    // myFocusNode.dispose();
  }

  void increment() => count.value++;
}
