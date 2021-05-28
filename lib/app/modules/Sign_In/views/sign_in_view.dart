import 'package:autoservice/app/Colors.dart';
import 'package:autoservice/app/modules/Sign_Up/views/sign_up_view.dart';
import 'package:autoservice/app/widgets/inputs/LoginInput.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:autoservice/app/modules/Sign_In/controllers/sign_in_controller.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class SignInView extends GetView<SignInController> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroud,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0.0,
      ),
      body: Form(
        key: _formKey,
        child: Container(
          child: Stack(
            children: [
              Positioned(
                top: 1,
                right: 0,
                left: 0,
                child: Container(
                  height: height * 0.4495,
                  color: AppColors.primaryColor,
                ),
              ),
              Positioned(
                top: height * 0.23,
                right: 0,
                left: 0,
                child: AnimationLimiter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: AnimationConfiguration.toStaggeredList(
                      duration: const Duration(milliseconds: 500),
                      childAnimationBuilder: (widget) => SlideAnimation(
                        horizontalOffset: MediaQuery.of(context).size.width,
                        child: SlideAnimation(child: widget),
                      ),
                      children: [
                        Container(
                          padding: EdgeInsets.all(20),
                          margin: EdgeInsets.only(right: 15, left: 15),
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.shadowColor,
                                  blurRadius: 20,
                                  offset: Offset(0, 10),
                                ),
                              ],
                              color: AppColors.whiteColor,
                              borderRadius: BorderRadius.circular(18)),
                          child: SingleChildScrollView(
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'greetings'.tr,
                                    textScaleFactor: 1,
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Cairo',
                                        color: AppColors.primaryColor),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 20),
                                    child: Text(
                                      'please_login'.tr,
                                      textScaleFactor: 1,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Cairo',
                                          color: AppColors.primaryColor),
                                    ),
                                  ),
                                  // Spacer(),
                                  Text(
                                    'mobile_number'.tr,
                                    textScaleFactor: 1,
                                    style: TextStyle(
                                        fontSize: 21,
                                        fontWeight: FontWeight.w300,
                                        fontFamily: 'Cairo',
                                        color: AppColors.primaryColor),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Obx(() => InternationalPhoneNumberInput(
                                              inputDecoration: InputDecoration(
                                                  // border: OutlineInputBorder(
                                                  //   borderRadius: const BorderRadius.all(
                                                  //     Radius.circular(5.0),
                                                  //   ),

                                                  // ),
                                                  border: InputBorder.none,
                                                  focusedBorder:
                                                      InputBorder.none,
                                                  enabledBorder:
                                                      InputBorder.none,
                                                  errorBorder: InputBorder.none,
                                                  disabledBorder:
                                                      InputBorder.none,
                                                  filled: true,
                                                  fillColor:
                                                      AppColors.whiteColor,
                                                  // errorText: errorText,
                                                  // labelText: label,
                                                  labelStyle: TextStyle(
                                                    color:
                                                        AppColors.secondaryText,
                                                    fontFamily: "Poppins",
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 12,
                                                  ),
                                                  // prefixIcon: ClipOval(child: Image.asset(image)),
                                                  // icon != null ? Icon(icon, color: Colors.blue) : null,
                                                  contentPadding:
                                                      EdgeInsets.all(10)),
                                              searchBoxDecoration: InputDecoration(
                                                  // border: OutlineInputBorder(
                                                  //   borderRadius: const BorderRadius.all(
                                                  //     Radius.circular(5.0),
                                                  //   ),

                                                  // ),
                                                  border: InputBorder.none,
                                                  focusedBorder: InputBorder.none,
                                                  enabledBorder: InputBorder.none,
                                                  errorBorder: InputBorder.none,
                                                  disabledBorder: InputBorder.none,
                                                  filled: true,
                                                  fillColor: AppColors.whiteColor,
                                                  // errorText: errorText,
                                                  // labelText: label,

                                                  labelStyle: TextStyle(
                                                    color:
                                                        AppColors.secondaryText,
                                                    fontFamily: "Poppins",
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 12,
                                                  ),
                                                  // prefixIcon: ClipOval(child: Image.asset(image)),
                                                  // icon != null ? Icon(icon, color: Colors.blue) : null,
                                                  contentPadding: EdgeInsets.all(10)),
                                              onInputChanged:
                                                  (PhoneNumber number) {
                                                // // print(number.phoneNumber);
                                                controller.number.value =
                                                    number;

                                                // // controller.setConuntryCode(
                                                //     number.dialCode);
                                                // // print(number.dialCode);
                                              },
                                              onInputValidated: (bool value) {
                                                controller.isvalid.value =
                                                    value;
                                                print(
                                                    "Mobile number valid ..$value");
                                              },
                                              selectorConfig: SelectorConfig(
                                                selectorType:
                                                    PhoneInputSelectorType
                                                        .BOTTOM_SHEET,
                                              ),
                                              ignoreBlank: false,
                                              locale: 'ar',
                                              autoValidateMode:
                                                  AutovalidateMode.disabled,
                                              selectorTextStyle: TextStyle(
                                                  color: Colors.black),
                                              initialValue:
                                                  controller.number.value,
                                              textFieldController:
                                                  controller.countryCode,
                                              formatInput: false,
                                              keyboardType: TextInputType
                                                  .numberWithOptions(
                                                      signed: true,
                                                      decimal: true),
                                              inputBorder: OutlineInputBorder(),
                                              onSaved: (PhoneNumber number) {
                                                // print('On Saved: $number');
                                              },
                                              validator: (value) {
                                                if (controller.isvalid.value ==
                                                    false) {
                                                  return 'enter_mobile_validate'
                                                      .tr;
                                                }
                                                // if (value.isEmpty) {
                                                //   return 'enter_mobile_validate'
                                                //       .tr;
                                                // }
                                                // if (value.length < 9 ||
                                                //     value.length > 12) {
                                                //   return 'invalid_phone_range'
                                                //       .tr;
                                                // }
                                              },
                                            )),

                                        // ProfileInput(
                                        //   lines: 1,
                                        //   controller: mobileController,
                                        //   label: 'enter_mobile_number',
                                        //   type: TextInputType.number,
                                        //   secure: false,
                                        //   //   icon: Icons.access_alarm,
                                        //   //    image: 'assets/images/noun_Lock_821908.png',
                                        //   // validator: (value) {
                                        //   //   if (value.isEmpty) {
                                        //   //     return 'Please enter  ';
                                        //   //   }
                                        //   // }
                                        // ),
                                        Container(
                                          height: 1,
                                          color:
                                              Color.fromRGBO(233, 233, 233, 1),
                                        )
                                      ],
                                    ),
                                  ),

                                  SizedBox(
                                    height: 25,
                                  ),

                                  RoundedLoadingButton(
                                    color: AppColors.primaryColor,
                                    child: Text(
                                      'login'.tr,
                                      textScaleFactor: 1,
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Cairo',
                                          color: AppColors.whiteColor),
                                    ),
                                    controller: controller.btnController,
                                    onPressed: () {
                                      final FormState form =
                                          _formKey.currentState;
                                      // print(form.validate());
                                      if (form.validate()) {
                                        controller.submit();
                                      } else {
                                        controller.btnController.error();
                                        Future.delayed(
                                            Duration(milliseconds: 1200),
                                            () => controller.btnController
                                                .reset());
                                      }
                                      // Get.to(HomeScreenView());
                                      // Navigator.of(context)
                                      //     .pushNamed(HomeScreen.routeName); // Submit
                                    },
                                  ),

                                  SizedBox(height: 15)
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        InkWell(
                          onTap: () {
                            // Navigator.of(context)
                            //     .pushNamed(SignUpScreen.routeName);
                            //  Get.to(SignUpView());
                            Get.offNamed('/sign-up');
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'dont_have_Account'.tr,
                                textScaleFactor: 1,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w200,
                                    fontFamily: 'Cairo',
                                    color: AppColors.primaryColor),
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Text(
                                'signUp_Now'.tr,
                                textScaleFactor: 1,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w200,
                                    fontFamily: 'Cairo',
                                    color: AppColors.primaryColor),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        InkWell(
                          onTap: () {
                            Get.offAllNamed('/home-screen');
                          },
                          child: Center(
                            child: Text(
                              'skip'.tr,
                              textScaleFactor: 1,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Cairo',
                                  color: AppColors.primaryColor),
                            ),
                          ),
                        ),
                      ],
                    ),
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
