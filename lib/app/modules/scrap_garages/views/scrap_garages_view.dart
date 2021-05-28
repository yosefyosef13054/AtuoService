import 'package:autoservice/app/modules/scrap_delivery_request/views/scrap_delivery_request_view.dart';
import 'package:autoservice/app/widgets/GarageListItem.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:autoservice/app/modules/scrap_orders/model.dart';

import 'package:autoservice/app/modules/scrap_garages/controllers/scrap_garages_controller.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:autoservice/app/Colors.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:autoservice/app/modules/HomeScreen/controllers/home_screen_controller.dart';

class ScrapGaragesView extends GetView<ScrapGaragesController> {
  final HomeScreenController homecontroller = Get.find();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var format = DateFormat('yMd');
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroud,
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'كراجات السكراب المختصة بمركبتك',
          textScaleFactor: 1,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              fontFamily: 'Cairo',
              color: AppColors.whiteColor),
        ),
      ),
      body: Obx(
        () => controller.loading.value == true
            ? ShimmerLoadingGarages(
                height: height,
                width: width,
              )
            : Container(
                constraints: BoxConstraints.expand(),
                decoration: BoxDecoration(),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Positioned(
                      top: 0,
                      right: 0,
                      left: 0,
                      child: Container(
                        height: height,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      left: 0,
                      height: height,
                      child: SingleChildScrollView(
                        child: SizedBox(
                          height: height,
                          child: SingleChildScrollView(
                            child: AnimationLimiter(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:
                                    AnimationConfiguration.toStaggeredList(
                                  duration: const Duration(milliseconds: 0),
                                  childAnimationBuilder: (widget) =>
                                      SlideAnimation(
                                    horizontalOffset:
                                        MediaQuery.of(context).size.width / 1,
                                    child: SlideAnimation(child: widget),
                                  ),
                                  children: [
                                    // SizedBox(
                                    //   height: height * 0.08,
                                    // ),
                                    Center(
                                      child: Column(
                                        children: [
                                          Container(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Column(
                                                  children: [
                                                    Text(
                                                      'بلد الصنع',
                                                      textScaleFactor: 1,
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontFamily: 'Cairo',
                                                          color: AppColors
                                                              .whiteColor),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Container(
                                                      width: width * 0.18,
                                                      decoration: BoxDecoration(
                                                        color: Color.fromRGBO(
                                                            233, 236, 242, 1),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(25),
                                                      ),
                                                      child: Center(
                                                        child: Container(
                                                          margin:
                                                              EdgeInsets.all(5),
                                                          child: Text(
                                                            controller.response
                                                                    .data[
                                                                'regionName'],
                                                            textScaleFactor: 1,
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontFamily:
                                                                    'Cairo',
                                                                color: AppColors
                                                                    .primaryColor),
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                Column(
                                                  children: [
                                                    Text(
                                                      'نوع السيارة',
                                                      textScaleFactor: 1,
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontFamily: 'Cairo',
                                                          color: AppColors
                                                              .whiteColor),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Container(
                                                      width: width * 0.18,
                                                      decoration: BoxDecoration(
                                                        color: Color.fromRGBO(
                                                            233, 236, 242, 1),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(25),
                                                      ),
                                                      child: Center(
                                                        child: Container(
                                                          margin:
                                                              EdgeInsets.all(5),
                                                          child: Text(
                                                            controller
                                                                .response
                                                                .data[
                                                                    'carTypeName']
                                                                .toString(),
                                                            textScaleFactor: 1,
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontFamily:
                                                                    'Cairo',
                                                                color: AppColors
                                                                    .primaryColor),
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                Column(
                                                  children: [
                                                    Text(
                                                      'موديل السيارة',
                                                      textScaleFactor: 1,
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontFamily: 'Cairo',
                                                          color: AppColors
                                                              .whiteColor),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Container(
                                                      width: width * 0.18,
                                                      decoration: BoxDecoration(
                                                        color: Color.fromRGBO(
                                                            233, 236, 242, 1),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(25),
                                                      ),
                                                      child: Center(
                                                        child: Container(
                                                          margin:
                                                              EdgeInsets.all(5),
                                                          child: Text(
                                                            controller
                                                                .response
                                                                .data[
                                                                    'modelName']
                                                                .toString(),
                                                            textScaleFactor: 1,
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontFamily:
                                                                    'Cairo',
                                                                color: AppColors
                                                                    .primaryColor),
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                Column(
                                                  children: [
                                                    Text(
                                                      'سنة الصنع',
                                                      textScaleFactor: 1,
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontFamily: 'Cairo',
                                                          color: AppColors
                                                              .whiteColor),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Container(
                                                      width: width * 0.18,
                                                      decoration: BoxDecoration(
                                                        color: Color.fromRGBO(
                                                            233, 236, 242, 1),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(25),
                                                      ),
                                                      child: Center(
                                                        child: Container(
                                                          margin:
                                                              EdgeInsets.all(5),
                                                          child: Text(
                                                            controller.response
                                                                .data['carYear']
                                                                .toString(),
                                                            textScaleFactor: 1,
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontFamily:
                                                                    'Cairo',
                                                                color: AppColors
                                                                    .primaryColor),
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 15),
                                          child: Text(
                                            'تاريخ الطلب:' +
                                                format.format(DateTime.parse(
                                                    controller.response
                                                        .data['orderDate']
                                                        .toString())),
                                            textScaleFactor: 1,
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'Cairo',
                                                color: AppColors.whiteColor),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 15),
                                          child: Text(
                                            'رقم الطلب:#' +
                                                controller.response.data['id']
                                                    .toString(),
                                            textScaleFactor: 1,
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'Cairo',
                                                color: AppColors.whiteColor),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: height * 0.02,
                                    ),
                                    Center(
                                      child: Container(
                                        width: width * .91,
                                        height: height * 0.68,
                                        padding:
                                            EdgeInsets.only(right: 7, left: 7),
                                        margin:
                                            EdgeInsets.symmetric(vertical: 10),
                                        decoration: BoxDecoration(
                                          color: AppColors.whiteColor,
                                          borderRadius:
                                              BorderRadius.circular(7),
                                        ),
                                        child: Container(
                                          height: height * 0.68,
                                          margin: EdgeInsets.only(top: 20),
                                          child: Obx(
                                            () => ListView.builder(
                                              controller:
                                                  controller.scrollController,
                                              scrollDirection: Axis.vertical,
                                              itemCount:
                                                  controller.garages.length,
                                              itemBuilder: (context, index) {
                                                return Column(
                                                  children: [
                                                    SizedBox(height: 1),
                                                    InkWell(
                                                      onTap: () {
                                                        print(
                                                            "FCM Token in This company ${controller.garages[index].companyFcmToken}");
                                                        print(
                                                            "Last Message From ${controller.garages[index].companyChat.lastSender} Readed ${controller.garages[index].companyChat.readed}");
                                                        Get.toNamed('/chat',
                                                            arguments: {
                                                              // 'dialogResponse':
                                                              //     controller
                                                              //         .dialogresponse
                                                              //         .data,
                                                              'orderId':
                                                                  controller.id
                                                                      .toString(),
                                                              'otherName':
                                                                  "${controller.garages[index].userName}"
                                                            });
                                                      },
                                                      child: GarageListItem(
                                                        url: controller.http
                                                            .baseUrlForImages,
                                                        width: width,
                                                        item: controller
                                                            .garages[index],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                  ],
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
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

class ShimmerLoadingGarages extends StatelessWidget {
  const ShimmerLoadingGarages({
    Key key,
    @required this.height,
    @required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              height: height,
              color: AppColors.primaryColor,
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            height: height,
            child: SingleChildScrollView(
              child: SizedBox(
                height: height,
                child: SingleChildScrollView(
                  child: AnimationLimiter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: AnimationConfiguration.toStaggeredList(
                        duration: const Duration(milliseconds: 0),
                        childAnimationBuilder: (widget) => SlideAnimation(
                          horizontalOffset:
                              MediaQuery.of(context).size.width / 1,
                          child: SlideAnimation(child: widget),
                        ),
                        children: [
                          // SizedBox(
                          //   height: height * 0.08,
                          // ),
                          Center(
                            child: Column(
                              children: [
                                Container(
                                  child: Shimmer.fromColors(
                                    baseColor: Colors.grey[300],
                                    highlightColor: Colors.grey[100],
                                    enabled: true,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              'بلد الصنع',
                                              textScaleFactor: 1,
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: 'Cairo',
                                                  color: AppColors.whiteColor),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              width: width * 0.18,
                                              decoration: BoxDecoration(
                                                color: Color.fromRGBO(
                                                    233, 236, 242, 1),
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                              ),
                                              child: Center(
                                                child: Container(
                                                  margin: EdgeInsets.all(5),
                                                  child: Text(
                                                    'أوروبي',
                                                    textScaleFactor: 1,
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontFamily: 'Cairo',
                                                        color: AppColors
                                                            .primaryColor),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              'نوع السيارة',
                                              textScaleFactor: 1,
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: 'Cairo',
                                                  color: AppColors.whiteColor),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              width: width * 0.18,
                                              decoration: BoxDecoration(
                                                color: Color.fromRGBO(
                                                    233, 236, 242, 1),
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                              ),
                                              child: Center(
                                                child: Container(
                                                  margin: EdgeInsets.all(5),
                                                  child: Text(
                                                    'تويوتا',
                                                    textScaleFactor: 1,
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontFamily: 'Cairo',
                                                        color: AppColors
                                                            .primaryColor),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              'موديل السيارة',
                                              textScaleFactor: 1,
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: 'Cairo',
                                                  color: AppColors.whiteColor),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              width: width * 0.18,
                                              decoration: BoxDecoration(
                                                color: Color.fromRGBO(
                                                    233, 236, 242, 1),
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                              ),
                                              child: Center(
                                                child: Container(
                                                  margin: EdgeInsets.all(5),
                                                  child: Text(
                                                    'كاميري',
                                                    textScaleFactor: 1,
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontFamily: 'Cairo',
                                                        color: AppColors
                                                            .primaryColor),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              'سنة الصنع',
                                              textScaleFactor: 1,
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: 'Cairo',
                                                  color: AppColors.whiteColor),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              width: width * 0.18,
                                              decoration: BoxDecoration(
                                                color: Color.fromRGBO(
                                                    233, 236, 242, 1),
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                              ),
                                              child: Center(
                                                child: Container(
                                                  margin: EdgeInsets.all(5),
                                                  child: Text(
                                                    '2012',
                                                    textScaleFactor: 1,
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontFamily: 'Cairo',
                                                        color: AppColors
                                                            .primaryColor),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 15),
                                child: Text(
                                  'تاريخ الطلب: 22-10-2020',
                                  textScaleFactor: 1,
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Cairo',
                                      color: AppColors.whiteColor),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 15),
                                child: Text(
                                  'رقم الطلب:',
                                  textScaleFactor: 1,
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Cairo',
                                      color: AppColors.whiteColor),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Center(
                            child: Container(
                              width: width * .91,
                              height: height * 0.68,
                              padding: EdgeInsets.only(right: 7, left: 7),
                              margin: EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                color: AppColors.whiteColor,
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: Container(
                                height: height * 0.68,
                                margin: EdgeInsets.only(top: 20),
                                child: Shimmer.fromColors(
                                  baseColor: Colors.grey[300],
                                  highlightColor: Colors.grey[100],
                                  enabled: true,
                                  child: ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    itemCount: 30,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          SizedBox(height: 1),
                                          InkWell(
                                            onTap: () {
                                              // Get.to(
                                              //     ScrapDeliveryRequestView());
                                              // Navigator.pushNamed(
                                              //     context,
                                              //     ScrapDeliveryRequest
                                              //         .routeName);
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Color.fromRGBO(
                                                    239, 244, 255, 1),
                                                borderRadius:
                                                    BorderRadius.circular(7),
                                              ),
                                              child: Container(
                                                margin: EdgeInsets.all(15),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        ClipOval(
                                                            child:
                                                                // image != null
                                                                //     ? Image.file(
                                                                //         image,
                                                                //         fit: BoxFit.cover,
                                                                //       )
                                                                //     :
                                                                Image.network(
                                                          'https://images.unsplash.com/photo-1541963463532-d68292c34b19?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxleHBsb3JlLWZlZWR8M3x8fGVufDB8fHw%3D&w=1000&q=80',
                                                          fit: BoxFit.cover,
                                                          height: width * 0.09,
                                                          width: width * 0.09,
                                                        )),
                                                        SizedBox(
                                                          width: 15,
                                                        ),
                                                        Text(
                                                          'كراج الحاج محمد',
                                                          textScaleFactor: 1,
                                                          style: TextStyle(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontFamily:
                                                                  'Cairo',
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Image.asset(
                                                          'assets/images/icons/Scrap/scrap(6).png',
                                                          height: 27,
                                                          width: 27,
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Image.asset(
                                                          'assets/images/icons/Scrap/scrap(3).png',
                                                          height: 23,
                                                          width: 23,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
