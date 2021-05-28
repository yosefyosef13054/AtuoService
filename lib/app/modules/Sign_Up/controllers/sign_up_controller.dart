import 'package:get/get.dart';
import 'package:autoservice/app/Colors.dart';
import 'package:autoservice/app/modules/HomeScreen/views/home_screen_view.dart';
import 'package:autoservice/app/modules/Sign_In/views/sign_in_view.dart';

import 'package:autoservice/app/widgets/MyAlertDialog.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:convert';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:flutter/material.dart';
import '../../../services/httpService.dart';
import 'package:flutter_sim_country_code/flutter_sim_country_code.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:autoservice/app/modules/otp/views/otp_view.dart';

class SignUpController extends GetxController {
  //TODO: Implement SignUpController
  var locked = true.obs;
  var isvalid = false.obs;

  final http1 = Get.find<HttpService>();
  final RoundedLoadingButtonController btnController =
      new RoundedLoadingButtonController();
  TextEditingController nameController1 = TextEditingController();
  var loading1 = false.obs;
  // TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController1 = TextEditingController();
  TextEditingController countryCode1 = TextEditingController();

  // String simCountryCode1;
  var number1 = PhoneNumber(isoCode: '').obs;
  var countrychoosenCode1 = ''.obs;
  void setConuntryCode(value) {
    countrychoosenCode1.value = value;
  }

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
    number1.value = PhoneNumber(isoCode: simCountryCode);
    // // print(simCountryCode.);
    // number.value.dialCode = simCountryCode;
  }

//get  sim  code
  void submit1(context) async {
    FocusScope.of(context).requestFocus(new FocusNode());
    loading1.value = true;

    http1
        .postUrl(
            'Client/Register',
            {
              'clientName': nameController1.text.toString(),
              // 'phone': countryCode1.value.text,
              // 'userPassword': passwordController1.text,
              'countryCode': number1.value.dialCode,
              'phone': number1.value.parseNumber()

              // 'phone': number1.value.phoneNumber
              //     .toString()
              //     .substring(number1.value.dialCode.length),
            },
            true)
        .then((response) {
      // Get.back();
      try {
        if (response.data['ErrorMessage'] != null) {
          btnController.error();
          Fluttertoast.showToast(
              msg: 'account_exist'.tr,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.TOP,
              timeInSecForIosWeb: 0,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
          Future.delayed(Duration(milliseconds: 800), () {
            btnController.reset();
          });
        } else {
          btnController.success();
          Future.delayed(
              Duration(milliseconds: 1200), () => btnController.reset());
          // Fluttertoast.showToast(
          //     msg: 'account_created'.tr,
          //     toastLength: Toast.LENGTH_LONG,
          //     gravity: ToastGravity.TOP,
          //     timeInSecForIosWeb: 0,
          //     backgroundColor: Colors.green,
          //     textColor: Colors.white,
          //     fontSize: 16.0);
          // print(response.data);
          Future.delayed(
              Duration(milliseconds: 800),
              () => Get.offAll(() => OtpView(
                    password: response.data['userPassword'],
                    mobileNumber: number1.value.phoneNumber.toString(),
                    countryCode: number1.value.dialCode,
                    isLoginRedirect: false,
                  )));
        }
        // var token = response.data['access_token'];

        // updateUserData(result['token'], result['data'][0]);
        // http.setApiToken(token);

        //  Get.offNamed('/home');

        loading1.value = false;
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
          msg: 'validationError'.tr,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 0,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      // showDialog(
      //   context: context,
      //   builder: (BuildContext context) {
      //     // .data['errors'].toString()
      //     return SucsessDialog(
      //         label: onError.response.data['error_description'].toString(),
      //         error: true);
      //   },
      // );
      //Get.back();
// onError.response['error_description']
      // print('Login error ${onError.response}');
    });
  }

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
}
