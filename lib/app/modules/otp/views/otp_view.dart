import 'dart:async';

import 'package:autoservice/app/Colors.dart';
import 'package:autoservice/app/modules/HomeScreen/views/home_screen_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:autoservice/app/modules/otp/controllers/otp_controller.dart';
import './otpInput.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:autoservice/app/modules/Sign_In/controllers/sign_in_controller.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

class OtpView extends GetView<OtpController> {
  OtpView(
      {Key key,
      this.submit,
      @required this.mobileNumber,
      this.pageNumber,
      this.password,
      this.countryCode,
      this.isLoginRedirect = false});
  final VoidCallback submit;

  bool isLoginRedirect;

  var countryCode;
  final String mobileNumber;
  String password;
  var checkPassword = ''.obs;

  int pageNumber;
  PinDecoration _pinDecoration =
      UnderlineDecoration(enteredColor: Colors.black, hintText: '....');
  TextEditingController _pinEditingController = TextEditingController();
  // StreamController<ErrorAnimationType> errorController =
  //     StreamController<ErrorAnimationType>();
  final OtpController controller = Get.put(OtpController());

  @override
  Widget build(BuildContext context) {
    // print(password);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: height * 0.05,
              ),
              Text(
                'confirmNumber'.tr,
                textScaleFactor: 1,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Cairo',
                    color: AppColors.whiteColor),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: Column(
                    children: [
                      Text(
                        'enterOtp'.tr,
                        textScaleFactor: 1,
                        style: TextStyle(
                            locale: Locale('en'),
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Cairo',
                            color: AppColors.whiteColor),
                      ),
                      Text(
                        mobileNumber.toString(),
                        textScaleFactor: 1,
                        style: TextStyle(
                            locale: Locale('en'),
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Cairo',
                            color: AppColors.whiteColor),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Directionality(
                textDirection: TextDirection.ltr,
                child: PinCodeTextField(
                  autoFocus: true,
                  focusNode: controller.myFocusNode,
                  appContext: context,
                  length: 4,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                      shape: PinCodeFieldShape.circle,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: width * .15,
                      fieldWidth: width * .15,
                      selectedFillColor: AppColors.primaryColor,
                      activeFillColor: Colors.white,
                      inactiveColor: Colors.white,
                      inactiveFillColor: Colors.white,
                      activeColor: Colors.white),
                  animationDuration: Duration(milliseconds: 300),
                  backgroundColor: AppColors.primaryColor,
                  enableActiveFill: true,

                  // pinTheme: PinTheme(
                  //   shape: PinCodeFieldShape.box,
                  //   borderRadius: BorderRadius.circular(5),
                  //   fieldHeight: 50,
                  //   fieldWidth: 40,
                  //   activeFillColor: Colors.white,
                  // ),
                  keyboardType: TextInputType.number,
                  // errorAnimationController: errorController,
                  controller: controller.textEditingController,
                  onCompleted: (v) {
                    // checkPassword.value = password;

                    // print("Completed");
                    //   context, number, countryCode, otpCode)
                    // // print(v);
                    if (controller.resendPassword.value == '') {
                      if (password == v) {
                        // print('the code is right ');

                        controller.submit(
                            context,
                            mobileNumber.substring(countryCode.length),
                            countryCode,
                            v);
                      } else {
                        // print('not the code');
                        Fluttertoast.showToast(
                            msg: 'codeError'.tr,
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.TOP,
                            timeInSecForIosWeb: 0,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      }
                    } else {
                      if (controller.resendPassword.value == v) {
                        // print('the code is right ');

                        controller.submit(
                            context,
                            mobileNumber.substring(countryCode.length),
                            countryCode,
                            v);
                      } else {
                        // print('not the code');
                        Fluttertoast.showToast(
                            msg: 'codeError'.tr,
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.TOP,
                            timeInSecForIosWeb: 0,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      }
                    }

                    // Get.offAll(HomeScreenView());
                  },
                  onChanged: (value) {
                    // print(value);
                    // setState(() {
                    //   currentText = value;
                    // });
                  },
                  // beforeTextPaste: (text) {
                  //   // print("Allowing to paste $text");
                  //   //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                  //   //but you can show anything you want here, like your pop up saying wrong paste format or etc
                  //   return true;
                  // },
                ),
              ),
              Obx(
                () => controller.endtime.value == 0
                    ? InkWell(
                        onTap: () {
                          controller.resendCode(
                              mobileNumber.substring(countryCode.length),
                              countryCode);
                          controller.textEditingController.clear();
                          controller.myFocusNode = FocusNode();
                          controller.myFocusNode.reactive;
                        },
                        child: Center(
                          child: CountdownTimer(
                            widgetBuilder: (_, time) {
                              return Text(
                                'scondTimernow'.tr,
                                textScaleFactor: 1,
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Cairo',
                                    color: AppColors.whiteColor),
                              );
                            },
                            onEnd: () {
                              controller.endtime.value = 0;
                            },
                            textStyle: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Cairo',
                                color: AppColors.whiteColor),
                            endTime: controller.endtime.value,
                          ),
                        ),
                      )
                    : Center(
                        child: CountdownTimer(
                          widgetBuilder: (_, time) {
                            return Text(
                              'scondTimerText'.tr +
                                  ' ' +
                                  time.sec.toString() +
                                  ' ' +
                                  'scond'.tr,
                              textScaleFactor: 1,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Cairo',
                                  color: AppColors.whiteColor),
                            );
                          },
                          onEnd: () {
                            controller.endtime.value = 0;
                          },
                          textStyle: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Cairo',
                              color: AppColors.whiteColor),
                          endTime: controller.endtime.value,
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
