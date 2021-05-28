import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:autoservice/app/modules/fullinsurance_offers_details/controllers/fullinsurance_offers_details_controller.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:autoservice/app/Colors.dart';

class FullinsuranceOffersDetailsView
    extends GetView<FullinsuranceOffersDetailsController> {
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
                height: height,
                child: SingleChildScrollView(
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
                          SizedBox(
                            height: height * 0.07,
                          ),
                          Center(
                            child: Column(
                              children: [
                                Text(
                                  'الشركة الوطنية - تكافلي',
                                  textScaleFactor: 1,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Cairo',
                                      color: AppColors.whiteColor),
                                ),
                                SingleChildScrollView(
                                  child: AnimationLimiter(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: AnimationConfiguration
                                          .toStaggeredList(
                                        duration:
                                            const Duration(milliseconds: 600),
                                        childAnimationBuilder: (widget) =>
                                            SlideAnimation(
                                          horizontalOffset:
                                              MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  1,
                                          child: SlideAnimation(child: widget),
                                        ),
                                        children: [
                                          SizedBox(
                                            height: height * .05,
                                          ),
                                          Container(
                                            child: Container(
                                              // height: height * .139,

                                              width: width * .9,
                                              decoration: BoxDecoration(
                                                  color: AppColors.whiteColor,
                                                  borderRadius:
                                                      BorderRadius.circular(7)),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  SizedBox(
                                                    height: 25,
                                                  ),
                                                  Center(
                                                    child: Text(
                                                      'تفاصيل الطلب',
                                                      textScaleFactor: 1,
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontFamily: 'Cairo',
                                                          color: AppColors
                                                              .primaryColor),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 15,
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.all(12),
                                                    child: Row(
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              'اسم شركة التأمين : ',
                                                              textScaleFactor:
                                                                  1,
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontFamily:
                                                                      'Cairo',
                                                                  color: AppColors
                                                                      .primaryColor),
                                                            ),
                                                            Text(
                                                              'العنوان : ',
                                                              textScaleFactor:
                                                                  1,
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontFamily:
                                                                      'Cairo',
                                                                  color: AppColors
                                                                      .primaryColor),
                                                            ),
                                                            Text(
                                                              'نوع السيارة : ',
                                                              textScaleFactor:
                                                                  1,
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontFamily:
                                                                      'Cairo',
                                                                  color: AppColors
                                                                      .primaryColor),
                                                            ),
                                                            Text(
                                                              'موديل السيارة : ',
                                                              textScaleFactor:
                                                                  1,
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontFamily:
                                                                      'Cairo',
                                                                  color: AppColors
                                                                      .primaryColor),
                                                            ),
                                                            Text(
                                                              'سنة الصنع : ',
                                                              textScaleFactor:
                                                                  1,
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontFamily:
                                                                      'Cairo',
                                                                  color: AppColors
                                                                      .primaryColor),
                                                            ),
                                                            Text(
                                                              'عدد أيام السيارة البديلة : ',
                                                              textScaleFactor:
                                                                  1,
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontFamily:
                                                                      'Cairo',
                                                                  color: AppColors
                                                                      .primaryColor),
                                                            ),
                                                          ],
                                                        ),
                                                        Spacer(),
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              'الوطنية - التكافلي',
                                                              textScaleFactor:
                                                                  1,
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontFamily:
                                                                      'Cairo',
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                            Text(
                                                              'المرقاب',
                                                              textScaleFactor:
                                                                  1,
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontFamily:
                                                                      'Cairo',
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                            Text(
                                                              'تويوتا',
                                                              textScaleFactor:
                                                                  1,
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontFamily:
                                                                      'Cairo',
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                            Text(
                                                              'لاند كروزر',
                                                              textScaleFactor:
                                                                  1,
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontFamily:
                                                                      'Cairo',
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                            Text(
                                                              '2019',
                                                              textScaleFactor:
                                                                  1,
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontFamily:
                                                                      'Cairo',
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                            Text(
                                                              '10',
                                                              textScaleFactor:
                                                                  1,
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontFamily:
                                                                      'Cairo',
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    height: 2,
                                                    color:
                                                        AppColors.primaryColor,
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.all(12),
                                                    child: Column(
                                                      children: [
                                                        SizedBox(
                                                          height: 4,
                                                        ),
                                                        Text(
                                                          'خدمات إضافية',
                                                          textScaleFactor: 1,
                                                          style: TextStyle(
                                                              fontSize: 17,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontFamily:
                                                                  'Cairo',
                                                              color: AppColors
                                                                  .primaryColor),
                                                        ),
                                                        SizedBox(
                                                          height: 12,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Text(
                                                              'عدم حق الرجوع',
                                                              textScaleFactor:
                                                                  1,
                                                              style: TextStyle(
                                                                  fontSize: 17,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontFamily:
                                                                      'Cairo',
                                                                  color: AppColors
                                                                      .primaryColor),
                                                            ),
                                                            Spacer(),
                                                            Text(
                                                              ' 1   د.ك ',
                                                              textScaleFactor:
                                                                  1,
                                                              style: TextStyle(
                                                                  fontSize: 17,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontFamily:
                                                                      'Cairo',
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                            Spacer(),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 15,
                                                  ),
                                                  Container(
                                                    height: 2,
                                                    color:
                                                        AppColors.primaryColor,
                                                  ),
                                                  SizedBox(
                                                    height: 15,
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.all(12),
                                                    child: Text(
                                                      'تصليح داخل كراج الوكالة تصليح خارج كراج الوكالة بدون تحمل تكلفة فتح الملف بدون تحمل استهلاك على قطع الغيار والأجور تبديل الزجاج الأمامي أول مرة داخل الوكالة تغطية التواير والرنجات والأريال ( ) في الحادث المعلوم و ( ) في الحادث المجهول',
                                                      textScaleFactor: 1,
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontFamily: 'Cairo',
                                                          color: AppColors
                                                              .primaryColor),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 15,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  height: 2,
                                  color: AppColors.whiteColor,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 18,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  height: 40,
                                  width: width * 0.4,
                                  child: Center(
                                    child: Text(
                                      'تأكيد الطلب',
                                      textScaleFactor: 1,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Cairo',
                                          color: AppColors.whiteColor),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      border: Border.all(
                                          color: AppColors.whiteColor,
                                          width: 1),
                                      // color:
                                      //     Color.fromRGBO(239, 244, 255, 1),
                                      borderRadius: BorderRadius.circular(15))),
                              Column(
                                children: [
                                  Text(
                                    'الإجمالي',
                                    textScaleFactor: 1,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Cairo',
                                        color: AppColors.whiteColor),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        ' 170 ',
                                        textScaleFactor: 1,
                                        style: TextStyle(
                                            fontSize: 23,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Cairo',
                                            color: AppColors.whiteColor),
                                      ),
                                      Text(
                                        ' د.ك ',
                                        textScaleFactor: 1,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Cairo',
                                            color: AppColors.whiteColor),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
