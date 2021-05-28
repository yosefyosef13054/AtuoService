import 'package:autoservice/app/widgets/inputs/AccessoriesAddInput.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:autoservice/app/modules/heavyCars_add/controllers/heavy_cars_add_controller.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:autoservice/app/Colors.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:autoservice/app/modules/usedCars_add/models/model.dart';

import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:autoservice/app/modules/usedCars_add/views/shimmer.dart';

// ShimmerTest()
class HeavyCarsAddView extends GetView<HeavyCarsAddController> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    TextEditingController controller1 = TextEditingController();
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroud,
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0.0,
        title: Text(
          'heavyCarsForSell'.tr,
          textScaleFactor: 1,
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
              fontFamily: 'Cairo',
              color: AppColors.whiteColor),
        ),
        centerTitle: true,
      ),
      body: Obx(
        () => controller.getcatYearsloading.value == true
            ? ShimmerTest()
            : Form(
                key: _formKey,
                child: Container(
                  decoration: BoxDecoration(),
                  child: SingleChildScrollView(
                    child: AnimationLimiter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: AnimationConfiguration.toStaggeredList(
                          duration: const Duration(milliseconds: 600),
                          childAnimationBuilder: (widget) => SlideAnimation(
                            horizontalOffset:
                                MediaQuery.of(context).size.width / 1,
                            child: SlideAnimation(child: widget),
                          ),
                          children: [
                            // Center(
                            //   child: Text(
                            //     'اكسسورات',
                            //     textScaleFactor: 1,
                            //         style: TextStyle(
                            //         fontSize: 24,
                            //         fontWeight: FontWeight.w500,
                            //         fontFamily: 'Cairo',
                            //         color: AppColors.whiteColor),
                            //   ),
                            // ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              width: width * .9,
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.symmetric(vertical: 5),
                              decoration: BoxDecoration(
                                color: AppColors.whiteColor,
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: Column(
                                children: [
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
                                        'Car_year'.tr,
                                        textScaleFactor: 1,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Cairo',
                                            color: AppColors.primaryColor),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Obx(
                                    () => controller.getcatYearsloading.value ==
                                            true
                                        ? Center(
                                            child: SpinKitRing(
                                              color: AppColors.primaryColor,
                                              size: 30,
                                            ),
                                          )
                                        : Container(
                                            height: 33,
                                            child: GetBuilder(
                                              builder: (_dx) =>
                                                  ListView.builder(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount:
                                                    controller.carYears.length,
                                                itemBuilder: (context, index) {
                                                  CarYears caryear = controller
                                                      .carYears
                                                      .elementAt(index);
                                                  // // print(caryear.title);
                                                  return InkWell(
                                                    onTap: () {
                                                      controller.changeCarYear(
                                                          caryear.id
                                                              .toString());
                                                      // print(caryear.id

                                                      // controller.carYear.value =
                                                      //     caryear.id.toString();
                                                      // // print(caryear.id.toString());
                                                    },
                                                    child: Obx(
                                                      () => Container(
                                                        width: 60,
                                                        margin: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 5,
                                                                vertical: 1),
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                color: AppColors
                                                                    .primaryColor),
                                                            color: controller
                                                                        .carYear
                                                                        .value
                                                                        .toString() ==
                                                                    caryear.id
                                                                        .toString()
                                                                ? AppColors
                                                                    .primaryColor
                                                                : AppColors
                                                                    .whiteColor,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15)),
                                                        child: Center(
                                                          child: Container(
                                                            child: Text(
                                                              caryear.title
                                                                  .toString(),
                                                              textScaleFactor:
                                                                  1,
                                                              style: TextStyle(
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontFamily:
                                                                      'Cairo',
                                                                  color: controller
                                                                              .carYear
                                                                              .value
                                                                              .toString() ==
                                                                          controller
                                                                              .carYears[
                                                                                  index]
                                                                              .id
                                                                              .toString()
                                                                      ? AppColors
                                                                          .whiteColor
                                                                      : AppColors
                                                                          .primaryColor),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: width * .9,
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.symmetric(vertical: 5),
                              decoration: BoxDecoration(
                                color: AppColors.whiteColor,
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: Column(
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Text(
                                            'add_address'.tr,
                                            textScaleFactor: 1,
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'Cairo',
                                                color: AppColors.primaryColor),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        width: width * .8,
                                        child: AccessoriesInput(
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return 'required'.tr;
                                              }
                                            },
                                            lines: 1,
                                            controller:
                                                controller.addAddressController,
                                            label: '',
                                            type: TextInputType.text),
                                      ),
                                      SizedBox(height: 10)
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Text(
                                            'add_details'.tr,
                                            textScaleFactor: 1,
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'Cairo',
                                                color: AppColors.primaryColor),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        height: 100,
                                        width: width * .8,
                                        child: AccessoriesInput(
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return 'required'.tr;
                                              }
                                            },
                                            lines: 5,
                                            controller:
                                                controller.detailsController,
                                            label: '',
                                            type: TextInputType.text),
                                      ),
                                      SizedBox(height: 10)
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Text(
                                            'add_price'.tr,
                                            textScaleFactor: 1,
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'Cairo',
                                                color: AppColors.primaryColor),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        width: width * .8,
                                        child: AccessoriesInput(
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return 'required'.tr;
                                              }
                                            },
                                            lines: 1,
                                            controller:
                                                controller.priceController,
                                            label: '',
                                            type: TextInputType.number),
                                      ),
                                      SizedBox(height: 10)
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Text(
                                            'add_photo'.tr,
                                            textScaleFactor: 1,
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'Cairo',
                                                color: AppColors.primaryColor),
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              controller.getImage(context);
                                            },
                                            child: Container(
                                              height: 30,
                                              width: 30,
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.white,
                                                size: 20,
                                              ),
                                              // margin: EdgeInsets.symmetric(horizontal: 5),
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    color: AppColors.whiteColor,
                                                    width: 2),
                                                color: AppColors.primaryColor,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      //upladoing images
                                      Center(
                                        child: Container(
                                          width: width * .81,
                                          height: width * .32,
                                          decoration: BoxDecoration(
                                            color: Color.fromRGBO(
                                                233, 236, 242, 1),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: GetBuilder(
                                            builder: (_dx) => Center(
                                              child: Obx(
                                                () =>
                                                    controller.photoAdded
                                                                .value !=
                                                            null
                                                        ? ListView.builder(
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            itemCount: controller
                                                                        .image
                                                                        .length ==
                                                                    0
                                                                ? 1
                                                                : controller
                                                                    .image
                                                                    .length,
                                                            itemBuilder:
                                                                (context,
                                                                    index) {
                                                              // // print(caryear.title);
                                                              return Obx(() => controller
                                                                              .uploadedImage
                                                                              .value ==
                                                                          true &&
                                                                      controller
                                                                              .image
                                                                              .length !=
                                                                          0
                                                                  ? Container(
                                                                      child:
                                                                          InkWell(
                                                                        onTap:
                                                                            () {
                                                                          controller
                                                                              .getImage(context);
                                                                        },
                                                                        child:
                                                                            Stack(
                                                                          alignment:
                                                                              Alignment.center,
                                                                          children: [
                                                                            Container(
                                                                              width: width * .3,
                                                                              height: width * .3,
                                                                              padding: EdgeInsets.all(10),
                                                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                                                                              child: ClipRRect(
                                                                                  borderRadius: BorderRadius.circular(10),
                                                                                  child: Stack(
                                                                                    children: [
                                                                                      Image.file(
                                                                                        controller.image[index],
                                                                                        fit: BoxFit.cover,
                                                                                        width: width * .3,
                                                                                        height: width * .3,
                                                                                      ),
                                                                                      Positioned(
                                                                                        top: 0,
                                                                                        right: 0,
                                                                                        child: InkWell(
                                                                                          onTap: () {
                                                                                            controller.removeImage(index);
                                                                                          },
                                                                                          child: Center(
                                                                                            child: Container(
                                                                                              height: 18,
                                                                                              width: 18,
                                                                                              child: Icon(
                                                                                                Icons.remove,
                                                                                                color: Colors.white,
                                                                                                size: 8,
                                                                                              ),
                                                                                              // margin: EdgeInsets.symmetric(horizontal: 5),
                                                                                              decoration: BoxDecoration(
                                                                                                shape: BoxShape.circle,
                                                                                                // border: Border.all(color: AppColors.whiteColor, width: 2),
                                                                                                color: Colors.red,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  )),
                                                                            ),
                                                                            // Positioned(
                                                                            //   top: 0,
                                                                            //   right: width * 0.01,
                                                                            //   child: InkWell(
                                                                            //     onTap: () {
                                                                            //       controller.getImage(context);
                                                                            //     },
                                                                            //     child: Container(
                                                                            //       height: 15,
                                                                            //       width: 15,
                                                                            //       child: Icon(
                                                                            //         Icons.remove,
                                                                            //         color: Colors.white,
                                                                            //         size: 10,
                                                                            //       ),
                                                                            //       // margin: EdgeInsets.symmetric(horizontal: 5),
                                                                            //       decoration: BoxDecoration(
                                                                            //         shape: BoxShape.circle,
                                                                            //         // border: Border.all(color: AppColors.whiteColor, width: 2),
                                                                            //         color: Colors.red,
                                                                            //       ),
                                                                            //     ),
                                                                            //   ),
                                                                            // ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    )
                                                                  : Container(
                                                                      margin: EdgeInsets.symmetric(
                                                                          horizontal:
                                                                              width * .25),
                                                                      child:
                                                                          Center(
                                                                        child:
                                                                            InkWell(
                                                                          onTap:
                                                                              () {
                                                                            // // print(controller
                                                                            //             .image
                                                                            //             .length ==
                                                                            //         0
                                                                            //     ? 'null'
                                                                            //     : 'notnull');
                                                                            controller.getImage(context);
                                                                          },
                                                                          child:
                                                                              Stack(
                                                                            alignment:
                                                                                Alignment.center,
                                                                            children: [
                                                                              Container(
                                                                                width: width * .25,
                                                                                height: width * .25,
                                                                                padding: EdgeInsets.all(10),
                                                                                decoration: BoxDecoration(
                                                                                  color: Colors.white,
                                                                                  borderRadius: BorderRadius.circular(8),
                                                                                ),
                                                                                child: Center(
                                                                                  child: Container(
                                                                                    height: 25,
                                                                                    width: 25,
                                                                                    child: Center(
                                                                                        child: Image.asset(
                                                                                      'assets/images/icons/Ta2min/Ta3min(3).png',
                                                                                      fit: BoxFit.contain,
                                                                                      height: 25,
                                                                                      width: 25,
                                                                                    )),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ));
                                                            },
                                                          )
                                                        : Container(),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            width: width * .37,
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    SizedBox(
                                                      width: 15,
                                                    ),
                                                    Text(
                                                      'mobile_number'.tr,
                                                      textScaleFactor: 1,
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontFamily: 'Cairo',
                                                          color: AppColors
                                                              .primaryColor),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Container(
                                                  child: AccessoriesInput(
                                                      lines: 1,
                                                      validator: (value) {
                                                        if (value.isEmpty) {
                                                          return 'required'.tr;
                                                        }
                                                      },
                                                      controller: controller
                                                          .mobileController,
                                                      label: '',
                                                      type:
                                                          TextInputType.number),
                                                ),
                                                SizedBox(height: 10)
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width: width * .37,
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    SizedBox(
                                                      width: 15,
                                                    ),
                                                    Text(
                                                      'whatsNumber'.tr,
                                                      textScaleFactor: 1,
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontFamily: 'Cairo',
                                                          color: AppColors
                                                              .primaryColor),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Container(
                                                  child: AccessoriesInput(
                                                      lines: 1,
                                                      validator: (value) {
                                                        if (value.isEmpty) {
                                                          return 'required'.tr;
                                                        }
                                                      },
                                                      controller: controller
                                                          .whatsNumberController,
                                                      label: '',
                                                      type:
                                                          TextInputType.number),
                                                ),
                                                SizedBox(height: 10)
                                              ],
                                            ),
                                          )
                                        ],
                                      ),

                                      //governet and area
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            width: 20,
                                          ),
                                          Container(
                                            width: width * .37,
                                            child: Column(
                                              children: [
                                                Align(
                                                  alignment: Alignment.topRight,
                                                  child: Text(
                                                    'Governorate'.tr,
                                                    textScaleFactor: 1,
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontFamily: 'Cairo',
                                                        color: AppColors
                                                            .primaryColor),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Align(
                                                  child: Container(
                                                    height: 40,
                                                    decoration: BoxDecoration(
                                                        color: Color.fromRGBO(
                                                            233, 236, 242, 1),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0)),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          child: Center(
                                                            child: Obx(
                                                              () =>
                                                                  DropdownButton<
                                                                      String>(
                                                                underline:
                                                                    SizedBox(),
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        11),
                                                                value: controller
                                                                    .governorateid
                                                                    .value
                                                                    .toString(),
                                                                items: controller
                                                                    .listgovernorate
                                                                    .map(
                                                                        (value) {
                                                                  return new DropdownMenuItem<
                                                                      String>(
                                                                    value: value
                                                                        .id
                                                                        .toString(),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          width *
                                                                              0.3,
                                                                      // margin: EdgeInsets
                                                                      //     .symmetric(
                                                                      //         horizontal:
                                                                      //             10),
                                                                      child:
                                                                          Center(
                                                                        child:
                                                                            new Text(
                                                                          value
                                                                              .areaName,
                                                                          textScaleFactor:
                                                                              1,
                                                                          style: TextStyle(
                                                                              fontSize: 11,
                                                                              fontWeight: FontWeight.w500,
                                                                              fontFamily: 'Cairo',
                                                                              color: AppColors.primaryColor),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                }).toList(),
                                                                onChanged:
                                                                    (value) {
                                                                  // print(value);
                                                                  controller
                                                                          .governorateid
                                                                          .value =
                                                                      value
                                                                          .toString();
                                                                  controller
                                                                      .areaid
                                                                      .value = '0';
                                                                  controller
                                                                      .getarea(
                                                                          value);
                                                                  // setState(() {
                                                                  //   selecteditem1 = value;
                                                                  // });
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 10)
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          // controller.governorateloading.value ==
                                          //         true
                                          //     ? Center(
                                          //         child: SpinKitRing(
                                          //           color:
                                          //               AppColors.primaryColor,
                                          //           size: 30,
                                          //         ),
                                          //       )
                                          //     :
                                          Container(
                                            width: width * .37,
                                            child: Column(
                                              children: [
                                                Align(
                                                  alignment: Alignment.topRight,
                                                  child: Text(
                                                    'area'.tr,
                                                    textScaleFactor: 1,
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontFamily: 'Cairo',
                                                        color: AppColors
                                                            .primaryColor),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Align(
                                                  child: Container(
                                                    height: 40,
                                                    decoration: BoxDecoration(
                                                        color: Color.fromRGBO(
                                                            233, 236, 242, 1),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0)),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          child: Center(
                                                            child: Obx(
                                                              () =>
                                                                  DropdownButton<
                                                                      String>(
                                                                underline:
                                                                    SizedBox(),
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        11),
                                                                value: controller
                                                                    .areaid
                                                                    .value
                                                                    .toString(),
                                                                items: controller
                                                                    .listarea
                                                                    .map(
                                                                        (value) {
                                                                  return new DropdownMenuItem<
                                                                      String>(
                                                                    value: value
                                                                        .id
                                                                        .toString(),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          width *
                                                                              0.3,
                                                                      // margin: EdgeInsets
                                                                      //     .symmetric(
                                                                      //         horizontal:
                                                                      //             10),
                                                                      child:
                                                                          Center(
                                                                        child:
                                                                            new Text(
                                                                          value
                                                                              .areaName,
                                                                          textScaleFactor:
                                                                              1,
                                                                          style: TextStyle(
                                                                              fontSize: 11,
                                                                              fontWeight: FontWeight.w500,
                                                                              fontFamily: 'Cairo',
                                                                              color: AppColors.primaryColor),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                }).toList(),
                                                                onChanged:
                                                                    (value) {
                                                                  controller
                                                                          .areaid
                                                                          .value =
                                                                      value
                                                                          .toString();
                                                                  // setState(() {
                                                                  //   selecteditem1 = value;
                                                                  // });
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 10)
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      //governet and area
                                      SizedBox(
                                        height: 15,
                                      ),
                                      //upladoing images
                                      Container(
                                        width: width * 0.5,
                                        child: RoundedLoadingButton(
                                          color: AppColors.primaryColor,
                                          child: Text(
                                            'add_submit'.tr,
                                            textScaleFactor: 1,
                                            style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: 'Cairo',
                                                color: AppColors.whiteColor),
                                          ),
                                          controller: controller.btnController,
                                          onPressed: () {
                                            final FormState form =
                                                _formKey.currentState;
                                            // print(form.validate());
                                            if (form.validate()) {
                                              controller.submit(context);
                                            } else {
                                              controller.btnController.error();
                                              Future.delayed(
                                                  Duration(milliseconds: 1200),
                                                  () => controller.btnController
                                                      .reset());
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
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),

                            Container(
                              height: 5,
                              margin: EdgeInsets.symmetric(vertical: 5),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
