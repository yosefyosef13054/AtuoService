import 'package:autoservice/app/modules/used_accessories_details/views/used_accessories_details_view.dart';
import 'package:autoservice/app/widgets/CarsGridViewItem.dart';
import 'package:flutter/material.dart';
import 'package:autoservice/app/modules/Cart/controllers/cart_controller.dart';

import 'package:get/get.dart';
import 'package:autoservice/app/modules/new_accessories/accessoryListItem.dart';

import 'package:autoservice/app/modules/new_accessories/controllers/new_accessories_controller.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:autoservice/app/Colors.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:autoservice/app/modules/new_accessories/views/productsListShimmer.dart';
import 'package:autoservice/app/modules/new_accessories_details/views/new_accessories_details_view.dart';

class NewAccessoriesView extends GetView<NewAccessoriesController> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final double itemHeight = MediaQuery.of(context).size.height / 2;
    final double itemWidth = MediaQuery.of(context).size.width / 2;
    final CartController cartController = Get.put(CartController());

    return Scaffold(
      backgroundColor:
          // Color.fromRGBO(255, 255, 255, 1),
          AppColors.scaffoldBackgroud,
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () {
              Get.toNamed('/cart');
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/images/icons/Acs/Acs(9).png',
                    height: 30,
                    width: 42,
                  ),
                  // cart_bloc.items.length == 0
                  //     ? Container()
                  //     :
                  Positioned(
                    right: 0,
                    top: 4,
                    child: Container(
                      height: 20,
                      width: 20,
                      padding: EdgeInsets.all(2.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.00),
                        color: Colors.white,
                        // color: color != null ? color : Colors.white,
                      ),
                      // constraints: BoxConstraints(
                      //   minHeight: 16,
                      //   minWidth: 16,
                      // ),
                      child: Obx(
                        () => Text(
                          cartController.cartItemsList.length.toString(),
                          textAlign: TextAlign.center,
                          textScaleFactor: 1,
                          style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 9,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
        backgroundColor: AppColors.primaryColor,
        elevation: 0.0,
        centerTitle: true,
        toolbarHeight: 65,
        title: Text(
          'اكسسورات جديدة',
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
            ? ProductsListShimmer()
            : Container(
                constraints: BoxConstraints.expand(),
                decoration: BoxDecoration(
                  color: AppColors.scaffoldBackgroud,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      //filter items

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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
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
                                          color: AppColors.primaryColor,
                                          width: 1),
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
                                  itemCount: controller.isregionList.value ==
                                          true
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
                                                  controller.isregionList
                                                              .value ==
                                                          true
                                                      ? controller
                                                          .carRegions[index]
                                                          .name
                                                      : controller.istypeList
                                                                  .value ==
                                                              true
                                                          ? controller
                                                              .carTypes[index]
                                                              .title
                                                          : controller.ismodelList
                                                                      .value ==
                                                                  true
                                                              ? controller
                                                                  .carModels[
                                                                      index]
                                                                  .name
                                                                  .toString()
                                                              : controller
                                                                  .carYears[
                                                                      index]
                                                                  .name,
                                                  textScaleFactor: 1,
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: 'Cairo',
                                                      color: AppColors
                                                          .primaryColor),
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
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                    );
                                  },
                                ),
                              ),
                      ),

                      //Gategories Filter
                      Obx(
                        () => controller.noMoreCategoryFilters.value == true ||
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
                                child: Obx(
                                  () => ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount:
                                        controller.ismainCategory.value == true
                                            ? controller.carCategory.length
                                            : controller
                                                .carSconderyCategory.length,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          controller.caregoryFilterClick(index);
                                        },
                                        child: Container(
                                            height: 27,
                                            width: 120,
                                            margin: EdgeInsets.only(right: 5),
                                            child: Center(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text(
                                                    controller.ismainCategory
                                                                .value ==
                                                            true
                                                        ? controller
                                                            .carCategory[index]
                                                            .title
                                                        : controller
                                                            .carSconderyCategory[
                                                                index]
                                                            .title,
                                                    textScaleFactor: 1,
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily: 'Cairo',
                                                        color: AppColors
                                                            .primaryColor),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            decoration: BoxDecoration(
                                                shape: BoxShape.rectangle,
                                                border: Border.all(
                                                    color:
                                                        AppColors.primaryColor,
                                                    width: 1),
                                                color: AppColors.whiteColor,
                                                // color:
                                                //     Color.fromRGBO(239, 244, 255, 1),
                                                borderRadius:
                                                    BorderRadius.circular(10))),
                                      );
                                    },
                                  ),
                                ),
                              ),
                      ),
                      //Gategories Filter

                      //filter items
                      SingleChildScrollView(
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
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 15),
                                  child: Obx(
                                    () => GridView.builder(
                                      controller: controller.scrollController,
                                      shrinkWrap: true,
                                      itemCount:
                                          controller.accessoriesList.length,

                                      physics: NeverScrollableScrollPhysics(),
                                      // gridDelegate:
                                      //     SliverGridDelegateWithFixedCrossAxisCount(
                                      //         crossAxisCount: 2),
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              childAspectRatio: .7,
                                              // (itemWidth / itemHeight) *
                                              //     1.4,
                                              crossAxisSpacing: 5,
                                              mainAxisSpacing: 0),
                                      itemBuilder: (_, index) {
                                        return InkWell(
                                          onTap: () {
                                            Get.toNamed(
                                                '/new-accessories-details',
                                                arguments: {
                                                  'id': controller
                                                      .accessoriesList[index]
                                                      .id,
                                                  'back_to_favoriteScreen':
                                                      false,
                                                  'is_home_go_To_acc': false
                                                });
                                            // Get.to(NewAccessoriesDetailsView(
                                            //   item: controller
                                            //       .accessoriesList[index],
                                            //   url: controller
                                            //       .http.baseUrlForImages,
                                            // ));
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(bottom: 5),
                                            child: AccessoryListItem(
                                              url: controller
                                                  .http.baseUrlForImages,
                                              item: controller
                                                  .accessoriesList[index],
                                              height: height,
                                              width: width,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
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
      ),
    );
  }
}
