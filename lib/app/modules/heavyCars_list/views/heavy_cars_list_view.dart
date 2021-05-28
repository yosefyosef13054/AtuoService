import 'package:autoservice/app/modules/heavy_cars/views/heavy_cars_view.dart';
import 'package:autoservice/app/widgets/TruckItem.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:autoservice/app/modules/heavyCars_list/controllers/heavy_cars_list_controller.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:autoservice/app/Colors.dart';
import 'package:autoservice/app/modules/used_cars_forsell/views/usedCarsShimmer.dart';

class HeavyCarsListView extends GetView<HeavyCarsListController> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor:
          // Color.fromRGBO(255, 255, 255, 1),
          AppColors.whiteColor,
      // extendBodyBehindAppBar: true,
      // appBar: AppBar(
      //   backgroundColor: AppColors.primaryColor,
      //   elevation: 0.0,
      // ),
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0.0,
        centerTitle: true,
        toolbarHeight: height * .12,
        title: Text(
          'شاحنات ومعدات',
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
        decoration: BoxDecoration(color: AppColors.whiteColor),
        child: Column(
          children: [
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
                        itemCount: controller.carYears.length,
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
                                        controller.carYears[index].title
                                            .toString(),
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
              child: AnimationLimiter(
                child: SingleChildScrollView(
                  controller: controller.scrollController,
                  child: Obx(
                    () => controller.loading.value == true
                        ? UsedCarShimmer()
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: AnimationConfiguration.toStaggeredList(
                              duration: const Duration(milliseconds: 600),
                              childAnimationBuilder: (widget) => SlideAnimation(
                                horizontalOffset:
                                    MediaQuery.of(context).size.width / 1,
                                child: SlideAnimation(child: widget),
                              ),
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Obx(
                                  () => ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    itemCount: controller.usedCarList.length,
                                    padding: const EdgeInsets.all(12),
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          Get.to(HeavyCarsView(
                                              url: controller
                                                  .http.baseUrlForImages,
                                              item: controller
                                                  .usedCarList[index]));
                                          // Navigator.pushNamed(
                                          //     context, HeavyCarsScreen.routeName);
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(bottom: 5),
                                          child: TruckItem(
                                              url: controller
                                                  .http.baseUrlForImages,
                                              item:
                                                  controller.usedCarList[index],
                                              height: height,
                                              width: width),
                                        ),
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
            ),
          ],
        ),
      ),
    );
  }
}
