import 'package:autoservice/app/modules/scrap_garages/views/scrap_garages_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:autoservice/app/modules/scrap_request2/controllers/scrap_request2_controller.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:autoservice/app/Colors.dart';

class ScrapRequest2View extends GetView<ScrapRequest2Controller> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroud,
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'طلب قطع سكراب',
          textScaleFactor: 1,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              fontFamily: 'Cairo',
              color: AppColors.whiteColor),
        ),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(),
        child: SingleChildScrollView(
          child: AnimationLimiter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: AnimationConfiguration.toStaggeredList(
                duration: const Duration(milliseconds: 600),
                childAnimationBuilder: (widget) => SlideAnimation(
                  horizontalOffset: MediaQuery.of(context).size.width / 1,
                  child: SlideAnimation(child: widget),
                ),
                children: [
                  Center(
                    child: Container(
                        width: width * .9,
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Column(children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/icons/Ta2min/Ta3min(1).png',
                                height: 20,
                                width: 20,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                'صنع السيارة',
                                textScaleFactor: 1,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Cairo',
                                    color: Colors.black),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: width * 0.25,
                                decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    borderRadius: BorderRadius.circular(8)),
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: 6, horizontal: 5),
                                  child: Center(
                                    child: Text(
                                      'آسيوي',
                                      textScaleFactor: 1,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Cairo',
                                          color: AppColors.whiteColor),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: width * 0.25,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColors.primaryColor),
                                    color: AppColors.whiteColor,
                                    borderRadius: BorderRadius.circular(8)),
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: 6, horizontal: 5),
                                  child: Center(
                                    child: Text(
                                      'أمريكي',
                                      textScaleFactor: 1,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Cairo',
                                          color: AppColors.primaryColor),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: width * 0.25,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColors.primaryColor),
                                    color: AppColors.whiteColor,
                                    borderRadius: BorderRadius.circular(8)),
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: 6, horizontal: 5),
                                  child: Center(
                                    child: Text(
                                      'أوروبي',
                                      textScaleFactor: 1,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Cairo',
                                          color: AppColors.primaryColor),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ])),
                  ),
                  Center(
                    child: Container(
                      width: width * .9,
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.symmetric(vertical: 2),
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'النوع',
                                  textScaleFactor: 1,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Cairo',
                                      color: Colors.black),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: 120,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColors.primaryColor),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.all(10),
                                        child: new DropdownButton<String>(
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14),
                                          value: 'اختر',
                                          items: <String>['A', 'اختر', 'C', 'D']
                                              .map((String value) {
                                            return new DropdownMenuItem<String>(
                                              value: value,
                                              child: Center(
                                                child: new Text(
                                                  value,
                                                  textScaleFactor: 1,
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily: 'Cairo',
                                                      color: AppColors
                                                          .primaryColor),
                                                ),
                                              ),
                                            );
                                          }).toList(),
                                          onChanged: (value) {
                                            // setState(() {
                                            //   selecteditem1 = value;
                                            // });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  'الموديل',
                                  textScaleFactor: 1,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Cairo',
                                      color: Colors.black),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 40,
                                  width: 120,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColors.primaryColor),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.all(10),
                                        child: new DropdownButton<String>(
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14),
                                          value: 'اختر',
                                          items: <String>['A', 'اختر', 'C', 'D']
                                              .map((String value) {
                                            return new DropdownMenuItem<String>(
                                              value: value,
                                              child: Center(
                                                child: new Text(
                                                  value,
                                                  textScaleFactor: 1,
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily: 'Cairo',
                                                      color: AppColors
                                                          .primaryColor),
                                                ),
                                              ),
                                            );
                                          }).toList(),
                                          onChanged: (value) {
                                            // setState(() {
                                            //   selecteditem1 = value;
                                            // });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/icons/Ta2min/Ta3min(7).png',
                              height: 20,
                              width: 20,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              'سنة الصنع',
                              textScaleFactor: 1,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Cairo',
                                  color: Colors.black),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: 33,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 8,
                            itemBuilder: (context, index) {
                              return Container(
                                width: 60,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 1),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColors.primaryColor),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Center(
                                  child: Container(
                                    child: Text(
                                      '2019',
                                      textScaleFactor: 1,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Cairo',
                                          color: Colors.black),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ]),
                    ),
                  ),
                  Center(
                    child: Container(
                      width: width * .9,
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Container(
                        // margin: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Text(
                              'تسطيع رفع صورة القطعة وستتقدم كراجات السكراب بتقديم عروضها',
                              textScaleFactor: 1,
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Cairo',
                                  color: Colors.black),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: AppColors.primaryColor,
                                      borderRadius: BorderRadius.circular(25)),
                                  child: Container(
                                      margin: EdgeInsets.all(10),
                                      child: Icon(
                                        Icons.mic,
                                        size: 22,
                                        color: Colors.white,
                                      )),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: AppColors.primaryColor,
                                      borderRadius: BorderRadius.circular(25)),
                                  child: Container(
                                      margin: EdgeInsets.all(10),
                                      child: Icon(
                                        Icons.camera_alt,
                                        size: 22,
                                        color: Colors.white,
                                      )),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Image.asset(
                              'assets/images/2.jpeg',
                              height: 100,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/1.jpeg',
                                  height: 100,
                                ),
                                Image.asset(
                                  'assets/images/1.jpeg',
                                  height: 100,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(ScrapGaragesView());
                      // Navigator.pushNamed(
                      //     context, ScrapGaragesScreen.routeName);
                    },
                    child: Center(
                      child: Container(
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
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: height * .15,
        width: width,
        color: AppColors.primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 1,
              color: Colors.white,
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Center(
                    child: Container(
                      child: Text(
                        'طلبات السكراب السابقة',
                        textScaleFactor: 1,
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Cairo',
                            color: AppColors.whiteColor),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.whiteColor),
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(15)),
                  height: 40,
                  width: width * 0.6,
                ),
              ],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
