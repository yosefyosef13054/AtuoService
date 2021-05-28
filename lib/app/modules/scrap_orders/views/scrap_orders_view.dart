import 'package:autoservice/app/modules/scrap_garages/views/scrap_garages_view.dart';
import 'package:autoservice/app/widgets/ScrapOrderItem.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:autoservice/app/modules/scrap_orders/controllers/scrap_orders_controller.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:autoservice/app/Colors.dart';
import 'package:shimmer/shimmer.dart';

class ScrapOrdersView extends GetView<ScrapOrdersController> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () async {
        var value = true;
//
        // controller.isInProfile == true
        //     ? await Get.offAndToNamed('/scrap-request')
        //     : Navigator.pop(context);

        return value;
      },
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackgroud,
        // extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            'طلباتي | قطع السكراب',
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
                            duration: const Duration(milliseconds: 600),
                            childAnimationBuilder: (widget) => SlideAnimation(
                              horizontalOffset:
                                  MediaQuery.of(context).size.width / 1,
                              child: SlideAnimation(child: widget),
                            ),
                            children: [
                              // SizedBox(
                              //   height: height * 0.08,
                              // ),

                              SizedBox(
                                height: 10,
                              ),

                              SizedBox(
                                height: height * 0.02,
                              ),
                              Obx(
                                () => controller.loading.value == true
                                    ? CenterShimmerWidget(
                                        height: height,
                                        width: width,
                                      )
                                    : Center(
                                        child: Container(
                                          width: width * .91,
                                          height: height * 0.72,
                                          padding: EdgeInsets.only(
                                              right: 7, left: 7),
                                          margin: EdgeInsets.symmetric(
                                              vertical: 10),
                                          decoration: BoxDecoration(
                                            color: AppColors.whiteColor,
                                            borderRadius:
                                                BorderRadius.circular(7),
                                          ),
                                          child: Container(
                                            height: height * 0.8,
                                            margin: EdgeInsets.only(top: 20),
                                            child: Obx(
                                              () => ListView.builder(
                                                controller:
                                                    controller.scrollController,
                                                scrollDirection: Axis.vertical,
                                                itemCount: controller
                                                    .myRequestsList.length,
                                                itemBuilder: (context, index) {
                                                  return Column(
                                                    children: [
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      InkWell(
                                                          onTap: () {
                                                            Get.toNamed(
                                                                '/scrap-garages',
                                                                arguments: {
                                                                  'id': controller
                                                                      .myRequestsList[
                                                                          index]
                                                                      .id
                                                                      .toString()
                                                                });
                                                            // Get.to(
                                                            //     ScrapGaragesView());
                                                          },
                                                          child: ScrapOrderItem(
                                                            width: width,
                                                            item: controller
                                                                    .myRequestsList[
                                                                index],
                                                          )),
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
                                      ),
                              ),
                              Obx(() => controller.paginate.value == true
                                  ? Center(child: CircularProgressIndicator())
                                  : Container()),
                              InkWell(
                                onTap: () {
                                  Get.offAndToNamed('/scrap-request');
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
                                        border: Border.all(
                                            color: AppColors.whiteColor),
                                        color: AppColors.primaryColor,
                                        borderRadius:
                                            BorderRadius.circular(15)),
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CenterShimmerWidget extends StatelessWidget {
  const CenterShimmerWidget({
    Key key,
    @required this.width,
    @required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: width * .91,
        height: height * 0.72,
        padding: EdgeInsets.only(right: 7, left: 7),
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Container(
          height: height * 0.8,
          margin: EdgeInsets.only(top: 20),
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300],
            highlightColor: Colors.grey[100],
            enabled: true,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    InkWell(
                        onTap: () {
                          // Get.to(ScrapGaragesView());
                          //  Navigator.pushNamed(context, ScrapOrdersScreen)
                        },
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(239, 244, 255, 1),
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: Container(
                                // margin: EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Container(
                                      child: Column(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.all(10),
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
                                                          color: Colors.black),
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
                                                            'أوروبي',
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
                                                          color: Colors.black),
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
                                                            'تويوتا',
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
                                                          color: Colors.black),
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
                                                            'كاميري',
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
                                                          color: Colors.black),
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
                                                            '2012',
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
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 15),
                                                child: Text(
                                                  'تاريخ الطلب: 22-10-2020',
                                                  textScaleFactor: 1,
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily: 'Cairo',
                                                      color: Colors.black),
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 15),
                                                child: Text(
                                                  'تاريخ الطلب: 22-10-2020',
                                                  textScaleFactor: 1,
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily: 'Cairo',
                                                      color: Colors.black),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                                color: Color.fromRGBO(
                                                    214, 223, 242, 1),
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(7),
                                                    bottomRight:
                                                        Radius.circular(7))
                                                // BorderRadius
                                                //     .circular(
                                                //         7),
                                                ),
                                            child: Container(
                                              margin: EdgeInsets.all(5),
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    width: 15,
                                                  ),
                                                  Text(
                                                    'طريقة الدفع: معلق',
                                                    textScaleFactor: 1,
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontFamily: 'Cairo',
                                                        color: Colors.black),
                                                  ),
                                                  Spacer(),
                                                  Image.asset(
                                                    'assets/images/icons/Scrap/scrap(6).png',
                                                    height: 20,
                                                    width: 20,
                                                  ),
                                                  SizedBox(
                                                    width: 15,
                                                  ),
                                                  Text(
                                                    'لديك محادثة جديدة',
                                                    textScaleFactor: 1,
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontFamily: 'Cairo',
                                                        color: Colors.black),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              top: 0,
                              right: 0,
                              child: Image.asset(
                                'assets/images/icons/Scrap/scrap(11).png',
                                height: 20,
                                width: 20,
                              ),
                            ),
                          ],
                        )),
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
    );
  }
}
