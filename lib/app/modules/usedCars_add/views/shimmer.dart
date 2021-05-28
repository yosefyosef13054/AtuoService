import 'package:autoservice/app/widgets/inputs/AccessoriesAddInput.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:autoservice/app/Colors.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerTest extends StatelessWidget {
  bool _enabled = true;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final locale = Get.locale;
    return Form(
      child: Container(
        decoration: BoxDecoration(),
        child: SingleChildScrollView(
          child: AnimationLimiter(
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300],
              highlightColor: Colors.grey[100],
              enabled: _enabled,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: AnimationConfiguration.toStaggeredList(
                  duration: const Duration(milliseconds: 600),
                  childAnimationBuilder: (widget) => SlideAnimation(
                    horizontalOffset: MediaQuery.of(context).size.width / 1,
                    child: SlideAnimation(child: widget),
                  ),
                  children: [
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
                                'Car_madeIn'.tr,
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
                          Container(
                            height: 40,
                            child: GetBuilder(
                              builder: (_dx) => ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 10,
                                itemBuilder: (_, __) {
                                  return InkWell(
                                    child: Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 5),
                                      width: width * 0.25,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: AppColors.primaryColor),
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                            vertical: 6, horizontal: 5),
                                        child: Center(
                                          child: Text(
                                            '',
                                            textScaleFactor: 1,
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'Cairo',
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
                        ])),
                    Container(
                      width: width * .9,
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.symmetric(vertical: 5),
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
                                  'Car_Type'.tr,
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
                                Container(
                                  width: width * .37,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColors.primaryColor),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [],
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
                                Container(
                                  width: width * .37,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColors.primaryColor),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [],
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
                        // Container(
                        //             height: 33,
                        //             // child: GetBuilder(
                        //             //   builder: (_dx) =>
                        //             //       ListView.builder(
                        //             //     scrollDirection:
                        //             //         Axis.horizontal,
                        //             //     itemCount:
                        //             //         controller.carYears.length,
                        //             //     itemBuilder: (_, __)  {
                        //             //       CarYears caryear = controller
                        //             //           .carYears
                        //             //           .elementAt(index);
                        //             //       // // print(caryear.title);
                        //             //       return InkWell(

                        //             //         child: Obx(
                        //             //           () => Container(
                        //             //             width: 60,
                        //             //             margin: EdgeInsets
                        //             //                 .symmetric(
                        //             //                     horizontal: 5,
                        //             //                     vertical: 1),
                        //             //             decoration: BoxDecoration(
                        //             //                 border: Border.all(
                        //             //                     color: AppColors
                        //             //                         .primaryColor),
                        //             //                 color: controller
                        //             //                             .carYear
                        //             //                             .value
                        //             //                             .toString() ==
                        //             //                         caryear.id
                        //             //                             .toString()
                        //             //                     ? AppColors
                        //             //                         .primaryColor
                        //             //                     : AppColors
                        //             //                         .whiteColor,
                        //             //                 borderRadius:
                        //             //                     BorderRadius
                        //             //                         .circular(
                        //             //                             15)),
                        //             //             child: Center(
                        //             //               child: Container(
                        //             //                 child: Text(
                        //             //                   caryear.title
                        //             //                       .toString(),
                        //             //                   textScaleFactor: 1,
                        //         style: TextStyle(
                        //             //                       fontSize: 15,
                        //             //                       fontWeight:
                        //             //                           FontWeight
                        //             //                               .w400,
                        //             //                       fontFamily:
                        //             //                           'Cairo',
                        //             //                       color: controller
                        //             //                                   .carYear
                        //             //                                   .value
                        //             //                                   .toString() ==
                        //             //                               controller
                        //             //                                   .carYears[
                        //             //                                       index]
                        //             //                                   .id
                        //             //                                   .toString()
                        //             //                           ? AppColors
                        //             //                               .whiteColor
                        //             //                           : AppColors
                        //             //                               .primaryColor),
                        //             //                 ),
                        //             //               ),
                        //             //             ),
                        //             //           ),
                        //             //         ),
                        //             //       );
                        //             //     },
                        //             //   ),
                        //             // ),
                        //           ),

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
                        //                 style: TextStyle(
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
                      ]),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'Car_status'.tr,
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
                                  Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(233, 236, 242, 1),
                                        borderRadius: BorderRadius.circular(0)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            // child: Center(
                                            //   child: new DropdownButton<
                                            //       String>(
                                            //     textScaleFactor: 1,
                                            //         style: TextStyle(
                                            //         color: Colors.black,
                                            //         fontSize: 11),
                                            //     value: controller
                                            //                 .carStatus
                                            //                 .value
                                            //                 .toString() ==
                                            //             '1'
                                            //         ? controller
                                            //             .listcarStatus[
                                            //                 0]
                                            //             .id
                                            //             .toString()
                                            //         : controller
                                            //             .carStatus.value
                                            //             .toString(),
                                            //     items: controller
                                            //         .listcarStatus
                                            //         .map((value) {
                                            //       return new DropdownMenuItem<
                                            //           String>(
                                            //         value: value.id
                                            //             .toString(),
                                            //         child: Container(
                                            //           width:
                                            //               width * 0.3,
                                            //           // margin: EdgeInsets
                                            //           //     .symmetric(
                                            //           //         horizontal:
                                            //           //             10),
                                            //           child: Center(
                                            //             child: new Text(
                                            //               locale ==
                                            //                       Locale(
                                            //                           'en')
                                            //                   ? value
                                            //                       .titleEn
                                            //                   : value
                                            //                       .titleAr,
                                            //               textScaleFactor: 1,
                                            //      style: TextStyle(
                                            //                   fontSize:
                                            //                       11,
                                            //                   fontWeight:
                                            //                       FontWeight
                                            //                           .w400,
                                            //                   fontFamily:
                                            //                       'Cairo',
                                            //                   color: AppColors
                                            //                       .primaryColor),
                                            //             ),
                                            //           ),
                                            //         ),
                                            //       );
                                            //     }).toList(),
                                            //     onChanged: (value) {
                                            //       controller.carStatus
                                            //               .value =
                                            //           value.toString();
                                            //       // setState(() {
                                            //       //   selecteditem1 = value;
                                            //       // });
                                            //     },
                                            //   ),
                                            // ),
                                            ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Spacer(),
                              Column(
                                children: [
                                  Text(
                                    'Car_inside_status'.tr,
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
                                  Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(233, 236, 242, 1),
                                        borderRadius: BorderRadius.circular(0)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        // Container(
                                        //   // margin: EdgeInsets.all(10),
                                        //   // width: width * 0.3,
                                        //   // margin: EdgeInsets.symmetric(
                                        //   //     horizontal: 10),

                                        //   child: new DropdownButton<
                                        //       String>(
                                        //     textScaleFactor: 1,
                                        //             style: TextStyle(
                                        //         color: Colors.black,
                                        //         fontSize: 11),
                                        //     value: controller
                                        //                 .insideStatus
                                        //                 .value
                                        //                 .toString() ==
                                        //             '1'
                                        //         ? controller
                                        //             .listinsideStatus[
                                        //                 0]
                                        //             .id
                                        //             .toString()
                                        //         : controller
                                        //             .insideStatus
                                        //             .value
                                        //             .toString(),
                                        //     items: controller
                                        //         .listinsideStatus
                                        //         .map((value) {
                                        //       return new DropdownMenuItem<
                                        //           String>(
                                        //         value: value.id
                                        //             .toString(),
                                        //         child: Container(
                                        //           width: width * 0.3,
                                        //           child: Center(
                                        //             child: new Text(
                                        //               locale ==
                                        //                       Locale(
                                        //                           'en')
                                        //                   ? value
                                        //                       .titleEn
                                        //                   : value
                                        //                       .titleAr,
                                        //               textScaleFactor: 1,
                                        //           style: TextStyle(
                                        //                   fontSize:
                                        //                       11,
                                        //                   fontWeight:
                                        //                       FontWeight
                                        //                           .w400,
                                        //                   fontFamily:
                                        //                       'Cairo',
                                        //                   color: AppColors
                                        //                       .primaryColor),
                                        //             ),
                                        //           ),
                                        //         ),
                                        //       );
                                        //     }).toList(),
                                        //     onChanged: (value) {
                                        //       controller.insideStatus
                                        //               .value =
                                        //           value.toString();
                                        //       // setState(() {
                                        //       //   selecteditem1 = value;
                                        //       // });
                                        //     },
                                        //   ),
                                        // ),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'Car_electracity'.tr,
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
                                  Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(233, 236, 242, 1),
                                        borderRadius: BorderRadius.circular(0)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        // Container(
                                        //   // width: width * 0.3,

                                        //   // margin: EdgeInsets.all(10),
                                        //   child: new DropdownButton<
                                        //       String>(
                                        //     textScaleFactor: 1,
                                        //        style: TextStyle(
                                        //         color: Colors.black,
                                        //         fontSize: 11),
                                        //     value: controller
                                        //                 .electricityStatus
                                        //                 .value
                                        //                 .toString() ==
                                        //             '1'
                                        //         ? controller
                                        //             .listelectricityStatus[
                                        //                 0]
                                        //             .id
                                        //             .toString()
                                        //         : controller
                                        //             .electricityStatus
                                        //             .value,
                                        //     items: controller
                                        //         .listelectricityStatus
                                        //         .map((value) {
                                        //       return new DropdownMenuItem<
                                        //           String>(
                                        //         value: value.id
                                        //             .toString(),
                                        //         child: Container(
                                        //           width: width * 0.3,
                                        //           child: Center(
                                        //             child: new Text(
                                        //               locale ==
                                        //                       Locale(
                                        //                           'en')
                                        //                   ? value
                                        //                       .titleEn
                                        //                   : value
                                        //                       .titleAr,
                                        //               textScaleFactor: 1,
                                        //     style: TextStyle(
                                        //                   fontSize:
                                        //                       11,
                                        //                   fontWeight:
                                        //                       FontWeight
                                        //                           .w400,
                                        //                   fontFamily:
                                        //                       'Cairo',
                                        //                   color: AppColors
                                        //                       .primaryColor),
                                        //             ),
                                        //           ),
                                        //         ),
                                        //       );
                                        //     }).toList(),
                                        //     onChanged: (value) {
                                        //       controller
                                        //           .electricityStatus
                                        //           .value = value;
                                        //       // setState(() {
                                        //       //   selecteditem1 = value;
                                        //       // });
                                        //     },
                                        //   ),
                                        //   ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Car_tires'.tr,
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
                                  Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(233, 236, 242, 1),
                                        borderRadius: BorderRadius.circular(0)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        // Container(
                                        //   // width: width * 0.3,

                                        //   // margin: EdgeInsets.all(10),
                                        //   child: new DropdownButton<
                                        //       String>(
                                        //     textScaleFactor: 1,
                                        //    style: TextStyle(
                                        //         color: Colors.black,
                                        //         fontSize: 11),
                                        //     value: controller
                                        //                 .tiresStatus
                                        //                 .value
                                        //                 .toString() ==
                                        //             '1'
                                        //         ? controller
                                        //             .listtiresStatus[
                                        //                 0]
                                        //             .id
                                        //             .toString()
                                        //         : controller
                                        //             .tiresStatus.value
                                        //             .toString(),
                                        //     items: controller
                                        //         .listtiresStatus
                                        //         .map((value) {
                                        //       return new DropdownMenuItem<
                                        //           String>(
                                        //         //substring(10)
                                        //         value: value.id
                                        //             .toString(),
                                        //         child: SizedBox(
                                        //           width: width * 0.3,
                                        //           child: Center(
                                        //             child: new Text(
                                        //               locale ==
                                        //                       Locale(
                                        //                           'en')
                                        //                   ? value
                                        //                       .titleEn
                                        //                   : value
                                        //                       .titleAr,
                                        //               textScaleFactor: 1,
                                        //               style: TextStyle(
                                        //                   fontSize:
                                        //                       11,
                                        //                   fontWeight:
                                        //                       FontWeight
                                        //                           .w400,
                                        //                   fontFamily:
                                        //                       'Cairo',
                                        //                   color: AppColors
                                        //                       .primaryColor),
                                        //             ),
                                        //           ),
                                        //         ),
                                        //       );
                                        //     }).toList(),
                                        //     onChanged: (value) {
                                        //       controller.tiresStatus
                                        //           .value = value;
                                        //       // setState(() {
                                        //       //   selecteditem1 = value;
                                        //       // });
                                        //     },
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
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
                                    child: Container(
                                      width: width * .3,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(0)),
                                      child: Center(
                                        child: Text(
                                          '',
                                          textScaleFactor: 1,
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Cairo',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    // onTap: () {
                                    //   String id = controller
                                    //       .listcarCheckType[1].id
                                    //       .toString();
                                    //   controller.carCheckType.value =
                                    //       id;
                                    //   // print(controller
                                    //       .carCheckType.value);
                                    // },
                                    child: Container(
                                      width: width * .3,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(0)),
                                      child: Center(
                                        child: Text(
                                          '',
                                          textScaleFactor: 1,
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Cairo',
                                          ),
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
                          ),
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
                                    // controller:
                                    //     controller.detailsController,
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
                                    // controller:
                                    //     controller.priceController,
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
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Cairo',
                                        color: AppColors.primaryColor),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Center(
                                child: Container(
                                  width: width * .81,
                                  padding: EdgeInsets.all(10),
                                  margin: EdgeInsets.symmetric(vertical: 5),
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(233, 236, 242, 1),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        children: [
                                          InkWell(
                                            child: Container(
                                              width: width * .22,
                                              height: height * 0.1,
                                              padding: EdgeInsets.all(10),
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 5),
                                              child: Center(),
                                            ),
                                          ),
                                          InkWell(
                                            child: Stack(
                                              children: [
                                                Container(
                                                  width: width * .22,
                                                  height: height * 0.1,
                                                  padding: EdgeInsets.all(10),
                                                  margin: EdgeInsets.symmetric(
                                                      vertical: 5),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0),
                                                  ),
                                                  child: Center(
                                                    child: Icon(Icons.add),
                                                  ),
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
                              SizedBox(
                                height: 15,
                              ),
                              RoundedLoadingButton(
                                color: AppColors.primaryColor,
                                child: Text(
                                  'add_submit'.tr,
                                  textScaleFactor: 1,
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w200,
                                      fontFamily: 'Cairo',
                                      color: AppColors.whiteColor),
                                ),

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
                                //             style: TextStyle(
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
    );
  }
}
