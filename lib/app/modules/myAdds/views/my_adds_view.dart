import 'package:flutter/material.dart';
import 'package:autoservice/app/modules/used_accessories_details/views/used_accessories_details_view.dart';
import 'package:autoservice/app/modules/scrap_car_details/views/scrap_car_details_view.dart';

import 'package:get/get.dart';
import 'package:autoservice/app/modules/myAdds/model.dart';

import '../controllers/my_adds_controller.dart';
import 'package:intl/intl.dart';
import 'package:autoservice/app/modules/adds/views/adds_view.dart';

import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:autoservice/app/Colors.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:autoservice/app/modules/car_detail/views/car_detail_view.dart';

import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:autoservice/app/widgets/inputs/LoginInput.dart';
import 'package:autoservice/app/modules/new_accessories/model.dart' as model;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';
import 'package:photo_view/photo_view.dart';
import 'package:autoservice/app/modules/used_accessories_details/views/widgets/galleryWidgetItem.dart';
import 'package:autoservice/app/modules/heavy_cars/views/heavy_cars_view.dart';

class MyAddsView extends GetView<MyAddsController> {
  @override
  Widget build(BuildContext context) {
    final double itemHeight = MediaQuery.of(context).size.height / 2;
    final double itemWidth = MediaQuery.of(context).size.width / 2;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var format = DateFormat('yMd');
    return Scaffold(
      backgroundColor: Colors.white,
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 90,
        backgroundColor: AppColors.primaryColor,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'my_adds'.tr,
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
                        horizontalOffset: MediaQuery.of(context).size.width / 1,
                        child: SlideAnimation(child: widget),
                      ),
                      children: [
                        //Navigation
                        Obx(
                          () => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () {
                                  controller.isAccessories.value = false;
                                  controller.isscrapCars.value = true;
                                  controller.isusedCars.value = false;
                                  controller.itrucks.value = false;
                                },
                                child: Text('اسكراب',
                                    textScaleFactor: 1,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Cairo',
                                        color:
                                            controller.isscrapCars.value == true
                                                ? AppColors.primaryColor
                                                : Colors.black)),
                              ),
                              InkWell(
                                onTap: () {
                                  controller.isAccessories.value = false;
                                  controller.isscrapCars.value = false;
                                  controller.isusedCars.value = true;
                                  controller.itrucks.value = false;
                                },
                                child: Text('سيارات ',
                                    textScaleFactor: 1,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Cairo',
                                        color:
                                            controller.isusedCars.value == true
                                                ? AppColors.primaryColor
                                                : Colors.black)),
                              ),
                              InkWell(
                                onTap: () {
                                  controller.isAccessories.value = false;
                                  controller.isscrapCars.value = false;
                                  controller.isusedCars.value = false;
                                  controller.itrucks.value = true;
                                },
                                child: Text('شاحنات ',
                                    textScaleFactor: 1,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Cairo',
                                        color: controller.itrucks.value == true
                                            ? AppColors.primaryColor
                                            : Colors.black)),
                              ),
                              InkWell(
                                onTap: () {
                                  controller.isAccessories.value = true;
                                  controller.isscrapCars.value = false;
                                  controller.isusedCars.value = false;
                                  controller.itrucks.value = false;
                                },
                                child: Text('اكسسوارات',
                                    textScaleFactor: 1,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Cairo',
                                        color: controller.isAccessories.value ==
                                                true
                                            ? AppColors.primaryColor
                                            : Colors.black)),
                              ),
                            ],
                          ),
                        ),

                        //navigation

//loader
                        Obx(() => controller.loading.value == true
                            ? UsedCarsShimmerList(height: height, width: width)
                            : Container()),
                        //loader
//Used Car
                        Obx(
                          () => controller.isusedCars.value == false
                              ? Container()
                              : Obx(() => controller.usedCarsList.length == 0
                                  ? Center(
                                      child: Column(
                                      children: [
                                        SizedBox(
                                          height: height * .1,
                                        ),
                                        Text('noAdds'.tr,
                                            textScaleFactor: 1,
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'Cairo',
                                                color: Colors.black)),
                                        SizedBox(
                                          height: height * .03,
                                        ),
                                        InkWell(
                                          onTap: () async {
                                            String token = "";
                                            SharedPreferences prefs =
                                                await SharedPreferences
                                                    .getInstance();
                                            token = prefs.getString("token");
                                            token == null
                                                ? Get.offNamed('/sign-in')
                                                : Get.off(AddsView());
                                            // Navigator.pushNamed(context, AddsScreen.routeName);
                                          },
                                          child: Container(
                                            child: Center(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text(
                                                    'Add_add'.tr,
                                                    textScaleFactor: 1,
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontFamily: 'Cairo',
                                                        color: AppColors
                                                            .primaryColor),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            height: 60,
                                            width: width * 0.54,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color:
                                                        AppColors.primaryColor),
                                                color: AppColors.whiteColor,
                                                borderRadius:
                                                    BorderRadius.circular(25)),
                                          ),
                                        ),
                                        SizedBox(
                                          height: height * .01,
                                        ),
                                        Container(
                                            margin: EdgeInsets.only(
                                                top: height * .06),
                                            child: Image.asset(
                                                'assets/images/Empty.png')),
                                      ],
                                    ))
                                  : ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      itemCount: controller.usedCarsList.length,
                                      padding: const EdgeInsets.all(12),
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: () {
                                            Get.to(CarDetailView(
                                                url: controller
                                                    .http.baseUrlForImages,
                                                item: controller
                                                    .usedCarsList[index]));
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(bottom: 5),
                                            child: Container(
                                              width: width * .85,
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 2.5),
                                              decoration: BoxDecoration(
                                                  // boxShadow: [
                                                  //   BoxShadow(
                                                  //     color: AppColors.shadowColor,
                                                  //     blurRadius: 20,
                                                  //     offset: Offset(0, 10),
                                                  //   ),
                                                  // ],
                                                  color: Color.fromRGBO(
                                                      239, 244, 255, 1),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          18)),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Container(
                                                        margin: EdgeInsets
                                                            .symmetric(
                                                          horizontal:
                                                              width * .12,
                                                        ),
                                                        child: Text(
                                                            controller
                                                                .usedCarsList[
                                                                    index]
                                                                .partNameAr
                                                                .toString(),
                                                            textScaleFactor: 1,
                                                            style: TextStyle(
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontFamily:
                                                                    'Cairo',
                                                                color: Colors
                                                                    .black)),
                                                      ),
                                                      IconButton(
                                                        onPressed: () {
                                                          controller.showremoveAddsDialog(
                                                              context,
                                                              id: controller
                                                                  .usedCarsList[
                                                                      index]
                                                                  .id,
                                                              type: controller
                                                                  .usedCarsList[
                                                                      index]
                                                                  .adType,
                                                              index: index);
                                                        },
                                                        icon: SvgPicture.asset(
                                                            'assets/images/ic_delete.svg',
                                                            color: Colors.red,
                                                            fit: BoxFit.cover,
                                                            width: 16,
                                                            height: 16,
                                                            semanticsLabel: ''),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        margin: EdgeInsets
                                                            .symmetric(
                                                                vertical: 10),
                                                        child: Row(
                                                          children: [
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            Container(
                                                              height: 40,
                                                              width:
                                                                  width * 0.14,
                                                              decoration: BoxDecoration(
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      color: AppColors
                                                                          .shadowColor,
                                                                      blurRadius:
                                                                          20,
                                                                      offset:
                                                                          Offset(
                                                                              0,
                                                                              10),
                                                                    ),
                                                                  ],
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          128,
                                                                          128,
                                                                          188,
                                                                          1),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10)),
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    'سنة الصنع',
                                                                    textScaleFactor:
                                                                        1,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            8,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w400,
                                                                        fontFamily:
                                                                            'Cairo',
                                                                        color: AppColors
                                                                            .whiteColor),
                                                                  ),
                                                                  Text(
                                                                    controller
                                                                        .usedCarsList[
                                                                            index]
                                                                        .carYearName
                                                                        .toString(),
                                                                    textScaleFactor:
                                                                        1,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontFamily:
                                                                            'Cairo',
                                                                        color: AppColors
                                                                            .whiteColor),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Container(
                                                              height: 40,
                                                              width:
                                                                  width * 0.14,
                                                              decoration: BoxDecoration(
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      color: AppColors
                                                                          .shadowColor,
                                                                      blurRadius:
                                                                          20,
                                                                      offset:
                                                                          Offset(
                                                                              0,
                                                                              10),
                                                                    ),
                                                                  ],
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          55,
                                                                          166,
                                                                          178,
                                                                          1),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10)),
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    'العداد/ كم',
                                                                    textScaleFactor:
                                                                        1,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            8,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w400,
                                                                        fontFamily:
                                                                            'Cairo',
                                                                        color: AppColors
                                                                            .whiteColor),
                                                                  ),
                                                                  Text(
                                                                    controller
                                                                        .usedCarsList[
                                                                            index]
                                                                        .kmCounter
                                                                        .toString(),
                                                                    textScaleFactor:
                                                                        1,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontFamily:
                                                                            'Cairo',
                                                                        color: AppColors
                                                                            .whiteColor),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Container(
                                                              height: 40,
                                                              width:
                                                                  width * 0.14,
                                                              decoration: BoxDecoration(
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      color: AppColors
                                                                          .shadowColor,
                                                                      blurRadius:
                                                                          20,
                                                                      offset:
                                                                          Offset(
                                                                              0,
                                                                              10),
                                                                    ),
                                                                  ],
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          200,
                                                                          142,
                                                                          116,
                                                                          1),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10)),
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    'السعر / د.ك',
                                                                    textScaleFactor:
                                                                        1,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            8,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w400,
                                                                        fontFamily:
                                                                            'Cairo',
                                                                        color: AppColors
                                                                            .whiteColor),
                                                                  ),
                                                                  Flexible(
                                                                    child: Text(
                                                                      controller
                                                                          .usedCarsList[
                                                                              index]
                                                                          .unitPrice
                                                                          .toString(),
                                                                      textScaleFactor:
                                                                          1,
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              13,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontFamily:
                                                                              'Cairo',
                                                                          color:
                                                                              AppColors.whiteColor),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Stack(
                                                              children: [
                                                                Container(
                                                                  margin: EdgeInsets
                                                                      .symmetric(
                                                                          horizontal:
                                                                              6),
                                                                  height:
                                                                      width *
                                                                          .26,
                                                                  width: width *
                                                                      0.4,
                                                                  decoration: BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10)),
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.all(
                                                                            Radius.circular(10)),
                                                                    child: Image
                                                                        .network(
                                                                      controller
                                                                              .http
                                                                              .baseUrlForImages +
                                                                          controller
                                                                              .usedCarsList[index]
                                                                              .images[0]
                                                                              .imageUrl
                                                                              .toString(),
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                ),
                                                                // Positioned(
                                                                //   top: 0,
                                                                //   left: 5,
                                                                //   child: IconButton(
                                                                //     onPressed: () {
                                                                //       // addressController
                                                                //       //     .removeAddress(
                                                                //       //         context,
                                                                //       //         addressController
                                                                //       //             .addresses[
                                                                //       //                 index]
                                                                //       //             .id);
                                                                //     },
                                                                //     icon: SvgPicture.asset(
                                                                //         'assets/images/ic_delete.svg',
                                                                //         color: Colors
                                                                //             .red,
                                                                //         fit: BoxFit
                                                                //             .cover,
                                                                //         width: 16,
                                                                //         height: 16,
                                                                //         semanticsLabel:
                                                                //             ''),
                                                                //   ),
                                                                //  ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    )),
                        ),
                        //Used Car

                        //Scrap Cars
                        Obx(
                          () => controller.isscrapCars.value == false
                              ? Container()
                              : Obx(
                                  () => controller.scrapCarsList.length == 0
                                      ? Center(
                                          child: Column(
                                          children: [
                                            SizedBox(
                                              height: height * .1,
                                            ),
                                            Text('noAdds'.tr,
                                                textScaleFactor: 1,
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: 'Cairo',
                                                    color: Colors.black)),
                                            SizedBox(
                                              height: height * .03,
                                            ),
                                            InkWell(
                                              onTap: () async {
                                                String token = "";
                                                SharedPreferences prefs =
                                                    await SharedPreferences
                                                        .getInstance();
                                                token =
                                                    prefs.getString("token");
                                                token == null
                                                    ? Get.offNamed('/sign-in')
                                                    : Get.off(AddsView());
                                              },
                                              child: Container(
                                                child: Center(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Text(
                                                        'Add_add'.tr,
                                                        textScaleFactor: 1,
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontFamily: 'Cairo',
                                                            color: AppColors
                                                                .primaryColor),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                height: 60,
                                                width: width * 0.54,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: AppColors
                                                            .primaryColor),
                                                    color: AppColors.whiteColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25)),
                                              ),
                                            ),
                                            SizedBox(
                                              height: height * .01,
                                            ),
                                            Container(
                                                margin: EdgeInsets.only(
                                                    top: height * .06),
                                                child: Image.asset(
                                                    'assets/images/Empty.png')),
                                          ],
                                        ))
                                      : ListView.builder(
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              controller.scrapCarsList.length,
                                          padding: const EdgeInsets.all(12),
                                          shrinkWrap: true,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          itemBuilder: (context, index) {
                                            return InkWell(
                                              onTap: () {
                                                Get.to(ScrapCarDetailsView(
                                                    url: controller
                                                        .http.baseUrlForImages,
                                                    item: controller
                                                        .scrapCarsList[index]));
                                              },
                                              child: Container(
                                                margin:
                                                    EdgeInsets.only(bottom: 5),
                                                child: Container(
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 2.5),
                                                  decoration: BoxDecoration(
                                                      // boxShadow: [
                                                      //   BoxShadow(
                                                      //     color: AppColors.shadowColor,
                                                      //     blurRadius: 20,
                                                      //     offset: Offset(0, 10),
                                                      //   ),
                                                      // ],
                                                      color: Color.fromRGBO(
                                                          239, 244, 255, 1),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              18)),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Container(
                                                            margin: EdgeInsets
                                                                .symmetric(
                                                              horizontal:
                                                                  width * .12,
                                                            ),
                                                            child: Text(
                                                                controller
                                                                    .scrapCarsList[
                                                                        index]
                                                                    .carTypeName
                                                                    .toString(),
                                                                textScaleFactor:
                                                                    1,
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        18,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontFamily:
                                                                        'Cairo',
                                                                    color: Colors
                                                                        .black)),
                                                          ),
                                                          IconButton(
                                                            onPressed: () {
                                                              controller.showremoveAddsDialog(
                                                                  context,
                                                                  id: controller
                                                                      .scrapCarsList[
                                                                          index]
                                                                      .id,
                                                                  type: controller
                                                                      .scrapCarsList[
                                                                          index]
                                                                      .adType,
                                                                  index: index);
                                                            },
                                                            icon: SvgPicture.asset(
                                                                'assets/images/ic_delete.svg',
                                                                color:
                                                                    Colors.red,
                                                                fit: BoxFit
                                                                    .cover,
                                                                width: 16,
                                                                height: 16,
                                                                semanticsLabel:
                                                                    ''),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                          Container(
                                                            height: 40,
                                                            width: width * 0.14,
                                                            decoration: BoxDecoration(
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    color: AppColors
                                                                        .shadowColor,
                                                                    blurRadius:
                                                                        20,
                                                                    offset:
                                                                        Offset(
                                                                            0,
                                                                            10),
                                                                  ),
                                                                ],
                                                                color: Color
                                                                    .fromRGBO(
                                                                        128,
                                                                        128,
                                                                        188,
                                                                        1),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10)),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  'سنة الصنع',
                                                                  textScaleFactor:
                                                                      1,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          8,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      fontFamily:
                                                                          'Cairo',
                                                                      color: AppColors
                                                                          .whiteColor),
                                                                ),
                                                                Flexible(
                                                                  child: Text(
                                                                    controller
                                                                        .scrapCarsList[
                                                                            index]
                                                                        .carYearName
                                                                        .toString(),
                                                                    textScaleFactor:
                                                                        1,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontFamily:
                                                                            'Cairo',
                                                                        color: AppColors
                                                                            .whiteColor),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 5,
                                                          ),
                                                          Container(
                                                            height: 40,
                                                            width: width * 0.14,
                                                            decoration: BoxDecoration(
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    color: AppColors
                                                                        .shadowColor,
                                                                    blurRadius:
                                                                        20,
                                                                    offset:
                                                                        Offset(
                                                                            0,
                                                                            10),
                                                                  ),
                                                                ],
                                                                color: Color
                                                                    .fromRGBO(
                                                                        200,
                                                                        142,
                                                                        116,
                                                                        1),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10)),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  'السعر / د.ك',
                                                                  textScaleFactor:
                                                                      1,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          8,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      fontFamily:
                                                                          'Cairo',
                                                                      color: AppColors
                                                                          .whiteColor),
                                                                ),
                                                                Flexible(
                                                                  child: Text(
                                                                    controller
                                                                        .scrapCarsList[
                                                                            index]
                                                                        .unitPrice
                                                                        .toString(),
                                                                    textScaleFactor:
                                                                        1,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontFamily:
                                                                            'Cairo',
                                                                        color: AppColors
                                                                            .whiteColor),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Spacer(),
                                                          Container(
                                                            margin: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        6,
                                                                    vertical:
                                                                        10),
                                                            height: width * .26,
                                                            width: width * 0.4,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10)),
                                                            child: ClipRRect(
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          10)),
                                                              child:
                                                                  Image.network(
                                                                controller.http
                                                                        .baseUrlForImages +
                                                                    controller
                                                                        .scrapCarsList[
                                                                            index]
                                                                        .images[
                                                                            0]
                                                                        .imageUrl
                                                                        .toString(),
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                ),
                        ),
                        //ScrapCARS

                        //Trucks
                        Obx(
                          () => controller.itrucks.value == false
                              ? Container()
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:
                                      AnimationConfiguration.toStaggeredList(
                                    duration: const Duration(milliseconds: 600),
                                    childAnimationBuilder: (widget) =>
                                        SlideAnimation(
                                      horizontalOffset:
                                          MediaQuery.of(context).size.width / 1,
                                      child: SlideAnimation(child: widget),
                                    ),
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Obx(
                                        () => controller.trucksList.length == 0
                                            ? Center(
                                                child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: height * .1,
                                                  ),
                                                  Text('noAdds'.tr,
                                                      textScaleFactor: 1,
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontFamily: 'Cairo',
                                                          color: Colors.black)),
                                                  SizedBox(
                                                    height: height * .03,
                                                  ),
                                                  InkWell(
                                                    onTap: () async {
                                                      String token = "";
                                                      SharedPreferences prefs =
                                                          await SharedPreferences
                                                              .getInstance();
                                                      token = prefs
                                                          .getString("token");
                                                      token == null
                                                          ? Get.offNamed(
                                                              '/sign-in')
                                                          : Get.off(AddsView());
                                                      // Navigator.pushNamed(context, AddsScreen.routeName);
                                                    },
                                                    child: Container(
                                                      child: Center(
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Text(
                                                              'Add_add'.tr,
                                                              textScaleFactor:
                                                                  1,
                                                              style: TextStyle(
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontFamily:
                                                                      'Cairo',
                                                                  color: AppColors
                                                                      .primaryColor),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      height: 60,
                                                      width: width * 0.54,
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: AppColors
                                                                  .primaryColor),
                                                          color: AppColors
                                                              .whiteColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      25)),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: height * .01,
                                                  ),
                                                  Container(
                                                      margin: EdgeInsets.only(
                                                          top: height * .06),
                                                      child: Image.asset(
                                                          'assets/images/Empty.png')),
                                                ],
                                              ))
                                            : ListView.builder(
                                                scrollDirection: Axis.vertical,
                                                itemCount: controller
                                                    .trucksList.length,
                                                padding:
                                                    const EdgeInsets.all(12),
                                                shrinkWrap: true,
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                itemBuilder: (context, index) {
                                                  return InkWell(
                                                    onTap: () {
                                                      Get.to(HeavyCarsView(
                                                          url: controller.http
                                                              .baseUrlForImages,
                                                          item: controller
                                                                  .trucksList[
                                                              index]));
                                                      // Navigator.pushNamed(
                                                      //     context, HeavyCarsScreen.routeName);
                                                    },
                                                    child: Container(
                                                      margin: EdgeInsets.only(
                                                          bottom: 5),
                                                      child: Container(
                                                        margin: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    2.5),
                                                        decoration:
                                                            BoxDecoration(
                                                                // boxShadow: [
                                                                //   BoxShadow(
                                                                //     color: AppColors.shadowColor,
                                                                //     blurRadius: 20,
                                                                //     offset: Offset(0, 10),
                                                                //   ),
                                                                // ],
                                                                color: Color
                                                                    .fromRGBO(
                                                                        239,
                                                                        244,
                                                                        255,
                                                                        1),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            18)),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Container(
                                                                  margin: EdgeInsets
                                                                      .symmetric(
                                                                    horizontal:
                                                                        width *
                                                                            .12,
                                                                  ),
                                                                  child: Text(
                                                                      controller
                                                                          .trucksList[
                                                                              index]
                                                                          .partName
                                                                          .toString(),
                                                                      textScaleFactor:
                                                                          1,
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              18,
                                                                          fontWeight: FontWeight
                                                                              .w400,
                                                                          fontFamily:
                                                                              'Cairo',
                                                                          color:
                                                                              Colors.black)),
                                                                ),
                                                                IconButton(
                                                                  onPressed:
                                                                      () {
                                                                    controller.showremoveAddsDialog(
                                                                        context,
                                                                        id: controller
                                                                            .trucksList[
                                                                                index]
                                                                            .id,
                                                                        type: controller
                                                                            .trucksList[
                                                                                index]
                                                                            .adType,
                                                                        index:
                                                                            index);
                                                                  },
                                                                  icon: SvgPicture.asset(
                                                                      'assets/images/ic_delete.svg',
                                                                      color: Colors
                                                                          .red,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                      width: 16,
                                                                      height:
                                                                          16,
                                                                      semanticsLabel:
                                                                          ''),
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              children: [
                                                                SizedBox(
                                                                  width: 10,
                                                                ),
                                                                Container(
                                                                  height: 40,
                                                                  width: width *
                                                                      0.14,
                                                                  decoration: BoxDecoration(
                                                                      boxShadow: [
                                                                        BoxShadow(
                                                                          color:
                                                                              AppColors.shadowColor,
                                                                          blurRadius:
                                                                              20,
                                                                          offset: Offset(
                                                                              0,
                                                                              10),
                                                                        ),
                                                                      ],
                                                                      color: Color.fromRGBO(
                                                                          128,
                                                                          128,
                                                                          188,
                                                                          1),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10)),
                                                                  child: Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Text(
                                                                        'سنة الصنع',
                                                                        textScaleFactor:
                                                                            1,
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                8,
                                                                            fontWeight: FontWeight
                                                                                .w400,
                                                                            fontFamily:
                                                                                'Cairo',
                                                                            color:
                                                                                AppColors.whiteColor),
                                                                      ),
                                                                      Flexible(
                                                                        child:
                                                                            Text(
                                                                          controller
                                                                              .trucksList[index]
                                                                              .carYearName
                                                                              .toString(),
                                                                          textScaleFactor:
                                                                              1,
                                                                          style: TextStyle(
                                                                              fontSize: 13,
                                                                              fontWeight: FontWeight.bold,
                                                                              fontFamily: 'Cairo',
                                                                              color: AppColors.whiteColor),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: 5,
                                                                ),
                                                                Container(
                                                                  height: 40,
                                                                  width: width *
                                                                      0.14,
                                                                  decoration: BoxDecoration(
                                                                      boxShadow: [
                                                                        BoxShadow(
                                                                          color:
                                                                              AppColors.shadowColor,
                                                                          blurRadius:
                                                                              20,
                                                                          offset: Offset(
                                                                              0,
                                                                              10),
                                                                        ),
                                                                      ],
                                                                      color: Color.fromRGBO(
                                                                          200,
                                                                          142,
                                                                          116,
                                                                          1),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10)),
                                                                  child: Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Text(
                                                                        'السعر / د.ك',
                                                                        textScaleFactor:
                                                                            1,
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                8,
                                                                            fontWeight: FontWeight
                                                                                .w400,
                                                                            fontFamily:
                                                                                'Cairo',
                                                                            color:
                                                                                AppColors.whiteColor),
                                                                      ),
                                                                      Flexible(
                                                                        child:
                                                                            Text(
                                                                          controller
                                                                              .trucksList[index]
                                                                              .unitPrice
                                                                              .toString(),
                                                                          textScaleFactor:
                                                                              1,
                                                                          style: TextStyle(
                                                                              fontSize: 13,
                                                                              fontWeight: FontWeight.bold,
                                                                              fontFamily: 'Cairo',
                                                                              color: AppColors.whiteColor),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Spacer(),
                                                                Container(
                                                                  margin: EdgeInsets
                                                                      .symmetric(
                                                                          horizontal:
                                                                              6,
                                                                          vertical:
                                                                              10),
                                                                  height:
                                                                      width *
                                                                          .26,
                                                                  width: width *
                                                                      0.4,
                                                                  decoration: BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10)),
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.all(
                                                                            Radius.circular(10)),
                                                                    child: Image
                                                                        .network(
                                                                      controller
                                                                              .http
                                                                              .baseUrlForImages +
                                                                          controller
                                                                              .trucksList[index]
                                                                              .images[0]
                                                                              .imageUrl
                                                                              .toString(),
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                      ),
                                    ],
                                  ),
                                ),
                        ),
                        //Trucks

                        //Accessories
                        Obx(() => controller.isAccessories.value == false
                            ? Container()
                            : Column(
                                children: [
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 15),
                                    child: controller.accessoriesList.length ==
                                            0
                                        ? Center(
                                            child: Column(
                                            children: [
                                              SizedBox(
                                                height: height * .1,
                                              ),
                                              Text('noAdds'.tr,
                                                  textScaleFactor: 1,
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily: 'Cairo',
                                                      color: Colors.black)),
                                              SizedBox(
                                                height: height * .03,
                                              ),
                                              InkWell(
                                                onTap: () async {
                                                  String token = "";
                                                  SharedPreferences prefs =
                                                      await SharedPreferences
                                                          .getInstance();
                                                  token =
                                                      prefs.getString("token");
                                                  token == null
                                                      ? Get.offNamed('/sign-in')
                                                      : Get.off(AddsView());
                                                  // Navigator.pushNamed(context, AddsScreen.routeName);
                                                },
                                                child: Container(
                                                  child: Center(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Text(
                                                          'Add_add'.tr,
                                                          textScaleFactor: 1,
                                                          style: TextStyle(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontFamily:
                                                                  'Cairo',
                                                              color: AppColors
                                                                  .primaryColor),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  height: 60,
                                                  width: width * 0.54,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: AppColors
                                                              .primaryColor),
                                                      color:
                                                          AppColors.whiteColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25)),
                                                ),
                                              ),
                                              SizedBox(
                                                height: height * .01,
                                              ),
                                              Container(
                                                  margin: EdgeInsets.only(
                                                      top: height * .06),
                                                  child: Image.asset(
                                                      'assets/images/Empty.png')),
                                            ],
                                          ))
                                        : GridView.builder(
                                            itemCount: controller
                                                .accessoriesList.length,
                                            shrinkWrap: true,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 2,
                                                    childAspectRatio:
                                                        (itemWidth /
                                                                itemHeight) *
                                                            1.4,
                                                    crossAxisSpacing: 5,
                                                    mainAxisSpacing: 0),
                                            //    gridDelegate:
                                            // SliverGridDelegateWithFixedCrossAxisCount(
                                            //     crossAxisCount: 2),
                                            itemBuilder: (_, index) {
                                              // // print(controller
                                              //     .accessoriesList[index]
                                              //     .images[0]['imageURL']);
                                              return InkWell(
                                                onTap: () {
                                                  Get.to(UsedAccessoriesDetailsView(
                                                      url: controller.http
                                                          .baseUrlForImages,
                                                      item: controller
                                                              .accessoriesList[
                                                          index]));
                                                },
                                                child: Container(
                                                  margin: EdgeInsets.only(
                                                      bottom: 10),
                                                  child: Container(
                                                    // margin: EdgeInsets.symmetric(horizontal: 15),
                                                    height: height * 0.24,
                                                    width: width * 0.346,
                                                    color: Colors.white,
                                                    child: Stack(
                                                      children: [
                                                        Stack(
                                                          children: [
                                                            Image.network(
                                                              controller.http
                                                                      .baseUrlForImages +
                                                                  controller
                                                                      .accessoriesList[
                                                                          index]
                                                                      .images[0]
                                                                          [
                                                                          'imageURL']
                                                                      .toString(),
                                                              fit: BoxFit.cover,
                                                              height:
                                                                  width * 0.42,
                                                              width: width,
                                                            ),
                                                            Positioned(
                                                              top: -5,
                                                              left: -5,
                                                              child: IconButton(
                                                                onPressed: () {
                                                                  controller.showremoveAddsDialog(
                                                                      context,
                                                                      id: controller
                                                                          .accessoriesList[
                                                                              index]
                                                                          .id,
                                                                      type: controller
                                                                          .accessoriesList[
                                                                              index]
                                                                          .adType,
                                                                      index:
                                                                          index);
                                                                },
                                                                icon: SvgPicture.asset(
                                                                    'assets/images/ic_delete.svg',
                                                                    color: Colors
                                                                        .red,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                    width: 16,
                                                                    height: 16,
                                                                    semanticsLabel:
                                                                        ''),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Positioned(
                                                          bottom: 25,
                                                          width: width * 0.45,
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Center(
                                                                child: Text(
                                                                  controller
                                                                      .accessoriesList[
                                                                          index]
                                                                      .partName,
                                                                  textScaleFactor:
                                                                      1,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      fontFamily:
                                                                          'Cairo',
                                                                      color: Colors
                                                                          .black),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Positioned(
                                                            bottom: 0,
                                                            right: 0,
                                                            child: Row(
                                                              children: [
                                                                Container(
                                                                  height: 18,
                                                                  width: width *
                                                                      0.22,
                                                                  color: Colors
                                                                      .grey,
                                                                  child:
                                                                      Container(
                                                                    margin: EdgeInsets
                                                                        .symmetric(
                                                                            horizontal:
                                                                                5),
                                                                    child: Text(
                                                                      // controller.accessoriesList[index].carModelName.toString() +
                                                                      controller
                                                                          .accessoriesList[
                                                                              index]
                                                                          .carModelName
                                                                          .toString(),
                                                                      textScaleFactor:
                                                                          1,
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              10,
                                                                          fontWeight: FontWeight
                                                                              .w400,
                                                                          fontFamily:
                                                                              'Cairo',
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  height: 18,
                                                                  width: width *
                                                                      0.23,
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          200,
                                                                          142,
                                                                          116,
                                                                          1),
                                                                  child: Center(
                                                                    child: Row(
                                                                      children: [
                                                                        SizedBox(
                                                                          width:
                                                                              5,
                                                                        ),
                                                                        Text(
                                                                          controller
                                                                              .accessoriesList[index]
                                                                              .unitPrice
                                                                              .toString(),
                                                                          textScaleFactor:
                                                                              1,
                                                                          style: TextStyle(
                                                                              // decoration: TextDecoration.lineThrough,
                                                                              fontSize: 11,
                                                                              fontWeight: FontWeight.w500,
                                                                              fontFamily: 'Cairo',
                                                                              color: Colors.white),
                                                                        ),
                                                                        Text(
                                                                          ' د.ك',
                                                                          textScaleFactor:
                                                                              1,
                                                                          style: TextStyle(
                                                                              // decoration: TextDecoration.lineThrough,
                                                                              fontSize: 8,
                                                                              fontWeight: FontWeight.w500,
                                                                              fontFamily: 'Cairo',
                                                                              color: Colors.white),
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              5,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                  ),
                                ],
                              ))
                        //Accessories
                      ],
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

class UsedCarsShimmerList extends StatelessWidget {
  const UsedCarsShimmerList({
    Key key,
    @required this.height,
    @required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300],
      highlightColor: Colors.grey[100],
      enabled: true,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 20,
        padding: const EdgeInsets.all(12),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              // Navigator.pushNamed(
              //     context, CarsDetailsScreen.routeName);
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 5),
              child: Container(
                height: height * .2,
                width: width * .85,
                margin: EdgeInsets.symmetric(horizontal: 2.5),
                decoration: BoxDecoration(
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: AppColors.shadowColor,
                    //     blurRadius: 20,
                    //     offset: Offset(0, 10),
                    //   ),
                    // ],
                    color: Color.fromRGBO(239, 244, 255, 1),
                    borderRadius: BorderRadius.circular(18)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: width * .12,
                      ),
                      child: Text('نيسان باترول للبيع',
                          textScaleFactor: 1,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Cairo',
                              color: Colors.black)),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 40,
                          width: width * 0.14,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.shadowColor,
                                  blurRadius: 20,
                                  offset: Offset(0, 10),
                                ),
                              ],
                              color: Color.fromRGBO(128, 128, 188, 1),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'سنة الصنع',
                                textScaleFactor: 1,
                                style: TextStyle(
                                    fontSize: 8,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Cairo',
                                    color: AppColors.whiteColor),
                              ),
                              Text(
                                '2018',
                                textScaleFactor: 1,
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Cairo',
                                    color: AppColors.whiteColor),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          height: 40,
                          width: width * 0.14,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.shadowColor,
                                  blurRadius: 20,
                                  offset: Offset(0, 10),
                                ),
                              ],
                              color: Color.fromRGBO(55, 166, 178, 1),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'العداد/ كم',
                                textScaleFactor: 1,
                                style: TextStyle(
                                    fontSize: 8,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Cairo',
                                    color: AppColors.whiteColor),
                              ),
                              Text(
                                '12000',
                                textScaleFactor: 1,
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Cairo',
                                    color: AppColors.whiteColor),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          height: 40,
                          width: width * 0.14,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.shadowColor,
                                  blurRadius: 20,
                                  offset: Offset(0, 10),
                                ),
                              ],
                              color: Color.fromRGBO(200, 142, 116, 1),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'السعر / د.ك',
                                textScaleFactor: 1,
                                style: TextStyle(
                                    fontSize: 8,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Cairo',
                                    color: AppColors.whiteColor),
                              ),
                              Text(
                                '2500',
                                textScaleFactor: 1,
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Cairo',
                                    color: AppColors.whiteColor),
                              ),
                            ],
                          ),
                        ),
                        // Container(
                        //   margin: EdgeInsets.symmetric(horizontal: 10),
                        //   height: height * .11,
                        //   width: width * 0.4,
                        //   child: Image.asset(
                        //     'assets/images/BlueCar.png',
                        //     fit: BoxFit.contain,
                        //   ),
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class AddressesShimmer extends StatelessWidget {
  const AddressesShimmer({
    Key key,
    @required this.height,
    @required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300],
      highlightColor: Colors.grey[100],
      enabled: true,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 2,
        padding: const EdgeInsets.all(12),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(bottom: 5),
              child: Container(
                height: height * .139,
                width: width * .8,
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.symmetric(horizontal: 5),
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'المنزل',
                          textScaleFactor: 1,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Cairo',
                              color: Colors.black),
                        ),
                        Row(
                          children: [
                            SvgPicture.asset('assets/images/ic_delete.svg',
                                color: Color.fromRGBO(162, 162, 162, 1),
                                fit: BoxFit.cover,
                                width: 16,
                                height: 16,
                                semanticsLabel: ''),
                            SizedBox(
                              width: 13,
                            ),
                            SvgPicture.asset('assets/images/ic_pencil.svg',
                                color: Color.fromRGBO(162, 162, 162, 1),
                                fit: BoxFit.cover,
                                width: 16,
                                height: 16,
                                semanticsLabel: ''),
                          ],
                        ),
                      ],
                    ),
                    Text(
                      'قطعة 2 - جادة 3 - شارع 121 - منزل 15',
                      textScaleFactor: 1,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Cairo',
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class InputsShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    TextEditingController nameController1 = TextEditingController();
    final RoundedLoadingButtonController btnController =
        new RoundedLoadingButtonController();
    return Shimmer.fromColors(
      baseColor: Colors.grey[300],
      highlightColor: Colors.grey[100],
      enabled: true,
      child: Center(
        child: Container(
          width: width * .9,
          padding: EdgeInsets.all(15),
          margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
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
              ProfileInput(
                  lines: 1,
                  controller: nameController1,
                  label: 'enter_name'.tr,
                  type: TextInputType.name,
                  secure: false,
                  icon: Icons.access_alarm,
                  image: 'assets/images/noun_Lock_821908.png',
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'enter_name'.tr;
                    }
                  }),
              ProfileInput(
                lines: 1,
                controller: nameController1,
                label: 'enter_mobile_number'.tr,
                type: TextInputType.number,
                secure: false,
                icon: Icons.access_alarm,
                image: 'assets/images/noun_Lock_821908.png',
                validator: (value) {
                  if (value.isEmpty) {
                    return 'enter_mobile_validate'.tr;
                  }
                  if (value.length < 9 || value.length > 12) {
                    return 'invalid_phone_range'.tr;
                  }
                },
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: RoundedLoadingButton(
                  width: width * .35,
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
                  controller: btnController,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
