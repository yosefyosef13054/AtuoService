import 'package:autoservice/app/widgets/inputs/AccessoriesAddInput.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:autoservice/app/modules/usedCars_add/models/model.dart';

import 'package:autoservice/app/modules/usedCars_add/controllers/used_cars_add_controller.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:autoservice/app/Colors.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:shimmer/shimmer.dart';
import 'package:autoservice/app/modules/usedCars_add/views/shimmer.dart';

// ShimmerTest()
class UsedCarsAddView extends GetView<UsedCarsAddController> {
  final locale = Get.locale;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //var controller = Get.put<UsedCarsAddController>(UsedCarsAddController());
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final locale = Get.locale;
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroud,
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0.0,
        title: Text(
          'usedCars'.tr,
          textScaleFactor: 1,
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              fontFamily: 'Cairo',
              color: AppColors.whiteColor),
        ),
        centerTitle: true,
      ),
      body: Obx(
        () => controller.loading.value == true
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
                            //       style: TextStyle(
                            //         fontSize: 24,
                            //         fontWeight: FontWeight.w500,
                            //         fontFamily: 'Cairo',
                            //         color: AppColors.whiteColor),
                            //   ),
                            // ),
                            SizedBox(
                              height: 5,
                            ),
                            //regions
                            // Container(
                            //     width: width * .9,
                            //     padding: EdgeInsets.all(10),
                            //     margin: EdgeInsets.symmetric(vertical: 5),
                            //     decoration: BoxDecoration(
                            //       color: AppColors.whiteColor,
                            //       borderRadius: BorderRadius.circular(7),
                            //     ),
                            //     child: Column(children: [
                            //       Row(
                            //         children: [
                            //           Image.asset(
                            //             'assets/images/icons/Ta2min/Ta3min(1).png',
                            //             height: 20,
                            //             width: 20,
                            //           ),
                            //           SizedBox(
                            //             width: 15,
                            //           ),
                            //           Text(
                            //             'Car_madeIn'.tr,
                            //             textScaleFactor: 1,
                            //                  style: TextStyle(
                            //                 fontSize: 15,
                            //                 fontWeight: FontWeight.w500,
                            //                 fontFamily: 'Cairo',
                            //                 color: AppColors.primaryColor),
                            //           ),
                            //         ],
                            //       ),
                            //       SizedBox(
                            //         height: 15,
                            //       ),
                            //       Container(
                            //         height: 40,
                            //         child: GetBuilder(
                            //           builder: (_dx) => ListView.builder(
                            //             scrollDirection: Axis.horizontal,
                            //             itemCount: controller.carRegions.length,
                            //             itemBuilder: (context, index) {
                            //               String id = controller
                            //                   .carRegions[index].id
                            //                   .toString();
                            //               return Obx(() => InkWell(
                            //                     onTap: () {
                            //                       controller.madein.value = id;
                            //                       // controller.setMadeINvalue(controller
                            //                       //     .carRegions[index].id);
                            //                       // var regionId = controller.carRegions
                            //                       //     .where((element) =>
                            //                       //         element.name.toString() ==
                            //                       //         controller.madein.value
                            //                       //             .toString());
                            //                       // List regions = controller.carRegions;

                            //                       controller.getcatTypes(
                            //                           controller
                            //                               .carRegions[index].id
                            //                               .toString());
                            //                       controller.cartypeId.value =
                            //                           '1';
                            //                     },
                            //                     child: Container(
                            //                       margin: EdgeInsets.symmetric(
                            //                           horizontal: 5),
                            //                       width: width * 0.25,
                            //                       decoration: BoxDecoration(
                            //                           border: Border.all(
                            //                               color: AppColors
                            //                                   .primaryColor),
                            //                           color: controller
                            //                                       .madein.value
                            //                                       .toString() ==
                            //                                   controller
                            //                                       .carRegions[
                            //                                           index]
                            //                                       .id
                            //                                       .toString()
                            //                               ? AppColors
                            //                                   .primaryColor
                            //                               : AppColors
                            //                                   .whiteColor,
                            //                           borderRadius:
                            //                               BorderRadius.circular(
                            //                                   8)),
                            //                       child: Container(
                            //                         margin:
                            //                             EdgeInsets.symmetric(
                            //                                 vertical: 6,
                            //                                 horizontal: 5),
                            //                         child: Center(
                            //                           child: Text(
                            //                             locale == Locale('en')
                            //                                 ? controller
                            //                                     .carRegions[
                            //                                         index]
                            //                                     .regionNameEn
                            //                                     .toString()
                            //                                 : controller
                            //                                     .carRegions[
                            //                                         index]
                            //                                     .regionNameAr,
                            //                             textScaleFactor: 1,
                            //        style: TextStyle(
                            //                                 fontSize: 13,
                            //                                 fontWeight:
                            //                                     FontWeight.w500,
                            //                                 fontFamily: 'Cairo',
                            //                                 color: controller
                            //                                             .madein
                            //                                             .value
                            //                                             .toString() ==
                            //                                         controller
                            //                                             .carRegions[
                            //                                                 index]
                            //                                             .id
                            //                                             .toString()
                            //                                     ? AppColors
                            //                                         .whiteColor
                            //                                     : AppColors
                            //                                         .primaryColor),
                            //                           ),
                            //                         ),
                            //                       ),
                            //                     ),
                            //                   ));
                            //             },
                            //           ),
                            //         ),
                            //       ),
                            //     ])),
                            Container(
                              width: width * .9,
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.symmetric(vertical: 5),
                              decoration: BoxDecoration(
                                color: AppColors.whiteColor,
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: Column(children: [
                                //model and type
                                Obx(
                                  () => Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      controller.getcatTypesloading.value ==
                                              true
                                          ? Center(
                                              child: SpinKitRing(
                                                color: AppColors.primaryColor,
                                                size: 30,
                                              ),
                                            )
                                          : Column(
                                              children: [
                                                Text(
                                                  'Car_Type'.tr,
                                                  textScaleFactor: 1,
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily: 'Cairo',
                                                      color: AppColors
                                                          .primaryColor),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Container(
                                                  width: width * .37,
                                                  height: 40,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: AppColors
                                                              .primaryColor),
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        // margin: EdgeInsets.all(10),
                                                        child:
                                                            new DropdownButton<
                                                                String>(
                                                          underline: SizedBox(),
                                                          //        textScaleFactor: 1,
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 12),
                                                          value: controller
                                                              .cartypeId.value
                                                              .toString(),
                                                          items: controller
                                                              .carTypes
                                                              .map((value) {
                                                            return new DropdownMenuItem<
                                                                String>(
                                                              value: value.id
                                                                  .toString(),
                                                              child: Center(
                                                                child: new Text(
                                                                  value.title
                                                                      .toString(),
                                                                  textScaleFactor:
                                                                      1,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      fontFamily:
                                                                          'Cairo',
                                                                      color: AppColors
                                                                          .primaryColor),
                                                                ),
                                                              ),
                                                            );
                                                          }).toList(),
                                                          onChanged: (value) {
                                                            controller.cartypeId
                                                                    .value =
                                                                value
                                                                    .toString();
                                                            controller
                                                                .getcarModels(
                                                                    value);

                                                            controller
                                                                .carmodelId
                                                                .value = '0';
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
                                            'Car_model'.tr,
                                            textScaleFactor: 1,
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'Cairo',
                                                color: AppColors.primaryColor),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          // controller.getcatModelsloading
                                          //             .value ==
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
                                            height: 40,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color:
                                                        AppColors.primaryColor),
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  // margin: EdgeInsets.all(10),
                                                  child: Obx(
                                                    () =>
                                                        DropdownButton<String>(
                                                      underline: SizedBox(),
                                                      //        textScaleFactor: 1,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 12),
                                                      value: controller
                                                          .carmodelId.value
                                                          .toString(),
                                                      items: controller
                                                          .carModels
                                                          .map((value) {
                                                        return new DropdownMenuItem<
                                                            String>(
                                                          value: value.id
                                                              .toString(),
                                                          child: Center(
                                                            child: new Text(
                                                              value.title
                                                                  .toString(),
                                                              textScaleFactor:
                                                                  1,
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontFamily:
                                                                      'Cairo',
                                                                  color: AppColors
                                                                      .primaryColor),
                                                            ),
                                                          ),
                                                        );
                                                      }).toList(),
                                                      onChanged: (value) {
                                                        controller.carmodelId
                                                            .value = value;
                                                        controller
                                                            .getcarYears(value);
                                                        // print(value);
                                                        // setState(() {
                                                        //   selecteditem1 = value;
                                                        // });
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                //model and type
                                SizedBox(
                                  height: 15,
                                ),
                                //car year
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
                                          fontSize: 15,
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
                                  () =>
                                      // controller.getcatYearsloading.value ==
                                      //         true
                                      //     ? Center(
                                      //         child: SpinKitRing(
                                      //           color: AppColors.primaryColor,
                                      //           size: 30,
                                      //         ),
                                      //       )
                                      //     :
                                      Container(
                                    height: 33,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: controller.carYears.length,
                                      itemBuilder: (context, index) {
                                        CarYears caryear = controller.carYears
                                            .elementAt(index);
                                        // // print(caryear.title);
                                        return InkWell(
                                          onTap: () {
                                            controller.changeCarYear(
                                                caryear.id.toString());
                                            // print(caryear.id.toString());
                                            // controller.carYear.value =
                                            //     caryear.id.toString();
                                            // // print(caryear.id.toString());
                                          },
                                          child: Obx(
                                            () => Container(
                                              width: 60,
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 5, vertical: 1),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: AppColors
                                                          .primaryColor),
                                                  color: controller
                                                              .carYear.value
                                                              .toString() ==
                                                          caryear.id.toString()
                                                      ? AppColors.primaryColor
                                                      : AppColors.whiteColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
                                              child: Center(
                                                child: Container(
                                                  child: Text(
                                                    caryear.title.toString(),
                                                    textScaleFactor: 1,
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontFamily: 'Cairo',
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
                                //car year

                                // Row(
                                //   children: [
                                //     Container(
                                //       width: 60,
                                //       decoration: BoxDecoration(
                                //           border: Border.all(
                                //               color: AppColors.primaryColor),
                                //           color: Colors.white,
                                //           borderRadius: BorderRadius.circular(10)),
                                //       child: Center(
                                //         child: Container(
                                //           child: Text(
                                //             '2019',
                                //             textScaleFactor: 1,
                                //          style: TextStyle(
                                //                 fontSize: 15,
                                //                 fontWeight: FontWeight.w500,
                                //                 fontFamily: 'Cairo',
                                //                 color: AppColors.primaryColor),
                                //           ),
                                //         ),
                                //       ),
                                //     ),
                                //   ],
                                // )
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Car_status_Confirm_type'.tr,
                                      textScaleFactor: 1,
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Cairo',
                                          color: AppColors.primaryColor),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            String id = controller
                                                .listcarCheckType[0].id
                                                .toString();
                                            controller.carCheckType.value = id;
                                          },
                                          child: Container(
                                            width: width * .3,
                                            decoration: BoxDecoration(
                                                color: controller
                                                            .carCheckType.value
                                                            .toString() ==
                                                        controller
                                                            .listcarCheckType[0]
                                                            .id
                                                            .toString()
                                                    ? AppColors.primaryColor
                                                    : Color.fromRGBO(
                                                        233, 236, 242, 1),
                                                borderRadius:
                                                    BorderRadius.circular(0)),
                                            child: Center(
                                              child: Text(
                                                locale == Locale('en')
                                                    ? controller
                                                        .listcarCheckType[0]
                                                        .titleEn
                                                    : controller
                                                        .listcarCheckType[0]
                                                        .titleAr,
                                                textScaleFactor: 1,
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: 'Cairo',
                                                    color: controller
                                                                .carCheckType
                                                                .value
                                                                .toString() ==
                                                            controller
                                                                .listcarCheckType[
                                                                    0]
                                                                .id
                                                                .toString()
                                                        ? Colors.white
                                                        : AppColors
                                                            .primaryColor),
                                              ),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            String id = controller
                                                .listcarCheckType[1].id
                                                .toString();
                                            controller.carCheckType.value = id;
                                          },
                                          child: Container(
                                            width: width * .3,
                                            decoration: BoxDecoration(
                                                color: controller
                                                            .carCheckType.value
                                                            .toString() ==
                                                        controller
                                                            .listcarCheckType[1]
                                                            .id
                                                            .toString()
                                                    ? AppColors.primaryColor
                                                    : Color.fromRGBO(
                                                        233, 236, 242, 1),
                                                borderRadius:
                                                    BorderRadius.circular(0)),
                                            child: Center(
                                              child: Text(
                                                locale == Locale('en')
                                                    ? controller
                                                        .listcarCheckType[1]
                                                        .titleEn
                                                    : controller
                                                        .listcarCheckType[1]
                                                        .titleAr,
                                                textScaleFactor: 1,
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: 'Cairo',
                                                    color: controller
                                                                .carCheckType
                                                                .value
                                                                .toString() ==
                                                            controller
                                                                .listcarCheckType[
                                                                    1]
                                                                .id
                                                                .toString()
                                                        ? Colors.white
                                                        : AppColors
                                                            .primaryColor),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                )
                              ]),
                            ),
                            // Container(
                            //   width: width * .9,
                            //   padding: EdgeInsets.all(10),
                            //   margin: EdgeInsets.symmetric(vertical: 5),
                            //   decoration: BoxDecoration(
                            //     color: AppColors.whiteColor,
                            //     borderRadius: BorderRadius.circular(7),
                            //   ),
                            //   child: Column(
                            //     crossAxisAlignment: CrossAxisAlignment.start,
                            //     children: [
                            //       SizedBox(
                            //         height: 15,
                            //       ),
                            //       Row(
                            //         children: [
                            //           Column(
                            //             children: [
                            //               Text(
                            //                 'Car_status'.tr,
                            //                 textScaleFactor: 1,
                            // style: TextStyle(
                            //                     fontSize: 13,
                            //                     fontWeight: FontWeight.w500,
                            //                     fontFamily: 'Cairo',
                            //                     color: AppColors.primaryColor),
                            //               ),
                            //               SizedBox(
                            //                 height: 10,
                            //               ),
                            //               Container(
                            //                 height: 40,
                            //                 decoration: BoxDecoration(
                            //                     color: Color.fromRGBO(
                            //                         233, 236, 242, 1),
                            //                     borderRadius:
                            //                         BorderRadius.circular(0)),
                            //                 child: Row(
                            //                   mainAxisAlignment:
                            //                       MainAxisAlignment.center,
                            //                   children: [
                            //                     Container(
                            //                       child: Center(
                            //                         child: new DropdownButton<
                            //                             String>(
                            //                           underline: SizedBox(),
                            //                           textScaleFactor: 1,
                            //           style: TextStyle(
                            //                               color: Colors.black,
                            //                               fontSize: 11),
                            //                           value: controller
                            //                                       .carStatus
                            //                                       .value
                            //                                       .toString() ==
                            //                                   '1'
                            //                               ? controller
                            //                                   .listcarStatus[0]
                            //                                   .id
                            //                                   .toString()
                            //                               : controller
                            //                                   .carStatus.value
                            //                                   .toString(),
                            //                           items: controller
                            //                               .listcarStatus
                            //                               .map((value) {
                            //                             return new DropdownMenuItem<
                            //                                 String>(
                            //                               value: value.id
                            //                                   .toString(),
                            //                               child: Container(
                            //                                 width: width * 0.3,
                            //                                 // margin: EdgeInsets
                            //                                 //     .symmetric(
                            //                                 //         horizontal:
                            //                                 //             10),
                            //                                 child: Center(
                            //                                   child: new Text(
                            //                                     locale ==
                            //                                             Locale(
                            //                                                 'en')
                            //                                         ? value
                            //                                             .titleEn
                            //                                         : value
                            //                                             .titleAr,
                            //       //                              textScaleFactor: 1,
                            //         style: TextStyle(
                            //                                         fontSize:
                            //                                             11,
                            //                                         fontWeight:
                            //                                             FontWeight
                            //                                                 .w400,
                            //                                         fontFamily:
                            //                                             'Cairo',
                            //                                         color: AppColors
                            //                                             .primaryColor),
                            //                                   ),
                            //                                 ),
                            //                               ),
                            //                             );
                            //                           }).toList(),
                            //                           onChanged: (value) {
                            //                             controller.carStatus
                            //                                     .value =
                            //                                 value.toString();
                            //                             // setState(() {
                            //                             //   selecteditem1 = value;
                            //                             // });
                            //                           },
                            //                         ),
                            //                       ),
                            //                     ),
                            //                   ],
                            //                 ),
                            //               )
                            //             ],
                            //           ),
                            //           Spacer(),
                            //           Column(
                            //             children: [
                            //               Text(
                            //                 'Car_inside_status'.tr,
                            //                 textScaleFactor: 1,
                            //      style: TextStyle(
                            //                     fontSize: 13,
                            //                     fontWeight: FontWeight.w500,
                            //                     fontFamily: 'Cairo',
                            //                     color: AppColors.primaryColor),
                            //               ),
                            //               SizedBox(
                            //                 height: 10,
                            //               ),
                            //               Container(
                            //                 height: 40,
                            //                 decoration: BoxDecoration(
                            //                     color: Color.fromRGBO(
                            //                         233, 236, 242, 1),
                            //                     borderRadius:
                            //                         BorderRadius.circular(0)),
                            //                 child: Row(
                            //                   mainAxisAlignment:
                            //                       MainAxisAlignment.center,
                            //                   children: [
                            //                     Container(
                            //                       // margin: EdgeInsets.all(10),
                            //                       // width: width * 0.3,
                            //                       // margin: EdgeInsets.symmetric(
                            //                       //     horizontal: 10),

                            //                       child: new DropdownButton<
                            //                           String>(
                            //                         underline: SizedBox(),
                            //                         textScaleFactor: 1,
                            //  style: TextStyle(
                            //                             color: Colors.black,
                            //                             fontSize: 11),
                            //                         value: controller
                            //                                     .insideStatus
                            //                                     .value
                            //                                     .toString() ==
                            //                                 '1'
                            //                             ? controller
                            //                                 .listinsideStatus[0]
                            //                                 .id
                            //                                 .toString()
                            //                             : controller
                            //                                 .insideStatus.value
                            //                                 .toString(),
                            //                         items: controller
                            //                             .listinsideStatus
                            //                             .map((value) {
                            //                           return new DropdownMenuItem<
                            //                               String>(
                            //                             value:
                            //                                 value.id.toString(),
                            //                             child: Container(
                            //                               width: width * 0.3,
                            //                               child: Center(
                            //                                 child: new Text(
                            //                                   locale ==
                            //                                           Locale(
                            //                                               'en')
                            //                                       ? value
                            //                                           .titleEn
                            //                                       : value
                            //                                           .titleAr,
                            //                                   textScaleFactor: 1,
                            //  style: TextStyle(
                            //                                       fontSize: 11,
                            //                                       fontWeight:
                            //                                           FontWeight
                            //                                               .w400,
                            //                                       fontFamily:
                            //                                           'Cairo',
                            //                                       color: AppColors
                            //                                           .primaryColor),
                            //                                 ),
                            //                               ),
                            //                             ),
                            //                           );
                            //                         }).toList(),
                            //                         onChanged: (value) {
                            //                           controller.insideStatus
                            //                                   .value =
                            //                               value.toString();
                            //                           // setState(() {
                            //                           //   selecteditem1 = value;
                            //                           // });
                            //                         },
                            //                       ),
                            //                     ),
                            //                   ],
                            //                 ),
                            //               )
                            //             ],
                            //           )
                            //         ],
                            //       ),
                            //       SizedBox(
                            //         height: 15,
                            //       ),
                            //       Row(
                            //         mainAxisAlignment:
                            //             MainAxisAlignment.spaceBetween,
                            //         children: [
                            //           Column(
                            //             children: [
                            //               Text(
                            //                 'Car_electracity'.tr,
                            //                 textScaleFactor: 1,
                            //  style: TextStyle(
                            //                     fontSize: 13,
                            //                     fontWeight: FontWeight.w500,
                            //                     fontFamily: 'Cairo',
                            //                     color: AppColors.primaryColor),
                            //               ),
                            //               SizedBox(
                            //                 height: 10,
                            //               ),
                            //               Container(
                            //                 height: 40,
                            //                 decoration: BoxDecoration(
                            //                     color: Color.fromRGBO(
                            //                         233, 236, 242, 1),
                            //                     borderRadius:
                            //                         BorderRadius.circular(0)),
                            //                 child: Row(
                            //                   mainAxisAlignment:
                            //                       MainAxisAlignment.center,
                            //                   children: [
                            //                     Container(
                            //                       // width: width * 0.3,

                            //                       // margin: EdgeInsets.all(10),
                            //                       child: new DropdownButton<
                            //                           String>(
                            //                         underline: SizedBox(),
                            //                         textScaleFactor: 1,
                            //  style: TextStyle(
                            //                             color: Colors.black,
                            //                             fontSize: 11),
                            //                         value: controller
                            //                                     .electricityStatus
                            //                                     .value
                            //                                     .toString() ==
                            //                                 '1'
                            //                             ? controller
                            //                                 .listelectricityStatus[
                            //                                     0]
                            //                                 .id
                            //                                 .toString()
                            //                             : controller
                            //                                 .electricityStatus
                            //                                 .value,
                            //                         items: controller
                            //                             .listelectricityStatus
                            //                             .map((value) {
                            //                           return new DropdownMenuItem<
                            //                               String>(
                            //                             value:
                            //                                 value.id.toString(),
                            //                             child: Container(
                            //                               width: width * 0.3,
                            //                               child: Center(
                            //                                 child: new Text(
                            //                                   locale ==
                            //                                           Locale(
                            //                                               'en')
                            //                                       ? value
                            //                                           .titleEn
                            //                                       : value
                            //                                           .titleAr,
                            //                                   textScaleFactor: 1,
                            //  style: TextStyle(
                            //                                       fontSize: 11,
                            //                                       fontWeight:
                            //                                           FontWeight
                            //                                               .w400,
                            //                                       fontFamily:
                            //                                           'Cairo',
                            //                                       color: AppColors
                            //                                           .primaryColor),
                            //                                 ),
                            //                               ),
                            //                             ),
                            //                           );
                            //                         }).toList(),
                            //                         onChanged: (value) {
                            //                           controller
                            //                               .electricityStatus
                            //                               .value = value;
                            //                           // setState(() {
                            //                           //   selecteditem1 = value;
                            //                           // });
                            //                         },
                            //                       ),
                            //                     ),
                            //                   ],
                            //                 ),
                            //               )
                            //             ],
                            //           ),
                            //           Column(
                            //             children: [
                            //               Text(
                            //                 'Car_tires'.tr,
                            //                 textScaleFactor: 1,
                            //  style: TextStyle(
                            //                     fontSize: 13,
                            //                     fontWeight: FontWeight.w500,
                            //                     fontFamily: 'Cairo',
                            //                     color: AppColors.primaryColor),
                            //               ),
                            //               SizedBox(
                            //                 height: 10,
                            //               ),
                            //               Container(
                            //                 height: 40,
                            //                 decoration: BoxDecoration(
                            //                     color: Color.fromRGBO(
                            //                         233, 236, 242, 1),
                            //                     borderRadius:
                            //                         BorderRadius.circular(0)),
                            //                 child: Row(
                            //                   mainAxisAlignment:
                            //                       MainAxisAlignment.center,
                            //                   children: [
                            //                     Container(
                            //                       // width: width * 0.3,

                            //                       // margin: EdgeInsets.all(10),
                            //                       child: new DropdownButton<
                            //                           String>(
                            //                         underline: SizedBox(),
                            //                         textScaleFactor: 1,
                            //  style: TextStyle(
                            //                             color: Colors.black,
                            //                             fontSize: 11),
                            //                         value: controller
                            //                                     .tiresStatus
                            //                                     .value
                            //                                     .toString() ==
                            //                                 '1'
                            //                             ? controller
                            //                                 .listtiresStatus[0]
                            //                                 .id
                            //                                 .toString()
                            //                             : controller
                            //                                 .tiresStatus.value
                            //                                 .toString(),
                            //                         items: controller
                            //                             .listtiresStatus
                            //                             .map((value) {
                            //                           return new DropdownMenuItem<
                            //                               String>(
                            //                             //substring(10)
                            //                             value:
                            //                                 value.id.toString(),
                            //                             child: SizedBox(
                            //                               width: width * 0.3,
                            //                               child: Center(
                            //                                 child: new Text(
                            //                                   locale ==
                            //                                           Locale(
                            //                                               'en')
                            //                                       ? value
                            //                                           .titleEn
                            //                                       : value
                            //                                           .titleAr,
                            //                                   textScaleFactor: 1,
                            //  style: TextStyle(
                            //                                       fontSize: 11,
                            //                                       fontWeight:
                            //                                           FontWeight
                            //                                               .w400,
                            //                                       fontFamily:
                            //                                           'Cairo',
                            //                                       color: AppColors
                            //                                           .primaryColor),
                            //                                 ),
                            //                               ),
                            //                             ),
                            //                           );
                            //                         }).toList(),
                            //                         onChanged: (value) {
                            //                           controller.tiresStatus
                            //                               .value = value;
                            //                           // setState(() {
                            //                           //   selecteditem1 = value;
                            //                           // });
                            //                         },
                            //                       ),
                            //                     ),
                            //                   ],
                            //                 ),
                            //               )
                            //             ],
                            //           ),
                            //         ],
                            //       ),
                            //       Column(
                            //         children: [
                            //           SizedBox(
                            //             height: 10,
                            //           ),
                            //           Text(
                            //             'Car_status_Confirm_type'.tr,
                            //             textScaleFactor: 1,
                            //  style: TextStyle(
                            //                 fontSize: 13,
                            //                 fontWeight: FontWeight.w500,
                            //                 fontFamily: 'Cairo',
                            //                 color: AppColors.primaryColor),
                            //           ),
                            //           SizedBox(
                            //             height: 10,
                            //           ),
                            //           Row(
                            //             mainAxisAlignment:
                            //                 MainAxisAlignment.spaceBetween,
                            //             children: [
                            //               InkWell(
                            //                 onTap: () {
                            //                   String id = controller
                            //                       .listcarCheckType[0].id
                            //                       .toString();
                            //                   controller.carCheckType.value =
                            //                       id;
                            //                   // print(controller
                            //                       .carCheckType.value);
                            //                 },
                            //                 child: Container(
                            //                   width: width * .3,
                            //                   decoration: BoxDecoration(
                            //                       color: controller.carCheckType
                            //                                   .value
                            //                                   .toString() ==
                            //                               controller
                            //                                   .listcarCheckType[
                            //                                       0]
                            //                                   .id
                            //                                   .toString()
                            //                           ? AppColors.primaryColor
                            //                           : Color.fromRGBO(
                            //                               233, 236, 242, 1),
                            //                       borderRadius:
                            //                           BorderRadius.circular(0)),
                            //                   child: Center(
                            //                     child: Text(
                            //                       locale == Locale('en')
                            //                           ? controller
                            //                               .listcarCheckType[0]
                            //                               .titleEn
                            //                           : controller
                            //                               .listcarCheckType[0]
                            //                               .titleAr,
                            //                       textScaleFactor: 1,
                            //  style: TextStyle(
                            //                           fontSize: 13,
                            //                           fontWeight:
                            //                               FontWeight.w500,
                            //                           fontFamily: 'Cairo',
                            //                           color: controller
                            //                                       .carCheckType
                            //                                       .value
                            //                                       .toString() ==
                            //                                   controller
                            //                                       .listcarCheckType[
                            //                                           0]
                            //                                       .id
                            //                                       .toString()
                            //                               ? Colors.white
                            //                               : AppColors
                            //                                   .primaryColor),
                            //                     ),
                            //                   ),
                            //                 ),
                            //               ),
                            //               InkWell(
                            //                 onTap: () {
                            //                   String id = controller
                            //                       .listcarCheckType[1].id
                            //                       .toString();
                            //                   controller.carCheckType.value =
                            //                       id;
                            //                   // print(controller
                            //                       .carCheckType.value);
                            //                 },
                            //                 child: Container(
                            //                   width: width * .3,
                            //                   decoration: BoxDecoration(
                            //                       color: controller.carCheckType
                            //                                   .value
                            //                                   .toString() ==
                            //                               controller
                            //                                   .listcarCheckType[
                            //                                       1]
                            //                                   .id
                            //                                   .toString()
                            //                           ? AppColors.primaryColor
                            //                           : Color.fromRGBO(
                            //                               233, 236, 242, 1),
                            //                       borderRadius:
                            //                           BorderRadius.circular(0)),
                            //                   child: Center(
                            //                     child: Text(
                            //                       locale == Locale('en')
                            //                           ? controller
                            //                               .listcarCheckType[1]
                            //                               .titleEn
                            //                           : controller
                            //                               .listcarCheckType[1]
                            //                               .titleAr,
                            //                       textScaleFactor: 1,
                            //                      style: TextStyle(
                            //                           fontSize: 13,
                            //                           fontWeight:
                            //                               FontWeight.w500,
                            //                           fontFamily: 'Cairo',
                            //                           color: controller
                            //                                       .carCheckType
                            //                                       .value
                            //                                       .toString() ==
                            //                                   controller
                            //                                       .listcarCheckType[
                            //                                           1]
                            //                                       .id
                            //                                       .toString()
                            //                               ? Colors.white
                            //                               : AppColors
                            //                                   .primaryColor),
                            //                     ),
                            //                   ),
                            //                 ),
                            //               )
                            //             ],
                            //           ),
                            //           SizedBox(
                            //             height: 10,
                            //           ),
                            //         ],
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            Container(
                              width: width * .9,
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.symmetric(vertical: 5),
                              decoration: BoxDecoration(
                                color: AppColors.whiteColor,
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                                fontSize: 15,
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
                                            lines: 1,
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return 'required'.tr;
                                              }
                                            },
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
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Text(
                                            'add_details'.tr,
                                            textScaleFactor: 1,
                                            style: TextStyle(
                                                fontSize: 15,
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
                                            lines: 4,
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return 'required'.tr;
                                              }
                                            },
                                            controller:
                                                controller.detailsController,
                                            label: '',
                                            type: TextInputType.text),
                                      ),
                                      SizedBox(height: 10)
                                    ],
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
                                                  'add_price'.tr,
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
                                                      .priceController,
                                                  label: '',
                                                  type: TextInputType.number),
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
                                                  'km'.tr,
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
                                                  controller:
                                                      controller.kmController,
                                                  label: '',
                                                  type: TextInputType.number),
                                            ),
                                            SizedBox(height: 10)
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    children: [
                                      //image Module
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Text(
                                            'add_photo'.tr,
                                            textScaleFactor: 1,
                                            style: TextStyle(
                                                fontSize: 15,
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
                                      Center(
                                        child: Container(
                                          width: width * .77,
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
                                      //image module
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
                                      // Row(
                                      //   mainAxisAlignment:
                                      //       MainAxisAlignment.spaceEvenly,
                                      //   children: [
                                      //     Container(
                                      //       width: 20,
                                      //     ),
                                      //     Container(
                                      //       width: width * .37,
                                      //       child: Column(
                                      //         children: [
                                      //           Align(
                                      //             alignment: Alignment.topRight,
                                      //             child: Text(
                                      //               'Governorate'.tr,
                                      //               textScaleFactor: 1,
                                      //                  style: TextStyle(
                                      //                   fontSize: 15,
                                      //                   fontWeight:
                                      //                       FontWeight.w500,
                                      //                   fontFamily: 'Cairo',
                                      //                   color: AppColors
                                      //                       .primaryColor),
                                      //             ),
                                      //           ),
                                      //           SizedBox(
                                      //             height: 10,
                                      //           ),
                                      //           Align(
                                      //             child: Container(
                                      //               height: 40,
                                      //               decoration: BoxDecoration(
                                      //                   color: Color.fromRGBO(
                                      //                       233, 236, 242, 1),
                                      //                   borderRadius:
                                      //                       BorderRadius
                                      //                           .circular(0)),
                                      //               child: Row(
                                      //                 mainAxisAlignment:
                                      //                     MainAxisAlignment
                                      //                         .center,
                                      //                 children: [
                                      //                   Container(
                                      //                     child: Center(
                                      //                       child:
                                      //                           new DropdownButton<
                                      //                               String>(
                                      //                         underline:
                                      //                             SizedBox(),
                                      //                         textScaleFactor: 1,
                                      //   style: TextStyle(
                                      //                             color: Colors
                                      //                                 .black,
                                      //                             fontSize: 11),
                                      //                         value: controller
                                      //                             .governorateid
                                      //                             .value
                                      //                             .toString(),
                                      //                         items: controller
                                      //                             .listgovernorate
                                      //                             .map((value) {
                                      //                           return new DropdownMenuItem<
                                      //                               String>(
                                      //                             value: value
                                      //                                 .id
                                      //                                 .toString(),
                                      //                             child:
                                      //                                 Container(
                                      //                               width:
                                      //                                   width *
                                      //                                       0.3,
                                      //                               // margin: EdgeInsets
                                      //                               //     .symmetric(
                                      //                               //         horizontal:
                                      //                               //             10),
                                      //                               child:
                                      //                                   Center(
                                      //                                 child:
                                      //                                     new Text(
                                      //                                   value
                                      //                                       .areaName,
                                      //                                   textScaleFactor: 1,
                                      //         style: TextStyle(
                                      //                                       fontSize:
                                      //                                           11,
                                      //                                       fontWeight: FontWeight
                                      //                                           .w500,
                                      //                                       fontFamily:
                                      //                                           'Cairo',
                                      //                                       color:
                                      //                                           AppColors.primaryColor),
                                      //                                 ),
                                      //                               ),
                                      //                             ),
                                      //                           );
                                      //                         }).toList(),
                                      //                         onChanged:
                                      //                             (value) {
                                      //                           // print(value);
                                      //                           controller
                                      //                                   .governorateid
                                      //                                   .value =
                                      //                               value
                                      //                                   .toString();
                                      //                           controller
                                      //                                   .areaid
                                      //                                   .value =
                                      //                               '1';
                                      //                           controller
                                      //                               .getarea(
                                      //                                   value);
                                      //                           // setState(() {
                                      //                           //   selecteditem1 = value;
                                      //                           // });
                                      //                         },
                                      //                       ),
                                      //                     ),
                                      //                   ),
                                      //                 ],
                                      //               ),
                                      //             ),
                                      //           ),
                                      //           SizedBox(height: 10)
                                      //         ],
                                      //       ),
                                      //     ),
                                      //     SizedBox(
                                      //       width: 10,
                                      //     ),
                                      //     controller.governorateloading.value ==
                                      //             true
                                      //         ? Center(
                                      //             child: SpinKitRing(
                                      //               color:
                                      //                   AppColors.primaryColor,
                                      //               size: 30,
                                      //             ),
                                      //           )
                                      //         : Container(
                                      //             width: width * .37,
                                      //             child: Column(
                                      //               children: [
                                      //                 Align(
                                      //                   alignment:
                                      //                       Alignment.topRight,
                                      //                   child: Text(
                                      //                     'area'.tr,
                                      //                     textScaleFactor: 1,
                                      //         style: TextStyle(
                                      //                         fontSize: 15,
                                      //                         fontWeight:
                                      //                             FontWeight
                                      //                                 .w500,
                                      //                         fontFamily:
                                      //                             'Cairo',
                                      //                         color: AppColors
                                      //                             .primaryColor),
                                      //                   ),
                                      //                 ),
                                      //                 SizedBox(
                                      //                   height: 10,
                                      //                 ),
                                      //                 Align(
                                      //                   child: Container(
                                      //                     height: 40,
                                      //                     decoration: BoxDecoration(
                                      //                         color: Color
                                      //                             .fromRGBO(
                                      //                                 233,
                                      //                                 236,
                                      //                                 242,
                                      //                                 1),
                                      //                         borderRadius:
                                      //                             BorderRadius
                                      //                                 .circular(
                                      //                                     0)),
                                      //                     child: Row(
                                      //                       mainAxisAlignment:
                                      //                           MainAxisAlignment
                                      //                               .center,
                                      //                       children: [
                                      //                         Container(
                                      //                           child: Center(
                                      //                             child:
                                      //                                 new DropdownButton<
                                      //                                     String>(
                                      //                               underline:
                                      //                                   SizedBox(),
                                      //                               textScaleFactor: 1,
                                      //         style: TextStyle(
                                      //                                   color: Colors
                                      //                                       .black,
                                      //                                   fontSize:
                                      //                                       11),
                                      //                               value: controller.areaid.value
                                      //                                           .toString() ==
                                      //                                       '1'
                                      //                                   ? controller
                                      //                                       .listarea[
                                      //                                           0]
                                      //                                       .id
                                      //                                       .toString()
                                      //                                   : controller
                                      //                                       .areaid
                                      //                                       .value
                                      //                                       .toString(),
                                      //                               items: controller
                                      //                                   .listarea
                                      //                                   .map(
                                      //                                       (value) {
                                      //                                 return new DropdownMenuItem<
                                      //                                     String>(
                                      //                                   value: value
                                      //                                       .id
                                      //                                       .toString(),
                                      //                                   child:
                                      //                                       Container(
                                      //                                     width:
                                      //                                         width * 0.3,
                                      //                                     // margin: EdgeInsets
                                      //                                     //     .symmetric(
                                      //                                     //         horizontal:
                                      //                                     //             10),
                                      //                                     child:
                                      //                                         Center(
                                      //                                       child:
                                      //                                           new Text(
                                      //                                         value.areaName,
                                      //                                         textScaleFactor: 1,

                                      //                                       ),
                                      //                                     ),
                                      //                                   ),
                                      //                                 );
                                      //                               }).toList(),
                                      //                               onChanged:
                                      //                                   (value) {
                                      //                                 controller
                                      //                                     .areaid
                                      //                                     .value = value.toString();
                                      //                                 // setState(() {
                                      //                                 //   selecteditem1 = value;
                                      //                                 // });
                                      //                               },
                                      //                             ),
                                      //                           ),
                                      //                         ),
                                      //                       ],
                                      //                     ),
                                      //                   ),
                                      //                 ),
                                      //                 SizedBox(height: 10)
                                      //               ],
                                      //             ),
                                      //           ),
                                      //   ],
                                      // ),
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
                                      Obx(() => controller.isuploading.value ==
                                                  true
                                              ? Center(
                                                  child: SpinKitRing(
                                                    color:
                                                        AppColors.primaryColor,
                                                    size: 50,
                                                  ),
                                                )
                                              : Container(
                                                  width: width * 0.5,
                                                  child: RoundedLoadingButton(
                                                    color:
                                                        AppColors.primaryColor,
                                                    child: Text(
                                                      'add_submit'.tr,
                                                      textScaleFactor: 1,
                                                      style: TextStyle(
                                                          fontSize: 22,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontFamily: 'Cairo',
                                                          color: AppColors
                                                              .whiteColor),
                                                    ),
                                                    controller: controller
                                                        .btnController,
                                                    onPressed: () {
                                                      final FormState form =
                                                          _formKey.currentState;
                                                      // print(form.validate());
                                                      if (form.validate()) {
                                                        controller
                                                            .submit(context);
                                                      } else {
                                                        controller.btnController
                                                            .error();
                                                        Future.delayed(
                                                            Duration(
                                                                milliseconds:
                                                                    1200),
                                                            () => controller
                                                                .btnController
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
                                                )
                                          //  InkWell(
                                          //     onTap: () {
                                          //       controller.submit(context);
                                          //     },
                                          //     child: Container(
                                          //       width: width * 0.4,
                                          //       decoration: BoxDecoration(
                                          //           color:
                                          //               AppColors.primaryColor,
                                          //           borderRadius:
                                          //               BorderRadius.circular(
                                          //                   15)),
                                          //       child: Container(
                                          //         margin: EdgeInsets.symmetric(
                                          //             vertical: 6,
                                          //             horizontal: 5),
                                          //         child: Center(
                                          //           child: Text(
                                          //             'add_submit'.tr,
                                          //             textScaleFactor: 1,
                                          //  style: TextStyle(
                                          //                 fontSize: 18,
                                          //                 fontWeight:
                                          //                     FontWeight.w500,
                                          //                 fontFamily: 'Cairo',
                                          //                 color: AppColors
                                          //                     .whiteColor),
                                          //           ),
                                          //         ),
                                          //       ),
                                          //     ),
                                          //   ),
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
