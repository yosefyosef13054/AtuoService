import 'package:autoservice/app/modules/Cart/views/cart_view.dart';
import 'package:autoservice/app/widgets/ServicesListViewItem.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:autoservice/app/modules/cars_services_details/controllers/cars_services_details_controller.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:autoservice/app/Colors.dart';
import 'package:autoservice/app/modules/cars_services/model.dart';
import 'package:autoservice/app/modules/cars_services/controllers/cars_services_controller.dart';

class CarsServicesDetailsView extends GetView<CarsServicesDetailsController> {
  CarsServicesDetailsView({this.item, this.url});
  CarsServicesController serviceController = Get.put(CarsServicesController());
  Services item;
  var url;
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
          item.companyName,
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
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                child: AnimationLimiter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: AnimationConfiguration.toStaggeredList(
                      duration: const Duration(milliseconds: 600),
                      childAnimationBuilder: (widget) => SlideAnimation(
                        horizontalOffset: MediaQuery.of(context).size.width / 1,
                        child: SlideAnimation(child: widget),
                      ),
                      children: [
                        ServicesListViewItem(
                          url: url,
                          item: item,
                          width: width,
                        ),
                        Container(
                          width: width * .8,
                          padding: EdgeInsets.all(10),
                          margin:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 5),
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
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  height: 15,
                                ),
                                Text('تفاصيل الخدمة',
                                    textScaleFactor: 1,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Cairo',
                                        color: Colors.black)),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(
                                                bottom: 8.0, right: 5, left: 5),
                                            child: Text(
                                              item.serviceDescription,
                                              textScaleFactor: 1,
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: 'Cairo',
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Obx(
                          () => serviceController.addtionalServices.length <=
                                      0 ||
                                  serviceController.loading.value == true
                              ? Container()
                              // serviceController
                              //                 .addtionalServices[0].serviceName
                              : Container(
                                  width: width * 0.8,
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
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 15,
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Obx(
                                          () => ListView.builder(
                                            scrollDirection: Axis.vertical,
                                            itemCount: serviceController
                                                .addtionalServices.length,
                                            padding: const EdgeInsets.all(12),
                                            shrinkWrap: true,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            itemBuilder: (context, index) {
                                              return Obx(
                                                () => InkWell(
                                                  onTap: () {
                                                    if (serviceController
                                                            .choosenAdditionalService
                                                            .contains(
                                                                serviceController
                                                                        .addtionalServices[
                                                                    index]) ==
                                                        true) {
                                                      var item = serviceController
                                                          .choosenAdditionalService
                                                          .where((e) =>
                                                              e.id.toString() ==
                                                              serviceController
                                                                  .addtionalServices[
                                                                      index]
                                                                  .id
                                                                  .toString());
                                                      serviceController
                                                              .tootal.value -=
                                                          double.parse(item
                                                              .first.unitPrice
                                                              .toString());

                                                      serviceController
                                                          .choosenAdditionalService
                                                          .remove(serviceController
                                                                  .addtionalServices[
                                                              index]);

                                                      // print('its the same');
                                                    } else {
                                                      var item = serviceController
                                                          .choosenAdditionalService
                                                          .where((e) =>
                                                              e.id.toString() ==
                                                              serviceController
                                                                  .addtionalServices[
                                                                      index]
                                                                  .id
                                                                  .toString());
                                                      serviceController
                                                          .choosenAdditionalService
                                                          .add(serviceController
                                                                  .addtionalServices[
                                                              index]);

                                                      serviceController
                                                              .tootal.value +=
                                                          double.parse(item
                                                              .first.unitPrice
                                                              .toString());
                                                      // double.parse(item
                                                      //     .unitPrice
                                                      //     .toString());
                                                      //         +

                                                      //this worked before
                                                      // double.parse(
                                                      //     serviceController
                                                      //         .choosenService[
                                                      //             index]
                                                      //         .unitPrice
                                                      //         .toString());

                                                    }
                                                  },
                                                  child: Container(
                                                    width: width * .7,
                                                    padding: EdgeInsets.all(15),
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 5,
                                                            vertical: 5),
                                                    decoration: BoxDecoration(
                                                        // boxShadow: [
                                                        //   BoxShadow(
                                                        //     color: AppColors.shadowColor,
                                                        //     blurRadius: 20,
                                                        //     offset: Offset(0, 10),
                                                        //   ),
                                                        // ],
                                                        color: AppColors
                                                            .whiteColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(18)),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        //  serviceController
                                                        //               .choosenService[
                                                        //                   index]
                                                        //               .id ==
                                                        //           serviceController
                                                        //               .addtionalServices[
                                                        //                   index]
                                                        //               .id
                                                        //       ? AppColors
                                                        //           .primaryColor
                                                        //       :
                                                        Icon(
                                                          Icons.circle,
                                                          color: serviceController
                                                                      .choosenAdditionalService
                                                                      .contains(
                                                                          serviceController.addtionalServices[
                                                                              index]) ==
                                                                  true
                                                              ? AppColors
                                                                  .primaryColor
                                                              : Colors.grey,
                                                        ),
                                                        Text(
                                                            serviceController
                                                                .addtionalServices[
                                                                    index]
                                                                .serviceName,
                                                            textScaleFactor: 1,
                                                            style: TextStyle(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontFamily:
                                                                    'Cairo',
                                                                color: Colors
                                                                    .black)),
                                                        Text(
                                                            serviceController
                                                                .addtionalServices[
                                                                    index]
                                                                .unitPrice
                                                                .toString(),
                                                            textScaleFactor: 1,
                                                            style: TextStyle(
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontFamily:
                                                                    'Cairo',
                                                                color: Colors
                                                                    .black)),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                        ),
                        SizedBox(
                          height: 15,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
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
                    Get.toNamed('/service-time');
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
                                ? ' ${item.unitPrice}'
                                : ' ${double.parse(serviceController.tootal.value.toString()) + double.parse(item.unitPrice.toString())}',
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
