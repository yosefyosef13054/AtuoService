import 'package:autoservice/app/Colors.dart';
import 'package:autoservice/app/modules/HomeScreen/views/home_screen_view.dart';
import 'package:autoservice/app/modules/drawer_menu/model.dart';
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

class SignInController extends GetxController {
  //TODO: Implement SignInController
  final http = Get.find<HttpService>();
  final RoundedLoadingButtonController btnController =
      new RoundedLoadingButtonController();
  var locked = true.obs;
  var isvalid = false.obs;

  Profile userData;
  // String simCountryCode;
  // String allowsVOIP;
  // String carrierName;
  // String isoCountryCode;
  // String mobileCountryCode;
  // String mobileNetworkCode;
//get  sim  code
  String simCountryCode;
  // void getsimCode() async {
  //   allowsVOIP = await SimInfo.getAllowsVOIP;
  //   carrierName = await SimInfo.getCarrierName;
  //   isoCountryCode = await SimInfo.getIsoCountryCode;
  //   mobileCountryCode = await SimInfo.getMobileCountryCode;
  //   mobileNetworkCode = await SimInfo.getMobileNetworkCode;
  //   // print(mobileCountryCode);
  // }
  void getsimCode() async {
    simCountryCode = await FlutterSimCountryCode.simCountryCode;
    number.value = PhoneNumber(isoCode: simCountryCode);
    // // print(simCountryCode.);
    // number.value.dialCode = simCountryCode;
  }

//get  sim  code
  var loading = false.obs;
  // TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController countryCode = TextEditingController();
  // String simCountryCode;
  Rx<PhoneNumber> number = PhoneNumber(isoCode: '').obs;
  //var countrychoosenCode = ''.obs;

  // void setConuntryCode(value) {
  //   countrychoosenCode.value = value;
  // }

  void submit() async {
    // print(number.value.dialCode); // country code
    // print(number.value.parseNumber()); // phone number without country code
    // print(number.value.phoneNumber); // complete phone number with country code

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

    http
        .postUrl(
            'Client/Login',
            {
              'countryCode': number.value.dialCode,
              'phone': number.value.parseNumber()
              // 'phone': number.value.phoneNumber
              //     .toString()
              //     .substring(number.value.dialCode.length),
            },
            true)
        .then((response) {
      // Get.back();
      try {
        // Get.back();
        print(response.data.toString());
        //String token = response.data['access_token'].toString();
        // print(token);
        // updateUserData(result['token'], result['data'][0]);
        // http.setApiToken(token);
        // removed earlyer
        // userData = Profile.fromJson(response.data);
        // print("userData setted..");
        // removed earlyer

        //  Get.offNamed('/home');

        Future.delayed(
            Duration(milliseconds: 1200), () => btnController.reset());
        print(response.data['userPassword']);
        if (response.data['ErrorMessage'] == null) {
          btnController.success();
          Future.delayed(
              Duration(milliseconds: 800),
              () => Get.to(() => OtpView(
                    password: response.data['userPassword'],
                    mobileNumber: number.value.phoneNumber.toString(),
                    countryCode: number.value.dialCode,
                    isLoginRedirect: true,
                    submit: () {
                      print("Count was selected.");
                    },
                  )));
        } else {
          btnController.error();
          Fluttertoast.showToast(
              msg: 'validationError'.tr,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.TOP,
              timeInSecForIosWeb: 0,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }

        loading.value = false;
      } catch (e) {
        btnController.error();
        print(e);
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

  final count = 0.obs;
  @override
  void onInit() {
    getsimCode();

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
