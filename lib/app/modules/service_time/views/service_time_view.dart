import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:autoservice/app/modules/service_time/controllers/service_time_controller.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:autoservice/app/Colors.dart';
import 'package:autoservice/app/modules/cars_services/model.dart';
import 'package:autoservice/app/modules/cars_services/controllers/cars_services_controller.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ServiceTimeView extends GetView<ServiceTimeController> {
  ServiceTimeController controller = Get.put(ServiceTimeController());

  CarsServicesController serviceController = Get.put(CarsServicesController());
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor:
          // Color.fromRGBO(255, 255, 255, 1),
          Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0.0,
        centerTitle: true,
        toolbarHeight: height * .1,
        title: Text(
          'Select_data_time'.tr,
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
        decoration: BoxDecoration(
          color: Colors.white,
        ),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 30),
                              child: Column(
                                children: [
                                  Text('day'.tr.toString(),
                                      textScaleFactor: 1,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Cairo',
                                          color: Colors.black)),
                                  Container(
                                    height: height * .8,
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 10, vertical: 10),
                                              decoration: BoxDecoration(
                                                  color: Color.fromRGBO(
                                                      239, 244, 255, 1),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              child: Obx(
                                                () =>
                                                    controller.date_time_loading
                                                                .value ==
                                                            true
                                                        ? Container()
                                                        : Container(
                                                            width: width * .45,
                                                            margin: EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        20),
                                                            decoration: BoxDecoration(
                                                                color: Color
                                                                    .fromRGBO(
                                                                        239,
                                                                        244,
                                                                        255,
                                                                        1),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20)),
                                                            child: ListView
                                                                .builder(
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              itemCount: controller
                                                                  .listdate_time_
                                                                  .length,
                                                              shrinkWrap: true,
                                                              physics:
                                                                  NeverScrollableScrollPhysics(),
                                                              itemBuilder:
                                                                  (context,
                                                                      index) {
                                                                return Obx(
                                                                  () => InkWell(
                                                                    onTap: () {
                                                                      controller
                                                                          .selectedTime
                                                                          .value = false;
                                                                      controller
                                                                          .choosenTime
                                                                          .clear();
                                                                      controller
                                                                          .choosenTime
                                                                          .addAll(controller
                                                                              .listdate_time_[index]
                                                                              .times);

                                                                      controller
                                                                              .date_time
                                                                              .value =
                                                                          controller
                                                                              .listdate_time_[index]
                                                                              .itemDate;
                                                                      // // print(controller
                                                                      //     .listdate_time_[
                                                                      //         index]
                                                                      //     .itemDate);
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          width *
                                                                              .4,
                                                                      height:
                                                                          50,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: controller.date_time.value == controller.listdate_time_[index].itemDate
                                                                            ? AppColors
                                                                                .primaryColor
                                                                            : Color.fromRGBO(
                                                                                239,
                                                                                244,
                                                                                255,
                                                                                1),
                                                                      ),
                                                                      child:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceAround,
                                                                        children: [
                                                                          Text(
                                                                              controller.listdate_time_[index].dayName.toString(),
                                                                              textScaleFactor: 1,
                                                                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, fontFamily: 'Cairo', color: controller.date_time.value == controller.listdate_time_[index].itemDate ? AppColors.whiteColor : Colors.black)),
                                                                          Text(
                                                                              controller.listdate_time_[index].dayOfMonth.toString(),
                                                                              textScaleFactor: 1,
                                                                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, fontFamily: 'Cairo', color: controller.date_time.value == controller.listdate_time_[index].itemDate ? AppColors.whiteColor : Colors.black)),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          ),
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Obx(
                              () => Container(
                                margin: EdgeInsets.symmetric(vertical: 30),
                                child: Column(
                                  children: [
                                    Container(
                                      child: Center(
                                        child: Text('time'.tr.toString(),
                                            textScaleFactor: 1,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: 'Cairo',
                                                color: Colors.black)),
                                      ),
                                    ),
                                    controller.choosenTime.length <= 0
                                        //&&
                                        // controller.date_time_loading.value ==
                                        //     false
                                        ? Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: 30, horizontal: 30),
                                            child: Center(
                                              child: Text(
                                                  'notimes'.tr.toString(),
                                                  textScaleFactor: 1,
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontFamily: 'Cairo',
                                                      color: Colors.black)),
                                            ),
                                          )
                                        : Container(
                                            height: height * .8,
                                            child: SingleChildScrollView(
                                              child: Column(
                                                children: [
                                                  Container(
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 5,
                                                              vertical: 10),
                                                      decoration: BoxDecoration(
                                                          // border:
                                                          //     Border.all(color: AppColors.primaryColor),
                                                          color: Color.fromRGBO(
                                                              239, 244, 255, 1),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20)),
                                                      child: Obx(
                                                        () => controller.date_time_loading
                                                                        .value ==
                                                                    true ||
                                                                controller
                                                                        .choosenTime
                                                                        .length <=
                                                                    0
                                                            ? Container()
                                                            : Container(
                                                                width:
                                                                    width * .45,
                                                                margin: EdgeInsets
                                                                    .symmetric(
                                                                        vertical:
                                                                            20),
                                                                decoration:
                                                                    BoxDecoration(
                                                                        // border:
                                                                        //     Border.all(color: AppColors.primaryColor),
                                                                        color: Color.fromRGBO(
                                                                            239,
                                                                            244,
                                                                            255,
                                                                            1),
                                                                        borderRadius:
                                                                            BorderRadius.circular(20)),
                                                                child: Obx(
                                                                  () => ListView
                                                                      .builder(
                                                                    scrollDirection:
                                                                        Axis.vertical,
                                                                    itemCount: controller
                                                                        .choosenTime
                                                                        .length,
                                                                    // padding: const EdgeInsets.all(12),
                                                                    shrinkWrap:
                                                                        true,
                                                                    physics:
                                                                        NeverScrollableScrollPhysics(),
                                                                    itemBuilder:
                                                                        (context,
                                                                            index) {
                                                                      return Obx(
                                                                        () =>
                                                                            InkWell(
                                                                          onTap:
                                                                              () {
                                                                            // print(controller.choosenTime[index].isActive.toString());
                                                                            // print(controller.choosenTime[index].id);
                                                                            if (controller.choosenTime[index].isActive.toString() ==
                                                                                true.toString()) {
                                                                              controller.selectedTime.value = true;
                                                                              controller.time_id.value = controller.choosenTime[index].id.toString();
                                                                            }
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                width * .4,
                                                                            height:
                                                                                50,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: controller.choosenTime[index].isActive.toString() == false.toString()
                                                                                  ? Colors.grey[300]
                                                                                  : controller.time_id.value == controller.choosenTime[index].id.toString()
                                                                                      ? AppColors.primaryColor
                                                                                      : Color.fromRGBO(239, 244, 255, 1),
                                                                            ),
                                                                            child:
                                                                                Row(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                              children: [
                                                                                Text(controller.choosenTime[index].timeLable.toString(), textScaleFactor: 1, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, fontFamily: 'Cairo', color: controller.time_id.value == controller.choosenTime[index].id.toString() ? AppColors.whiteColor : Colors.black)),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                              ),
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      ]))),
        ),
      ),
      bottomNavigationBar: Container(
        height: height * .11,
        width: width,
        color: AppColors.primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    if (controller.selectedTime.value == true) {
                      Get.toNamed('/address-payment',
                          arguments: {'isShop': false});
                    } else {
                      Fluttertoast.showToast(
                          msg: 'selectTime'.tr,
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.TOP,
                          timeInSecForIosWeb: 0,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                  },
                  child: Container(
                    child: Center(
                      child: Text(
                        'استمر',
                        textScaleFactor: 1,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Cairo',
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
                    Obx(
                      () => Row(
                        children: [
                          Text(
                            serviceController.tootal.value == 0
                                ? ' ${serviceController.choosenService.value.unitPrice}'
                                : ' ${double.parse(serviceController.tootal.value.toString()) + double.parse(serviceController.choosenService.value.unitPrice.toString())}',
                            textScaleFactor: 1,
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Cairo',
                                color: AppColors.whiteColor),
                          ),
                          Text(
                            'د.ك',
                            textScaleFactor: 1,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Cairo',
                                color: AppColors.whiteColor),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
