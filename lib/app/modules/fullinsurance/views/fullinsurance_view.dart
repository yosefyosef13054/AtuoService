import 'package:autoservice/app/widgets/forms/FirstTimeInsuranceForm.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:autoservice/app/modules/fullinsurance/controllers/fullinsurance_controller.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:autoservice/app/Colors.dart';

class FullinsuranceView extends GetView<FullinsuranceController> {
  TextEditingController controller1 = TextEditingController();
  final FullinsuranceController controller = Get.put(FullinsuranceController());
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    // var auto_bloc = Provider.of<MethodsProvider>(context);
    // bool page = true;
    String selecteditem1;
    String selecteditem2;
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroud,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        title: Text(
          'التأمين الشامل',
          textScaleFactor: 1,
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              fontFamily: 'Cairo',
              color: AppColors.whiteColor),
        ),
        elevation: 0.0,
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              top: 1,
              right: 0,
              left: 0,
              child: Container(
                height: height,
                color: AppColors.primaryColor,
              ),
            ),
            Positioned(
              top: height * 0.05,
              right: 0,
              left: 0,
              child: SizedBox(
                height: height * 0.9,
                child: SingleChildScrollView(
                  child: AnimationLimiter(
                      child: Obx(
                    () => Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: AnimationConfiguration.toStaggeredList(
                        duration: const Duration(milliseconds: 600),
                        childAnimationBuilder: (widget) => SlideAnimation(
                          horizontalOffset:
                              MediaQuery.of(context).size.width / 1,
                          child: SlideAnimation(child: widget),
                        ),
                        children: [
                          SizedBox(
                            height: height * 0.05,
                          ),
                          // Center(
                          //   child:
                          // ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Container(
                            width: width * .9,
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                                color: AppColors.whiteColor,
                                borderRadius: BorderRadius.circular(7)),
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 15),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        'assets/images/icons/Ta2min/Ta3min(2).png',
                                        height: 20,
                                        width: 20,
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        'هل لديك وثيقة تأمين سابقة ؟',
                                        textScaleFactor: 1,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Cairo',
                                            color: AppColors.primaryColor),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          controller.changePage(true);
                                          // auto_bloc.setPaper(true);
                                        },
                                        child: Container(
                                          width: width * 0.25,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color:
                                                      AppColors.primaryColor),
                                              color:
                                                  controller.page.value == true
                                                      ? AppColors.primaryColor
                                                      : Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: 5, horizontal: 2),
                                            child: Center(
                                              child: Text(
                                                'أمتلك وثيقة',
                                                textScaleFactor: 1,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: 'Cairo',
                                                    color: controller
                                                                .page.value ==
                                                            true
                                                        ? AppColors.whiteColor
                                                        : AppColors
                                                            .primaryColor),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          controller.changePage(false);
                                          // auto_bloc.setPaper(false);
                                        },
                                        child: Container(
                                          width: width * 0.25,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color:
                                                      AppColors.primaryColor),
                                              color:
                                                  controller.page.value == false
                                                      ? AppColors.primaryColor
                                                      : Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: 5, horizontal: 2),
                                            child: Center(
                                              child: Text(
                                                'أول مرة',
                                                textScaleFactor: 1,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: 'Cairo',
                                                    color: controller
                                                                .page.value ==
                                                            false
                                                        ? AppColors.whiteColor
                                                        : AppColors
                                                            .primaryColor),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          controller.page.value == false
                              ? FirstTimeForm(
                                  width: width,
                                  selecteditem1: selecteditem1,
                                  controller1: controller1)
                              : Container(
                                  width: width * .9,
                                  padding: EdgeInsets.all(10),
                                  margin: EdgeInsets.only(top: 10, bottom: 30),
                                  decoration: BoxDecoration(
                                    color: AppColors.whiteColor,
                                    borderRadius: BorderRadius.circular(7),
                                  ),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Image.asset(
                                              'assets/images/icons/Ta2min/Ta3min(2).png',
                                              height: 20,
                                              width: 20,
                                            ),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Flexible(
                                              child: Text(
                                                'أرفق صورة الوثيقة السابقة',
                                                textScaleFactor: 1,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: 'Cairo',
                                                    color:
                                                        AppColors.primaryColor),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Center(
                                              child: Container(
                                                width: width * .81,
                                                padding: EdgeInsets.all(10),
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 5),
                                                decoration: BoxDecoration(
                                                  color: Color.fromRGBO(
                                                      233, 236, 242, 1),
                                                  borderRadius:
                                                      BorderRadius.circular(7),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Container(
                                                          width: width * .22,
                                                          height: height * 0.1,
                                                          padding:
                                                              EdgeInsets.all(
                                                                  10),
                                                          margin: EdgeInsets
                                                              .symmetric(
                                                                  vertical: 5),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        0),
                                                          ),
                                                          child: Center(
                                                            child:
                                                                Icon(Icons.add),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ]),
                                ),
                        ],
                      ),
                    ),
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: height * .11,
        width: width,
        color: AppColors.primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 1,
              color: Colors.white,
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Center(
                    child: Text(
                      'ارسل الطلب',
                      textScaleFactor: 1,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'GE_SS_Two_Light',
                          color: AppColors.whiteColor),
                    ),
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.whiteColor),
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(15)),
                  height: 40,
                  width: width * 0.4,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
