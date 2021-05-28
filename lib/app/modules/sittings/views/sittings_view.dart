import 'package:autoservice/app/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/sittings_controller.dart';

class SittingsView extends GetView<SittingsController> {
  @override
  Widget build(BuildContext context) {
    List items = [
      ['Kuwait'.tr, 'assets/images/kw.png'],
      ['SaudiArabia'.tr, 'assets/images/sa.png'],
      ['Qatar'.tr, 'assets/images/qa.png']
    ];
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var format = DateFormat('yMd');
    final locale = Get.locale;
    return Scaffold(
      backgroundColor: Color.fromRGBO(239, 244, 255, 1),
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0.0,
        centerTitle: true,
        toolbarHeight: 75,
        title: Text(
          'edit'.tr,
          textScaleFactor: 1,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              fontFamily: 'Cairo',
              color: AppColors.whiteColor),
        ),
      ),
      body: Form(
        child: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              SingleChildScrollView(
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
                            height: 15,
                          ),
                          Center(
                            child: Container(
                              width: width * .9,
                              padding: EdgeInsets.all(15),
                              margin: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 10),
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.shadowColor,
                                      blurRadius: 20,
                                      offset: Offset(0, 3),
                                    ),
                                  ],
                                  color: AppColors.whiteColor,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 21,
                                        width: 21,
                                        child: Icon(
                                          Icons.language,
                                          color: AppColors.primaryColor,
                                        ),
                                      ),
                                      // Icon(Icons.language),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'lang'.tr,
                                        textScaleFactor: 1,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'Cairo',
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Get.updateLocale(Locale('en'));
                                          },
                                          child: Row(
                                            children: [
                                              locale == Locale('en')
                                                  ? Icon(
                                                      Icons.circle,
                                                      color:
                                                          locale == Locale('en')
                                                              ? AppColors
                                                                  .primaryColor
                                                              : Colors.grey,
                                                    )
                                                  : Container(
                                                      height: 21,
                                                      width: 21,
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: AppColors
                                                                  .primaryColor,
                                                              width: 1),
                                                          color: AppColors
                                                              .whiteColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      30)),
                                                    ),
                                              SizedBox(
                                                width: 8,
                                              ),
                                              Text(
                                                'English',
                                                textScaleFactor: 1,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily: 'Cairo',
                                                    color: Colors.black),
                                              ),
                                            ],
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Get.updateLocale(Locale('ar'));
                                          },
                                          child: Row(
                                            children: [
                                              locale == Locale('ar')
                                                  ? Icon(
                                                      Icons.circle,
                                                      color:
                                                          locale == Locale('ar')
                                                              ? AppColors
                                                                  .primaryColor
                                                              : Colors.grey,
                                                    )
                                                  : Container(
                                                      height: 21,
                                                      width: 21,
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: AppColors
                                                                  .primaryColor,
                                                              width: 1),
                                                          color: AppColors
                                                              .whiteColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      30)),
                                                    ),
                                              SizedBox(
                                                width: 8,
                                              ),
                                              Text(
                                                'العربية',
                                                textScaleFactor: 1,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily: 'Cairo',
                                                    color: Colors.black),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ])
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          Center(
                            child: Container(
                              width: width * .9,
                              padding: EdgeInsets.all(15),
                              margin: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 10),
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.shadowColor,
                                      blurRadius: 20,
                                      offset: Offset(0, 3),
                                    ),
                                  ],
                                  color: AppColors.whiteColor,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 21,
                                        width: 21,
                                        child: Image.asset(
                                          'assets/images/icons/Menu/Language.png',
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      //    Icon(Icons.language),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'country'.tr,
                                        textScaleFactor: 1,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'Cairo',
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      itemCount: items.length,
                                      padding: const EdgeInsets.all(12),
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: () {
                                            //   Get.updateLocale(Locale('ar'));
                                          },
                                          child: Row(
                                            children: [
                                              Container(
                                                height: 21,
                                                width: 21,
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 5),
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: AppColors
                                                            .primaryColor,
                                                        width: 1),
                                                    color: AppColors.whiteColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30)),
                                              ),
                                              SizedBox(
                                                width: 8,
                                              ),
                                              Column(
                                                children: [
                                                  SizedBox(
                                                    height: 8,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Container(
                                                            child: Image.asset(
                                                              items[index][1],
                                                              height: 50,
                                                              width: 60,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 8,
                                                          ),
                                                          Text(
                                                            items[index][0],
                                                            textScaleFactor: 1,
                                                            style: TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontFamily:
                                                                    'Cairo',
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        );
                                      })
                                ],
                              ),
                            ),
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
    );
  }
}
