import 'package:autoservice/app/modules/used_accessories_details/views/used_accessories_details_view.dart';
import 'package:autoservice/app/widgets/GridViewACCItem.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:autoservice/app/modules/used_accessories/controllers/used_accessories_controller.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:autoservice/app/Colors.dart';
import 'package:autoservice/app/modules/new_accessories/views/productsListShimmer.dart';

class UsedAccessoriesView extends GetView<UsedAccessoriesController> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final double itemHeight = MediaQuery.of(context).size.height / 2;
    final double itemWidth = MediaQuery.of(context).size.width / 2;

    return Scaffold(
      backgroundColor:
          // Color.fromRGBO(255, 255, 255, 1),
          AppColors.scaffoldBackgroud,
      // extendBodyBehindAppBar: true,
      // appBar: AppBar(
      //   backgroundColor: AppColors.primaryColor,
      //   elevation: 0.0,
      // ),
      appBar: AppBar(
        actions: [
          SizedBox(width: 10),
          Icon(Icons.shopping_cart, color: Colors.white),
          SizedBox(width: 10),
        ],
        backgroundColor: AppColors.primaryColor,
        elevation: 0.0,
        centerTitle: true,
        toolbarHeight: height * .1,
        title: Text(
          'اكسسورات مستعملة',
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
          color: AppColors.scaffoldBackgroud,
        ),
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
                                // print(controller.governorateid);
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
            //governate
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
                                : controller.ismodelList.value == true
                                    ? controller.carModels.length
                                    : controller.carYears.length,
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
                                            : controller.istypeList.value ==
                                                    true
                                                ? controller
                                                    .carTypes[index].title
                                                : controller.ismodelList
                                                            .value ==
                                                        true
                                                    ? controller
                                                        .carModels[index].name
                                                        .toString()
                                                    : controller
                                                        .carYears[index].name,
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
                // controller: controller.scrollController,
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
                        // Obx(
                        //   () => controller.loading.value == true
                        //       ? ProductsListShimmer()
                        //       : Column(
                        //           children: [],
                        //         ),
                        // ),
                        SizedBox(
                          height: 10,
                        ),
                        Obx(() => controller.loading.value == true
                            ? ProductsListShimmer()
                            : Column(
                                children: [
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 15),
                                    child: GridView.builder(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              childAspectRatio:
                                                  (itemWidth / itemHeight) *
                                                      1.4,
                                              crossAxisSpacing: 5,
                                              mainAxisSpacing: 0),
                                      //    gridDelegate:
                                      // SliverGridDelegateWithFixedCrossAxisCount(
                                      //     crossAxisCount: 2),
                                      itemBuilder: (_, index) => InkWell(
                                        onTap: () {
                                          Get.to(UsedAccessoriesDetailsView(
                                              url: controller
                                                  .http.baseUrlForImages,
                                              item: controller
                                                  .accessoriesList[index]));
                                          // Navigator.pushNamed(context,
                                          //     UsedAccessoryDetailsScreen.routeName);
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(bottom: 10),
                                          child: GridViewItem(
                                            item: controller
                                                .accessoriesList[index],
                                            url: controller
                                                .http.baseUrlForImages,
                                            height: height,
                                            width: width,
                                          ),
                                        ),
                                      ),
                                      itemCount:
                                          controller.accessoriesList.length,
                                    ),
                                  ),
                                  Obx(() => controller.paginate.value == true
                                      ? Center(
                                          child: CircularProgressIndicator())
                                      : Container()),
                                ],
                              ))
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
