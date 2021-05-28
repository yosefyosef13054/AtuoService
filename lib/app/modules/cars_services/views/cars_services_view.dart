import 'package:autoservice/app/modules/cars_services_details/views/cars_services_details_view.dart';
import 'package:autoservice/app/widgets/ServicesListViewItem.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:autoservice/app/modules/cars_services/controllers/cars_services_controller.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:autoservice/app/Colors.dart';
import 'package:shimmer/shimmer.dart';

class CarsServicesView extends GetView<CarsServicesController> {
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
        centerTitle: true,
        toolbarHeight: height * .1,
        title: Text(
          'خدامات السيارات',
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
                                        controller.removeChoosenFilter(
                                            item:
                                                controller.choosenList[index]);
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
              () => controller.serviceCategoryloading.value == true ||
                      controller.serviceCategory.value == false
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
                        itemCount: controller.listserviceCategory.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () {
                                controller.serviceCarType.value = true;
                                controller.serviceCategory.value = false;
                                controller.serviceCategoryid.value ==
                                        controller.listserviceCategory[index].id
                                            .toString()
                                    ? controller.addserviceCategory(null)
                                    : controller.addserviceCategory(index);
                                // print(controller.serviceCategoryid);
                                controller.addChoosenFilter(
                                    id: controller
                                        .listserviceCategory[index].id,
                                    name: controller.listserviceCategory[index]
                                        .serviceTypeAr,
                                    type: 'ServiceCategory');
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
                                            controller
                                                .listserviceCategory[index]
                                                .serviceTypeAr,
                                            textScaleFactor: 1,
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Cairo',
                                                color: controller
                                                            .serviceCategoryid
                                                            .value ==
                                                        controller
                                                            .listserviceCategory[
                                                                index]
                                                            .id
                                                            .toString()
                                                    ? Colors.white
                                                    : AppColors.primaryColor),
                                          ),
                                          controller.serviceCategoryid.value ==
                                                  controller
                                                      .listserviceCategory[
                                                          index]
                                                      .id
                                                      .toString()
                                              ? Icon(
                                                  Icons.close,
                                                  color: controller
                                                              .serviceCategoryid
                                                              .value ==
                                                          controller
                                                              .listserviceCategory[
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
                                        color: controller
                                                    .serviceCategoryid.value ==
                                                controller
                                                    .listserviceCategory[index]
                                                    .id
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
            Obx(
              () => controller.carTypeloading.value == true ||
                      controller.serviceCarType.value == false
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
                      child: Obx(
                        () => ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.listcarType.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                                onTap: () {
                                  controller.carTypeid.value ==
                                          controller.listcarType[index].id
                                              .toString()
                                      ? controller.addcarType(null)
                                      : controller.addcarType(index);
                                  // print(controller.carTypeid);
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
                                              controller.listcarType[index]
                                                  .serviceTypeAr,
                                              textScaleFactor: 1,
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Cairo',
                                                  color: controller.carTypeid
                                                              .value ==
                                                          controller
                                                              .listcarType[
                                                                  index]
                                                              .id
                                                              .toString()
                                                      ? Colors.white
                                                      : AppColors.primaryColor),
                                            ),
                                            controller.carTypeid.value ==
                                                    controller
                                                        .listcarType[index].id
                                                        .toString()
                                                ? Icon(
                                                    Icons.close,
                                                    color: controller.carTypeid
                                                                .value ==
                                                            controller
                                                                .listcarType[
                                                                    index]
                                                                .id
                                                                .toString()
                                                        ? Colors.white
                                                        : AppColors
                                                            .primaryColor,
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
                                          color: controller.carTypeid.value ==
                                                  controller
                                                      .listcarType[index].id
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
            ),
            Obx(
              () => controller.serviceCategorytypeloading.value == true ||
                      controller.serviceCategoryType.value == false
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
                        itemCount: controller.listserviceCategorytype.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () {
                                controller.serviceCategoryType.value = false;
                                controller.serviceCategorytypeid.value ==
                                        controller
                                            .listserviceCategorytype[index].id
                                            .toString()
                                    ? controller.addserviceCategorytype(null)
                                    : controller.addserviceCategorytype(index);
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
                                            controller
                                                .listserviceCategorytype[index]
                                                .title,
                                            textScaleFactor: 1,
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Cairo',
                                                color: controller
                                                            .serviceCategorytypeid
                                                            .value ==
                                                        controller
                                                            .listserviceCategorytype[
                                                                index]
                                                            .id
                                                            .toString()
                                                    ? Colors.white
                                                    : AppColors.primaryColor),
                                          ),
                                          controller.serviceCategorytypeid
                                                      .value ==
                                                  controller
                                                      .listserviceCategorytype[
                                                          index]
                                                      .id
                                                      .toString()
                                              ? Icon(
                                                  Icons.close,
                                                  color: controller
                                                              .serviceCategorytypeid
                                                              .value ==
                                                          controller
                                                              .listserviceCategorytype[
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
                                        color: controller.serviceCategorytypeid
                                                    .value ==
                                                controller
                                                    .listserviceCategorytype[
                                                        index]
                                                    .id
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
                          () => controller.loading.value == true
                              ? ListviewShimmer(
                                  width: width,
                                )
                              : ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  itemCount: controller.servicesList.length,
                                  padding: const EdgeInsets.all(12),
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        controller.choosenService.value =
                                            controller.servicesList[index];
                                        controller.getAdditionalService(
                                            compenyID: controller
                                                .servicesList[index].companyId);
                                        Get.to(CarsServicesDetailsView(
                                            url: controller
                                                .http.baseUrlForImages,
                                            item: controller
                                                .servicesList[index]));
                                        // Navigator.pushNamed(
                                        //     context, ServicesDetailsScreen.routeName);
                                      },
                                      child: ServicesListViewItem(
                                          url: controller.http.baseUrlForImages,
                                          width: width,
                                          item: controller.servicesList[index]),
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

//shimmer

class ListviewShimmer extends StatelessWidget {
  ListviewShimmer({
    Key key,
    @required this.width,
  }) : super(key: key);

  final double width;
  bool _enabled = true;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300],
      highlightColor: Colors.grey[100],
      enabled: _enabled,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 10,
        padding: const EdgeInsets.all(12),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
              onTap: () {
                Get.to(CarsServicesDetailsView());
                // Navigator.pushNamed(
                //     context, ServicesDetailsScreen.routeName);
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 5),
                child: Container(
                  width: width * .8,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(horizontal: 5),
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'غسيل فاخر جداً',
                        textScaleFactor: 1,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Cairo',
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                            height: width * 0.15,
                            width: width * 0.15,
                          )),
                          Container(
                            height: 50,
                            width: 100,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.shadowColor,
                                    blurRadius: 20,
                                    offset: Offset(0, 10),
                                  ),
                                ],
                                color: Color.fromRGBO(128, 128, 188, 1),
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'السعر / د.ك',
                                  textScaleFactor: 1,
                                  style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Cairo',
                                      color: AppColors.whiteColor),
                                ),
                                Text(
                                  '6,500',
                                  textScaleFactor: 1,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Cairo',
                                      color: AppColors.whiteColor),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 50,
                            width: 100,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.shadowColor,
                                    blurRadius: 20,
                                    offset: Offset(0, 10),
                                  ),
                                ],
                                color: Color.fromRGBO(200, 142, 116, 1),
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'المدة/دقيقة',
                                  textScaleFactor: 1,
                                  style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Cairo',
                                      color: AppColors.whiteColor),
                                ),
                                Text(
                                  '30',
                                  textScaleFactor: 1,
                                  style: TextStyle(
                                      fontSize: 14,
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
                ),
              ));
        },
      ),
    );
  }
}
