import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:autoservice/app/modules/scrap_request2/views/scrap_request2_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:autoservice/app/modules/usedCars_add/models/model.dart';
import 'package:autoservice/app/widgets/inputs/AccessoriesAddInput.dart';
import 'record.dart';
import 'package:autoservice/app/modules/scrap_request/controllers/scrap_request_controller.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:autoservice/app/Colors.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shimmer/shimmer.dart';
import 'package:record/record.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:toast/toast.dart';
import 'package:autoservice/app/modules/chat/views/widgets/bubble/widgets/messages_type/audio/audio_slider.dart';

class ScrapRequestView extends GetView<ScrapRequestController> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Rx<IconData> playBtn = Icons.play_arrow.obs;
  Rx<Duration> _position = (Duration()).obs;
  Rx<Duration> _musicLength = (Duration()).obs;
  String recordTime = '';
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final locale = Get.locale;

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
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
      body: Form(
        key: _formKey,
        child: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(),
          child: AnimationLimiter(
            child: Obx(
              () => controller.loading.value == true
                  ? ShimmerBuild(
                      width: width,
                    )
                  : SingleChildScrollView(
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
                                      height: 30,
                                      child: GetBuilder(
                                        builder: (_dx) => ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount:
                                              controller.carRegions.length,
                                          itemBuilder: (context, index) {
                                            String id = controller
                                                .carRegions[index].id
                                                .toString();
                                            return Obx(() => InkWell(
                                                  onTap: () {
                                                    controller.madein.value =
                                                        id;
                                                    // controller.setMadeINvalue(controller
                                                    //     .carRegions[index].id);
                                                    // var regionId = controller.carRegions
                                                    //     .where((element) =>
                                                    //         element.name.toString() ==
                                                    //         controller.madein.value
                                                    //             .toString());
                                                    // List regions = controller.carRegions;

                                                    controller.getcatTypes(
                                                        controller
                                                            .carRegions[index]
                                                            .id
                                                            .toString());
                                                    controller.cartypeId.value =
                                                        '0';
                                                  },
                                                  child: Container(
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 5),
                                                    width: width * 0.25,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: AppColors
                                                                .primaryColor),
                                                        color: controller.madein
                                                                    .value
                                                                    .toString() ==
                                                                controller
                                                                    .carRegions[
                                                                        index]
                                                                    .id
                                                                    .toString()
                                                            ? AppColors
                                                                .primaryColor
                                                            : AppColors
                                                                .whiteColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8)),
                                                    child: Container(
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              vertical: 0,
                                                              horizontal: 5),
                                                      child: Center(
                                                        child: Text(
                                                          locale == Locale('en')
                                                              ? controller
                                                                  .carRegions[
                                                                      index]
                                                                  .regionNameEn
                                                                  .toString()
                                                              : controller
                                                                  .carRegions[
                                                                      index]
                                                                  .regionNameAr,
                                                          textScaleFactor: 1,
                                                          style: TextStyle(
                                                              fontSize: 13,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontFamily:
                                                                  'Cairo',
                                                              color: controller
                                                                          .madein
                                                                          .value
                                                                          .toString() ==
                                                                      controller
                                                                          .carRegions[
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
                                                ));
                                          },
                                        ),
                                      ),
                                    ),
                                  ])),
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
                                child: Column(children: [
                                  //model and type
                                  Obx(
                                    () => Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        // controller.getcatTypesloading
                                        //             .value ==
                                        //         true
                                        //     ? Center(
                                        //         child: SpinKitRing(
                                        //           color: AppColors
                                        //               .primaryColor,
                                        //           size: 30,
                                        //         ),
                                        //       )
                                        //     :
                                        Column(
                                          children: [
                                            Text(
                                              'Car_Type'.tr,
                                              textScaleFactor: 1,
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: 'Cairo',
                                                  color:
                                                      AppColors.primaryColor),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              width: width * .37,
                                              height: 33,
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
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    // margin: EdgeInsets.all(10),
                                                    child: new DropdownButton<
                                                        String>(
                                                      underline: SizedBox(),
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 12),
                                                      value: controller
                                                          .cartypeId.value
                                                          .toString(),
                                                      items: controller.carTypes
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
                                                        controller.cartypeId
                                                                .value =
                                                            value.toString();
                                                        controller.getcarModels(
                                                            value);

                                                        controller.carmodelId
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
                                                  color:
                                                      AppColors.primaryColor),
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
                                              height: 33,
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
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    // margin: EdgeInsets.all(10),
                                                    child: Obx(
                                                      () => DropdownButton<
                                                          String>(
                                                        underline: SizedBox(),
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
                                                          controller.carmodelId
                                                              .value = value;
                                                          controller
                                                              .getcarYears(
                                                                  value);
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
                                                  caryear.name.toString());
                                              // print(caryear.name.toString());
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
                                                            caryear.name
                                                                .toString()
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
                                                                      .name
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
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        // Icon(
                                        //   Icons.location_pin,
                                        //   color: AppColors.primaryColor,
                                        // ),
                                        // Image.asset(
                                        //   'assets/images/icons/Ta2min/Ta3min(7).png',
                                        //   height: 20,
                                        //   width: 20,
                                        // ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          'scrapLocation'.tr,
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
                                          itemCount:
                                              controller.carLocation.length,
                                          itemBuilder: (context, index) {
                                            var caryear = controller.carLocation
                                                .elementAt(index);
                                            // // print(caryear.title);
                                            return InkWell(
                                              onTap: () {
                                                controller.changelocationId(
                                                    caryear.id.toString());
                                                // print(caryear.name.toString());
                                                // controller.carYear.value =
                                                //     caryear.id.toString();
                                                // // print(caryear.id.toString());
                                              },
                                              child: Obx(
                                                () => Container(
                                                  width: width * 0.25,
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 5,
                                                      vertical: 1),
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: AppColors
                                                              .primaryColor),
                                                      color: controller
                                                                  .locationId
                                                                  .value
                                                                  .toString() ==
                                                              caryear.id
                                                                  .toString()
                                                          ? AppColors
                                                              .primaryColor
                                                          : AppColors
                                                              .whiteColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8)),
                                                  child: Center(
                                                    child: Container(
                                                      child: Text(
                                                        caryear.title
                                                            .toString(),
                                                        textScaleFactor: 1,
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontFamily: 'Cairo',
                                                            color: controller
                                                                        .locationId
                                                                        .value
                                                                        .toString() ==
                                                                    controller
                                                                        .carLocation[
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
                                  ],
                                ),
                              ),
                            ),

                            //spaciality
                            Center(
                              child: Container(
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
                                        // Icon(
                                        //   Icons.location_pin,
                                        //   color: AppColors.primaryColor,
                                        // ),
                                        // Image.asset(
                                        //   'assets/images/icons/Ta2min/Ta3min(7).png',
                                        //   height: 20,
                                        //   width: 20,
                                        // ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          'scrapspaciality'.tr,
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
                                          itemCount:
                                              controller.carSpacialty.length,
                                          itemBuilder: (context, index) {
                                            var caryear = controller
                                                .carSpacialty
                                                .elementAt(index);
                                            // // print(caryear.title);
                                            return InkWell(
                                              onTap: () {
                                                controller.changespaciaityId(
                                                    caryear.id.toString());
                                                // print(caryear.name.toString());
                                                // controller.carYear.value =
                                                //     caryear.id.toString();
                                                // // print(caryear.id.toString());
                                              },
                                              child: Obx(
                                                () => Container(
                                                  width: width * 0.25,
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 5,
                                                      vertical: 1),
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: AppColors
                                                              .primaryColor),
                                                      color: controller
                                                                  .spaciaityId
                                                                  .value
                                                                  .toString() ==
                                                              caryear.id
                                                                  .toString()
                                                          ? AppColors
                                                              .primaryColor
                                                          : AppColors
                                                              .whiteColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8)),
                                                  child: Center(
                                                    child: Container(
                                                      child: Text(
                                                        caryear.title
                                                            .toString(),
                                                        textScaleFactor: 1,
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontFamily: 'Cairo',
                                                            color: controller
                                                                        .spaciaityId
                                                                        .value
                                                                        .toString() ==
                                                                    controller
                                                                        .carSpacialty[
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
                                  ],
                                ),
                              ),
                            ),
                            //spaciality

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
                                                    color:
                                                        AppColors.primaryColor),
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
                                                controller: controller
                                                    .detailsController,
                                                label: '',
                                                type: TextInputType.text),
                                          ),
                                          SizedBox(height: 10)
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          //Recoreder Icon( working )
                                          controller.isRecording.value == false
                                              ? InkWell(
                                                  onTap: () =>
                                                      controller.startRecord(),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color: AppColors
                                                            .primaryColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(25)),
                                                    child: Container(
                                                        margin:
                                                            EdgeInsets.all(10),
                                                        child: Icon(
                                                          Icons.mic,
                                                          size: 22,
                                                          color: Colors.white,
                                                        )),
                                                  ),
                                                )
                                              : InkWell(
                                                  onTap: () =>
                                                      controller.stopRecord(),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color: AppColors
                                                            .primaryColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(25)),
                                                    child: Container(
                                                        margin:
                                                            EdgeInsets.all(10),
                                                        child: Icon(
                                                          Icons.stop,
                                                          size: 22,
                                                          color: Colors.white,
                                                        )),
                                                  ),
                                                ),
                                          controller.isRecording.value == false
                                              ? SizedBox()
                                              : RecordTime(),
                                          //Recoreder Icon( working )
                                          SizedBox(
                                            width: 20,
                                          ),
                                          //Image ICON
                                          // Container(
                                          //   decoration: BoxDecoration(
                                          //       color: AppColors
                                          //           .primaryColor,
                                          //       borderRadius:
                                          //           BorderRadius
                                          //               .circular(25)),
                                          //   child: Container(
                                          //       margin:
                                          //           EdgeInsets.all(10),
                                          //       child: Icon(
                                          //         Icons.camera_alt,
                                          //         size: 22,
                                          //         color: Colors.white,
                                          //       )),
                                          // ),
                                        ],
                                      ),
                                      //Audio Player
                                      // Obx(() => PlayerBuilder.currentPosition(
                                      //     player: controller
                                      //         .assetsAudioPlayer.value,
                                      //     builder: (context, duration) {
                                      //       return Text(duration.toString());
                                      //     })

                                      // ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      controller.avaToPlayRecord.value == false
                                          ? SizedBox()
                                          : Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    controller.recordFilePath
                                                        .value = "";
                                                    controller
                                                        .avaToPlayRecord(false);
                                                  },
                                                  child: CircleAvatar(
                                                    child: Icon(
                                                      Icons.close,
                                                      size: 12,
                                                    ),
                                                    backgroundColor: Colors.red,
                                                    radius: 10,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 12,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Obx(() =>
                                                        AudioMessageComponents
                                                            .buildAudioButton(
                                                                () async {
                                                          if (playBtn.value ==
                                                              Icons
                                                                  .play_arrow) {
                                                            try {
                                                              playBtn.value = Icons
                                                                  .pause_outlined;
                                                              controller
                                                                  .assetsAudioPlayer
                                                                  .value
                                                                  .stop();
                                                              await AudioMessageComponents
                                                                  .checkAudioPath(
                                                                controller
                                                                    .recordFilePath
                                                                    .value,
                                                                controller
                                                                    .assetsAudioPlayer
                                                                    .value,
                                                                _position,
                                                                _musicLength,
                                                              );
                                                            } catch (e) {
                                                              AudioMessageComponents
                                                                  .onPlayRecordError(
                                                                      context);
                                                            }
                                                          } else {
                                                            playBtn.value =
                                                                Icons
                                                                    .play_arrow;
                                                            controller
                                                                .assetsAudioPlayer
                                                                .value
                                                                .stop();
                                                            // print("here2");
                                                          }

                                                          controller
                                                              .assetsAudioPlayer
                                                              .value
                                                              .playlistAudioFinished
                                                              .listen((event) {
                                                            playBtn.value =
                                                                Icons
                                                                    .play_arrow;
                                                            _position =
                                                                Duration().obs;
                                                            _musicLength =
                                                                Duration().obs;
                                                          });
                                                        }, playBtn.value)),
                                                    SizedBox(
                                                      width: 6,
                                                    ),
                                                    Obx(() => AudioMessageComponents
                                                        .buildAudioSlider(
                                                            recordTime,
                                                            controller
                                                                .assetsAudioPlayer
                                                                .value,
                                                            _musicLength.value,
                                                            _position.value)),
                                                  ],
                                                ),
                                              ],
                                            ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      //Audio Player
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
                                                                                            controller.removeImage(index, item: controller.image[index].toString());
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
                                        height: 10,
                                      ),
                                      //governet and area
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
                                      //               style: TextStyle(
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
                                      //                       child: Obx(
                                      //                         () =>
                                      //                             DropdownButton<
                                      //                                 String>(
                                      //                           underline:
                                      //                               SizedBox(),
                                      //                           style: TextStyle(
                                      //                               color: Colors
                                      //                                   .black,
                                      //                               fontSize:
                                      //                                   11),
                                      //                           value: controller
                                      //                               .governorateid
                                      //                               .value
                                      //                               .toString(),
                                      //                           items: controller
                                      //                               .listgovernorate
                                      //                               .map(
                                      //                                   (value) {
                                      //                             return new DropdownMenuItem<
                                      //                                 String>(
                                      //                               value: value
                                      //                                   .id
                                      //                                   .toString(),
                                      //                               child:
                                      //                                   Container(
                                      //                                 width:
                                      //                                     width *
                                      //                                         0.3,
                                      //                                 // margin: EdgeInsets
                                      //                                 //     .symmetric(
                                      //                                 //         horizontal:
                                      //                                 //             10),
                                      //                                 child:
                                      //                                     Center(
                                      //                                   child:
                                      //                                       new Text(
                                      //                                     value
                                      //                                         .areaName,
                                      //                                     textScaleFactor:
                                      //                                         1,
                                      //                                     style: TextStyle(
                                      //                                         fontSize: 11,
                                      //                                         fontWeight: FontWeight.w500,
                                      //                                         fontFamily: 'Cairo',
                                      //                                         color: AppColors.primaryColor),
                                      //                                   ),
                                      //                                 ),
                                      //                               ),
                                      //                             );
                                      //                           }).toList(),
                                      //                           onChanged:
                                      //                               (value) {
                                      //                             // print(value);
                                      //                             controller
                                      //                                     .governorateid
                                      //                                     .value =
                                      //                                 value
                                      //                                     .toString();
                                      //                             controller
                                      //                                 .areaid
                                      //                                 .value = '0';
                                      //                             controller
                                      //                                 .getarea(
                                      //                                     value);
                                      //                             // setState(() {
                                      //                             //   selecteditem1 = value;
                                      //                             // });
                                      //                           },
                                      //                         ),
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
                                      //     // controller.governorateloading.value ==
                                      //     //         true
                                      //     //     ? Center(
                                      //     //         child: SpinKitRing(
                                      //     //           color:
                                      //     //               AppColors.primaryColor,
                                      //     //           size: 30,
                                      //     //         ),
                                      //     //       )
                                      //     //     :
                                      //     Container(
                                      //       width: width * .37,
                                      //       child: Column(
                                      //         children: [
                                      //           Align(
                                      //             alignment: Alignment.topRight,
                                      //             child: Text(
                                      //               'area'.tr,
                                      //               textScaleFactor: 1,
                                      //               style: TextStyle(
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
                                      //                       child: Obx(
                                      //                         () =>
                                      //                             DropdownButton<
                                      //                                 String>(
                                      //                           underline:
                                      //                               SizedBox(),
                                      //                           style: TextStyle(
                                      //                               color: Colors
                                      //                                   .black,
                                      //                               fontSize:
                                      //                                   11),
                                      //                           value: controller
                                      //                               .areaid
                                      //                               .value
                                      //                               .toString(),
                                      //                           items: controller
                                      //                               .listarea
                                      //                               .map(
                                      //                                   (value) {
                                      //                             return new DropdownMenuItem<
                                      //                                 String>(
                                      //                               value: value
                                      //                                   .id
                                      //                                   .toString(),
                                      //                               child:
                                      //                                   Container(
                                      //                                 width:
                                      //                                     width *
                                      //                                         0.3,
                                      //                                 // margin: EdgeInsets
                                      //                                 //     .symmetric(
                                      //                                 //         horizontal:
                                      //                                 //             10),
                                      //                                 child:
                                      //                                     Center(
                                      //                                   child:
                                      //                                       new Text(
                                      //                                     value
                                      //                                         .areaName,
                                      //                                     textScaleFactor:
                                      //                                         1,
                                      //                                     style: TextStyle(
                                      //                                         fontSize: 11,
                                      //                                         fontWeight: FontWeight.w500,
                                      //                                         fontFamily: 'Cairo',
                                      //                                         color: AppColors.primaryColor),
                                      //                                   ),
                                      //                                 ),
                                      //                               ),
                                      //                             );
                                      //                           }).toList(),
                                      //                           onChanged:
                                      //                               (value) {
                                      //                             controller
                                      //                                     .areaid
                                      //                                     .value =
                                      //                                 value
                                      //                                     .toString();
                                      //                             // setState(() {
                                      //                             //   selecteditem1 = value;
                                      //                             // });
                                      //                           },
                                      //                         ),
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
                                      //   ],
                                      // ),
                                      //governet and area
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            InkWell(
                              child: Center(
                                child: Container(
                                  child: Container(
                                    width: width * 0.5,
                                    child: RoundedLoadingButton(
                                      color: AppColors.primaryColor,
                                      child: Text(
                                        'sendscrap_request'.tr,
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
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColors.whiteColor),
                                      color: AppColors.primaryColor,
                                      borderRadius: BorderRadius.circular(15)),
                                  height: 45,
                                  width: width * 0.5,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 25,
                            ),
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

//loading

class ShimmerBuild extends StatelessWidget {
  const ShimmerBuild({
    Key key,
    @required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Shimmer.fromColors(
      baseColor: Colors.grey[300],
      highlightColor: Colors.grey[100],
      enabled: true,
      child: Column(
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
                          margin:
                              EdgeInsets.symmetric(vertical: 6, horizontal: 5),
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
                            border: Border.all(color: AppColors.primaryColor),
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(8)),
                        child: Container(
                          margin:
                              EdgeInsets.symmetric(vertical: 6, horizontal: 5),
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
                            border: Border.all(color: AppColors.primaryColor),
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(8)),
                        child: Container(
                          margin:
                              EdgeInsets.symmetric(vertical: 6, horizontal: 5),
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
                              border: Border.all(color: AppColors.primaryColor),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.all(10),
                                child: new DropdownButton<String>(
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 14),
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
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'Cairo',
                                              color: AppColors.primaryColor),
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
                              border: Border.all(color: AppColors.primaryColor),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.all(10),
                                child: new DropdownButton<String>(
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 14),
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
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'Cairo',
                                              color: AppColors.primaryColor),
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
                        margin:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.primaryColor),
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
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AudioMessageComponents {
  static checkAudioPath(String message, AssetsAudioPlayer myPlayer,
      Rx<Duration> position, Rx<Duration> musicLength) async {
    if (message.contains('auto_serv')) {
      myPlayer.stop();
      myPlayer.open(
        Audio.file(message),
        showNotification: true,
      );
    } else {
      myPlayer.stop();
      await myPlayer.open(
        Audio.network(message, cached: true),
        showNotification: true,
      );
    }

    myPlayer.realtimePlayingInfos.listen((event) {
      // // print(event);
      position.value = event.currentPosition;
      musicLength.value = event.duration;
    });
  }

  static Widget buildAudioSlider(String recordTime, AssetsAudioPlayer myPlayer,
          Duration duration, Duration currentPosition) =>
      AudioSlider(recordTime, duration, currentPosition, Get.theme.primaryColor,
          Get.theme.accentColor, (to) {
        myPlayer.seek(to);
      });

  static buildAudioButton(onTap, icon) => InkWell(
        onTap: onTap,
        child: CircleAvatar(
          backgroundColor: Get.theme.primaryColor,
          child: Icon(icon),
        ),
      );

  static onPlayRecordError(context) {
    Toast.show("audio-error-tittle".tr, context);
  }
}
