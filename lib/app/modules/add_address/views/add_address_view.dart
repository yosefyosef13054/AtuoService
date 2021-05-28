import 'package:autoservice/app/widgets/inputs/AddressInput.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:autoservice/app/modules/add_address/controllers/add_address_controller.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:autoservice/app/Colors.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class AddAddressView extends GetView<AddAddressController> {
  AddAddressView({this.isEdit});
  bool isEdit;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    List items = [
      ['وصف العنوان', controller.controller0],
      ['القطعة', controller.controller1],
      ['الجادة', controller.controller2],
      ['الشارع', controller.controller3],
      ['المبنى', controller.controller4],
      ['الطابق', controller.controller5],
      ['الشقة', controller.controller6],
    ];
    return WillPopScope(
      onWillPop: () async {
        var value = true;

        if (Get.arguments['isProfile'] == true) {
          Get.offAndToNamed('/my-profile', arguments: {'isShop': false});
          return value;
        } else {
          Get.offAndToNamed('/address-payment',
              arguments: {'isShop': controller.isShop.value});
          return value;
        }
      },
      child: Scaffold(
        backgroundColor:
            // Color.fromRGBO(255, 255, 255, 1),
            AppColors.scaffoldBackgroud,
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          // toolbarHeight: 20,
          title: Text(
            'اضف عنوان جديد',
            textScaleFactor: 1,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                fontFamily: 'Cairo',
                color: AppColors.whiteColor),
          ),
          elevation: 0.0, centerTitle: true,
        ),
        body: Form(
          key: _formKey,
          child: Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(color: AppColors.scaffoldBackgroud),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Container(
                  //   height: height * .06,
                  //   width: width,
                  //   color: AppColors.primaryColor,
                  //   child: Column(
                  //     children: [
                  //       Spacer(
                  //         flex: 1,
                  //       ),
                  //       Row(
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         children: [
                  //           // Container(
                  //           //   margin: EdgeInsets.only(bottom: 15),
                  //           //   child: Text(
                  //           //     'العنوان و الدفع',
                  //           //     textScaleFactor: 1,
                  //  style: TextStyle(
                  //           //         fontSize: 20,
                  //           //         fontWeight: FontWeight.w500,
                  //           //         fontFamily: 'Cairo',
                  //           //         color: AppColors.whiteColor),
                  //           //   ),
                  //           // ),
                  //         ],
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // SizedBox(height: 15),
                  SingleChildScrollView(
                    child: AnimationLimiter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: AnimationConfiguration.toStaggeredList(
                          duration: const Duration(milliseconds: 600),
                          childAnimationBuilder: (widget) => SlideAnimation(
                            horizontalOffset:
                                MediaQuery.of(context).size.width / 1,
                            child: SlideAnimation(child: widget),
                          ),
                          children: [
                            ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: items.length,
                              padding: const EdgeInsets.all(12),
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: EdgeInsets.only(top: 8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        items[index][0],
                                        textScaleFactor: 1,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Cairo',
                                            color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      AddressInput(
                                          lines: 1,
                                          controller: items[index][1],
                                          label: '',
                                          type: TextInputType.text,
                                          secure: false,
                                          //   icon: Icons.access_alarm,
                                          //    image: 'assets/images/noun_Lock_821908.png',
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'required'.tr;
                                            }
                                          }),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: height * .11,
          width: width,
          color: AppColors.primaryColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: width * 0.5,
                    decoration: BoxDecoration(
                        // border: Border.all(color: AppColors.whiteColor),
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(15)),
                    child: RoundedLoadingButton(
                      borderRadius: 15,
                      color: AppColors.primaryColor,
                      child: Text(
                        'add'.tr,
                        textScaleFactor: 1,
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Cairo',
                            color: AppColors.whiteColor),
                      ),
                      controller: controller.btnController,
                      onPressed: () {
                        final FormState form = _formKey.currentState;
                        // print(form.validate());
                        if (form.validate()) {
                          controller.submit(
                            context,
                            c0: items[0][1].text,
                            c1: items[1][1].text,
                            c2: items[2][1].text,
                            c3: items[3][1].text,
                            c4: items[4][1].text,
                            c5: items[5][1].text,
                            c6: items[6][1].text,
                          );
                        } else {
                          controller.btnController.error();
                          Future.delayed(Duration(milliseconds: 1200),
                              () => controller.btnController.reset());
                          // controller.btnController.error();
                          // Future.delayed(
                          //     Duration(milliseconds: 1200), () {
                          //   controller.btnController.reset();
                          // });
                        }
                        // Get.to(HomeScreenView());
                        // Navigator.of(context)
                        //     .pushNamed(HomeScreen.routeName); // Submit
                      },
                    ),
                  )
                  // Container(
                  //   child: Center(
                  //     child: Text(
                  //       'add'.tr,
                  //       textScaleFactor: 1,
                  //    style: TextStyle(
                  //           fontSize: 16,
                  //           fontWeight: FontWeight.w500,
                  //           fontFamily: 'Cairo',
                  //           color: AppColors.whiteColor),
                  //     ),
                  //   ),
                  //   decoration: BoxDecoration(
                  //       border: Border.all(color: AppColors.whiteColor),
                  //       color: AppColors.primaryColor,
                  //       borderRadius: BorderRadius.circular(15)),
                  //   height: 40,
                  //   width: width * 0.4,
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
