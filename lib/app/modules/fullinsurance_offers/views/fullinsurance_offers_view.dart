import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:autoservice/app/modules/fullinsurance_offers/controllers/fullinsurance_offers_controller.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:autoservice/app/Colors.dart';

class FullinsuranceOffersView extends GetView<FullinsuranceOffersController> {
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
                                  'عروض سعر وثيقة',
                                  textScaleFactor: 1,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Cairo',
                                      color: AppColors.whiteColor),
                                ),
                                Text(
                                  '   التأمين الشامل',
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
                                            height: height * .1,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                margin:
                                                    EdgeInsets.only(bottom: 15),
                                                child: Text(
                                                  'اختر الشركة المناسبة',
                                                  textScaleFactor: 1,
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily: 'Cairo',
                                                      color:
                                                          AppColors.whiteColor),
                                                ),
                                              ),
                                            ],
                                          ),
                                          ListView.builder(
                                            scrollDirection: Axis.vertical,
                                            itemCount: 3,
                                            padding: const EdgeInsets.all(12),
                                            shrinkWrap: true,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            itemBuilder: (context, index) {
                                              return InkWell(
                                                  onTap: () {},
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                        bottom: 5),
                                                    child: Container(
                                                      height: height * .139,
                                                      width: width * .8,
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 5),
                                                      decoration: BoxDecoration(
                                                          color: AppColors
                                                              .whiteColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8)),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Spacer(),
                                                          Text(
                                                            'الشركة الوطنية - تكافلي',
                                                            textScaleFactor: 1,
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
                                                          Spacer(),
                                                          Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              Text(
                                                                'سعر الوثيقة / سنة',
                                                                textScaleFactor:
                                                                    1,
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontFamily:
                                                                        'Cairo',
                                                                    color: Colors
                                                                        .black),
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Text(
                                                                    '100',
                                                                    textScaleFactor:
                                                                        1,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            32,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w400,
                                                                        fontFamily:
                                                                            'Cairo',
                                                                        color: AppColors
                                                                            .primaryColor),
                                                                  ),
                                                                  Text(
                                                                    '    د.ك  ',
                                                                    textScaleFactor:
                                                                        1,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            14,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w400,
                                                                        fontFamily:
                                                                            'Cairo',
                                                                        color: Colors
                                                                            .black),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            width: 10,
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ));
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 18,
                          ),
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
