import 'package:autoservice/app/Colors.dart';
import 'package:autoservice/app/modules/HomeScreen/views/home_screen_view.dart';
import 'package:autoservice/app/widgets/inputs/LoginInput.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:autoservice/app/modules/Sign_Up/controllers/sign_up_controller.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class SignUpView extends GetView<SignUpController> {
  var controller = Get.put<SignUpController>(SignUpController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,

      backgroundColor: AppColors.scaffoldBackgroud,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0.0,
      ),
      // appBar: AppBar(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            height: height * 1.15,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    height: height * 0.4495,
                    color: AppColors.primaryColor,
                  ),
                ),
                Positioned(
                  top: height * 0.2,
                  right: 0,
                  left: 0,
                  child: AnimationLimiter(
                    child: SingleChildScrollView(
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
                                          vertical: 5, horizontal: 20),
                                      child: Text(
                                        'sign_Up'.tr,
                                        textScaleFactor: 1,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Cairo',
                                            color: AppColors.primaryColor),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'name'.tr,
                                            textScaleFactor: 1,
                                            style: TextStyle(
                                                fontSize: 21,
                                                fontWeight: FontWeight.w300,
                                                fontFamily: 'Cairo',
                                                color: AppColors.primaryColor),
                                          ),
                                          //
                                          ProfileInput(
                                              lines: 1,
                                              controller:
                                                  controller.nameController1,
                                              label: 'enter_name'.tr,
                                              type: TextInputType.text,
                                              secure: false,
                                              icon: Icons.access_alarm,
                                              image:
                                                  'assets/images/noun_Lock_821908.png',
                                              validator: (value) {
                                                if (value.isEmpty) {
                                                  return 'enter_name'.tr;
                                                }
                                              }),
                                          Container(
                                            height: 1,
                                            color: Color.fromRGBO(
                                                233, 233, 233, 1),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
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
                                                Obx(() =>
                                                    InternationalPhoneNumberInput(
                                                      inputDecoration:
                                                          InputDecoration(
                                                              // border: OutlineInputBorder(
                                                              //   borderRadius: const BorderRadius.all(
                                                              //     Radius.circular(5.0),
                                                              //   ),

                                                              // ),
                                                              border:
                                                                  InputBorder
                                                                      .none,
                                                              focusedBorder:
                                                                  InputBorder
                                                                      .none,
                                                              enabledBorder:
                                                                  InputBorder
                                                                      .none,
                                                              errorBorder:
                                                                  InputBorder
                                                                      .none,
                                                              disabledBorder:
                                                                  InputBorder
                                                                      .none,
                                                              filled: true,
                                                              fillColor: AppColors
                                                                  .whiteColor,
                                                              // errorText: errorText,
                                                              // labelText: label,
                                                              labelStyle:
                                                                  TextStyle(
                                                                color: AppColors
                                                                    .secondaryText,
                                                                fontFamily:
                                                                    "Poppins",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 12,
                                                              ),
                                                              // prefixIcon: ClipOval(child: Image.asset(image)),
                                                              // icon != null ? Icon(icon, color: Colors.blue) : null,
                                                              contentPadding:
                                                                  EdgeInsets
                                                                      .all(10)),
                                                      searchBoxDecoration:
                                                          InputDecoration(
                                                              // border: OutlineInputBorder(
                                                              //   borderRadius: const BorderRadius.all(
                                                              //     Radius.circular(5.0),
                                                              //   ),

                                                              // ),
                                                              border:
                                                                  InputBorder
                                                                      .none,
                                                              focusedBorder:
                                                                  InputBorder
                                                                      .none,
                                                              enabledBorder:
                                                                  InputBorder
                                                                      .none,
                                                              errorBorder:
                                                                  InputBorder
                                                                      .none,
                                                              disabledBorder:
                                                                  InputBorder
                                                                      .none,
                                                              filled: true,
                                                              fillColor: AppColors
                                                                  .whiteColor,
                                                              // errorText: errorText,
                                                              // labelText: label,

                                                              labelStyle:
                                                                  TextStyle(
                                                                color: AppColors
                                                                    .secondaryText,
                                                                fontFamily:
                                                                    "Poppins",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 12,
                                                              ),
                                                              // prefixIcon: ClipOval(child: Image.asset(image)),
                                                              // icon != null ? Icon(icon, color: Colors.blue) : null,
                                                              contentPadding:
                                                                  EdgeInsets
                                                                      .all(10)),
                                                      onInputChanged:
                                                          (PhoneNumber number) {
                                                        // // print(number.phoneNumber);
                                                        controller.number1
                                                            .value = number;

                                                        // // controller.setConuntryCode(
                                                        //     number.dialCode);
                                                        // // print(number.dialCode);
                                                      },
                                                      onInputValidated:
                                                          (bool value) {
                                                        controller.isvalid
                                                            .value = value;
                                                        // print(value);
                                                      },
                                                      selectorConfig:
                                                          SelectorConfig(
                                                        selectorType:
                                                            PhoneInputSelectorType
                                                                .BOTTOM_SHEET,
                                                      ),
                                                      ignoreBlank: false,
                                                      locale: 'ar',
                                                      autoValidateMode:
                                                          AutovalidateMode
                                                              .disabled,
                                                      selectorTextStyle:
                                                          TextStyle(
                                                              color:
                                                                  Colors.black),
                                                      initialValue: controller
                                                          .number1.value,
                                                      textFieldController:
                                                          controller
                                                              .countryCode1,
                                                      formatInput: false,
                                                      keyboardType: TextInputType
                                                          .numberWithOptions(
                                                              signed: true,
                                                              decimal: true),
                                                      inputBorder:
                                                          OutlineInputBorder(),
                                                      onSaved:
                                                          (PhoneNumber number) {
                                                        print(
                                                            'On Saved: $number');
                                                      },
                                                      validator: (value) {
                                                        // if (value.isEmpty) {
                                                        //   return 'enter_mobile_validate'
                                                        //       .tr;
                                                        // }
                                                        if (controller.isvalid
                                                                .value ==
                                                            false) {
                                                          return 'enter_mobile_validate'
                                                              .tr;
                                                        }
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
                                                  color: Color.fromRGBO(
                                                      233, 233, 233, 1),
                                                )
                                              ],
                                            ),
                                          ),
                                          Container(
                                            height: 1,
                                            color: Color.fromRGBO(
                                                233, 233, 233, 1),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    SizedBox(
                                      height: 25,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    RoundedLoadingButton(
                                      color: AppColors.primaryColor,
                                      child: Text(
                                        'submit'.tr,
                                        textScaleFactor: 1,
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w200,
                                            fontFamily: 'Cairo',
                                            color: AppColors.whiteColor),
                                      ),
                                      controller: controller.btnController,
                                      onPressed: () {
                                        final FormState form =
                                            _formKey.currentState;

                                        if (form.validate()) {
                                          controller.submit1(context);
                                        } else {
                                          controller.btnController.error();
                                          Future.delayed(
                                              Duration(milliseconds: 1200), () {
                                            controller.btnController.reset();
                                          });
                                        }
                                        // Get.to(HomeScreenView());
                                        // Navigator.of(context)
                                        //     .pushNamed(HomeScreen.routeName); // Submit
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height * .025,
                            ),
                            InkWell(
                              onTap: () {
                                //   Navigator.of(context)
                                //       .pushNamed(SignInScreen.routeName);
                                Get.offNamed('/sign-in');
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'have_Account'.tr,
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
                                    'login'.tr,
                                    textScaleFactor: 1,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w200,
                                        fontFamily: 'Cairo',
                                        color: AppColors.primaryColor),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: height * .025,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
