import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:autoservice/app/modules/spareParts/controllers/spare_parts_controller.dart';

import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:autoservice/app/Colors.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

class SparePartsView extends GetView<SparePartsController> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor:
          // Color.fromRGBO(255, 255, 255, 1),
          AppColors.whiteColor,
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0.0,
        toolbarHeight: height * .12,
        title: Text(
          'قطع الغيار',
          textScaleFactor: 1,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              fontFamily: 'Cairo',
              color: AppColors.whiteColor),
        ),
        centerTitle: true,
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(color: AppColors.whiteColor),
        child: Column(
          children: [
            // Container(
            //   height: height * .12,
            //   width: width,
            //   color: AppColors.primaryColor,
            //   child: Column(
            //     children: [
            //       Spacer(
            //         flex: 1,
            //       ),
            //       // Container(
            //       //   margin: EdgeInsets.only(bottom: 15),
            //       //   child: Text(
            //       //     'سيارات مستعملة للبيع',
            //       //     textScaleFactor: 1,
            //                  style: TextStyle(
            //       //         fontSize: 20,
            //       //         fontWeight: FontWeight.w500,
            //       //         fontFamily: 'Cairo',
            //       //         color: AppColors.whiteColor),
            //       //   ),
            //       // ),
            //     ],
            //   ),
            // ),

            //filter items
            Obx(
              () => controller.governorateloading.value == true
                  ? Container()
                  : Container(
                      height: height * .04,
                      margin: EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                        boxShadow: [
                          // BoxShadow(
                          //   color: AppColors.shadowColor,
                          //   blurRadius: 20,
                          //   offset: Offset(0, 3),
                          // ),
                        ],
                      ),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.listgovernorate.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () {
                                controller.governorateid.value ==
                                        controller.listgovernorate[index].id
                                            .toString()
                                    ? controller.addgovernate(null)
                                    : controller.addgovernate(index);
                              },
                              child: Obx(
                                () => Container(
                                    height: 27,
                                    width: 120,
                                    margin: EdgeInsets.only(right: 5),
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            controller.listgovernorate[index]
                                                .areaName,
                                            textScaleFactor: 1,
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Cairo',
                                                color: controller.governorateid
                                                            .value ==
                                                        controller
                                                            .listgovernorate[
                                                                index]
                                                            .id
                                                            .toString()
                                                    ? Colors.white
                                                    : AppColors.primaryColor),
                                          ),
                                          controller.governorateid.value ==
                                                  controller
                                                      .listgovernorate[index].id
                                                      .toString()
                                              ? Icon(
                                                  Icons.close,
                                                  color: controller
                                                              .governorateid
                                                              .value ==
                                                          controller
                                                              .listgovernorate[
                                                                  index]
                                                              .id
                                                              .toString()
                                                      ? Colors.white
                                                      : AppColors.primaryColor,
                                                  size: 18,
                                                )
                                              : Container()
                                        ],
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        border: Border.all(
                                            color: AppColors.primaryColor,
                                            width: 1),
                                        color: controller.governorateid.value ==
                                                controller
                                                    .listgovernorate[index].id
                                                    .toString()
                                            ? AppColors.primaryColor
                                            : AppColors.whiteColor,
                                        // color:
                                        //     Color.fromRGBO(239, 244, 255, 1),
                                        borderRadius:
                                            BorderRadius.circular(10))),
                              ));
                        },
                      ),
                    ),
            ),
            //
            Obx(
              () => Container(
                height: height * .04,
                margin: EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  boxShadow: [
                    // BoxShadow(
                    //   color: AppColors.shadowColor,
                    //   blurRadius: 20,
                    //   offset: Offset(0, 3),
                    // ),
                  ],
                ),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.choosenList.length,
                  itemBuilder: (context, index) {
                    return Container(
                        height: 27,
                        width: 120,
                        margin: EdgeInsets.only(right: 5),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                controller.choosenList[index].name,
                                textScaleFactor: 1,
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Cairo',
                                    color: AppColors.whiteColor),
                              ),
                              controller.choosenList[index].id == 0
                                  ? Container()
                                  : InkWell(
                                      onTap: () {
                                        controller.removeClick(index);
                                      },
                                      child: Icon(
                                        Icons.close,
                                        color: Colors.white,
                                        size: 18,
                                      ),
                                    )
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            border: Border.all(
                                color: AppColors.primaryColor, width: 1),
                            color: AppColors.primaryColor,
                            // color:
                            //     Color.fromRGBO(239, 244, 255, 1),
                            borderRadius: BorderRadius.circular(10)));
                  },
                ),
              ),
            ),
            Obx(
              () => controller.noMoreFilters.value == true ||
                      controller.loading.value == true
                  ? Container()
                  : Container(
                      height: height * .04,
                      margin: EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                        boxShadow: [
                          // BoxShadow(
                          //   color: AppColors.shadowColor,
                          //   blurRadius: 20,
                          //   offset: Offset(0, 3),
                          // ),
                        ],
                      ),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.isregionList.value == true
                            ? controller.carRegions.length
                            : controller.istypeList.value == true
                                ? controller.carTypes.length
                                : 0,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              controller.filterClick(index);
                            },
                            child: Container(
                                height: 27,
                                width: 120,
                                margin: EdgeInsets.only(right: 5),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        controller.isregionList.value == true
                                            ? controller.carRegions[index].name
                                            : controller.carTypes[index].title,
                                        textScaleFactor: 1,
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Cairo',
                                            color: AppColors.primaryColor),
                                      ),
                                    ],
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    border: Border.all(
                                        color: AppColors.primaryColor,
                                        width: 1),
                                    color: AppColors.whiteColor,
                                    // color:
                                    //     Color.fromRGBO(239, 244, 255, 1),
                                    borderRadius: BorderRadius.circular(10))),
                          );
                        },
                      ),
                    ),
            ),
            //filter items
            Expanded(
              child: SingleChildScrollView(
                controller: controller.scrollController,
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
                        Obx(
                          () => controller.loading == true
                              ? shimmeritems()
                              : ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  itemCount: controller.usedCarList.length,
                                  padding: const EdgeInsets.all(12),
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        // Navigator.pushNamed(
                                        //     context, CarsDetailsScreen.routeName);
                                        // Get.to(CarDetailView());
                                      },
                                      child: Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: 5, horizontal: 10),
                                          child: Container(
                                              decoration: BoxDecoration(
                                                color: Color.fromRGBO(
                                                    239, 244, 255, 1),
                                                borderRadius:
                                                    BorderRadius.circular(7),
                                              ),
                                              child: Container(
                                                margin: EdgeInsets.all(10),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50),
                                                          ),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50.0),
                                                            child: Image.network(
                                                                controller.http
                                                                        .baseUrlForImages +
                                                                    controller
                                                                        .usedCarList[
                                                                            index]
                                                                        .imageUrl,
                                                                fit:
                                                                    BoxFit.fill,
                                                                height: width *
                                                                    0.18,
                                                                width: width *
                                                                    0.18),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: width * .1,
                                                        ),
                                                        Text(
                                                          controller
                                                              .usedCarList[
                                                                  index]
                                                              .companyName,
                                                          textScaleFactor: 1,
                                                          style: TextStyle(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontFamily:
                                                                  'Cairo',
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                      ],
                                                    ),
                                                    InkWell(
                                                      onTap: () async {
                                                        var url = "tel:" +
                                                            "${controller.usedCarList[index].phone}";
                                                        if (await canLaunch(
                                                            url)) {
                                                          await launch(url);
                                                        } else {
                                                          throw 'Could not launch $url';
                                                        }
                                                      },
                                                      child: Image.asset(
                                                        'assets/images/call.png',
                                                        height: 23,
                                                        width: 23,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ))),
                                    );
                                  },
                                ),
                        ),
                        Obx(() => controller.paginate.value == true
                            ? Center(child: CircularProgressIndicator())
                            : Container()),
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

class shimmeritems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Shimmer.fromColors(
      baseColor: Colors.grey[300],
      highlightColor: Colors.grey[100],
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
              // Get.to(CarDetailView());
            },
            child: Container(
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(239, 244, 255, 1),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50.0),
                                  child: Image.network('imagee',
                                      fit: BoxFit.fill,
                                      height: width * 0.18,
                                      width: width * 0.18),
                                ),
                              ),
                              SizedBox(
                                width: width * .1,
                              ),
                              Text(
                                'dd',
                                textScaleFactor: 1,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Cairo',
                                    color: Colors.black),
                              ),
                            ],
                          ),
                          Image.asset(
                            'assets/images/call.png',
                            height: 23,
                            width: 23,
                          ),
                        ],
                      ),
                    ))),
          );
        },
      ),
    );
  }
}
