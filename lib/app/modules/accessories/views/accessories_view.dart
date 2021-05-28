import 'package:autoservice/app/Colors.dart';
import 'package:autoservice/app/modules/new_accessories/views/new_accessories_view.dart';
import 'package:autoservice/app/modules/new_accessories_details/views/new_accessories_details_view.dart';
import 'package:autoservice/app/modules/used_accessories/views/used_accessories_view.dart';
import 'package:autoservice/app/modules/used_accessories_details/views/used_accessories_details_view.dart';
import 'package:autoservice/app/widgets/CarsListViewItem.dart';
import 'package:autoservice/app/widgets/UsedAccesoriesListitem.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:get/get.dart';

import 'package:autoservice/app/modules/accessories/controllers/accessories_controller.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AccessoriesView extends GetView<AccessoriesController> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final double itemHeight = MediaQuery.of(context).size.height / 2;
    final double itemWidth = MediaQuery.of(context).size.width / 2;

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroud,
      // extendBodyBehindAppBar: true,

      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0.0,
        centerTitle: true,
        title: Container(
          margin: EdgeInsets.only(top: 10),
          child: Text(
            'اكسسورات',
            textScaleFactor: 1,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                fontFamily: 'Cairo',
                color: AppColors.whiteColor),
          ),
        ),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              top: 1,
              right: 0,
              left: 0,
              child: Container(
                height: height,
                color: AppColors.primaryColor,
              ),
            ),
            Positioned(
              top: height * 0.12,
              right: 0,
              left: 0,
              child: Obx(
                () => SizedBox(
                  height: height,
                  child: controller.loading.value == true
                      ? AccessoriesHomeShimmer(height: height, width: width)
                      : SingleChildScrollView(
                          child: AnimationLimiter(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: AnimationConfiguration.toStaggeredList(
                                duration: const Duration(milliseconds: 600),
                                childAnimationBuilder: (widget) =>
                                    SlideAnimation(
                                  horizontalOffset:
                                      MediaQuery.of(context).size.width / 1,
                                  child: SlideAnimation(child: widget),
                                ),
                                children: [
                                  CarouselSlider(
                                    autoPlay: true,
                                    autoPlayInterval: Duration(seconds: 5),
                                    height: 185,
                                    viewportFraction: 1.0,
                                    onPageChanged: (index) {},
                                    items: controller.topSlide.map((slide) {
                                      return Builder(
                                        builder: (BuildContext context) {
                                          return Container(
                                            margin: EdgeInsets.only(
                                                right: 20,
                                                left: 20,
                                                top: height * 0.02),
                                            height: height * 0.19,
                                            width: width,
                                            child: Image.network(
                                              controller.http.baseUrlForImages +
                                                  slide.imageUrl,
                                              fit: BoxFit.cover,
                                            ),
                                          );
                                        },
                                      );
                                    }).toList(),
                                  ),
                                  // Container(
                                  //   margin: EdgeInsets.only(
                                  //       right: 20,
                                  //       left: 20,
                                  //       top: height * 0.02),
                                  //   height: height * 0.19,
                                  //   width: width,
                                  //   child: Image.asset(
                                  //     'assets/images/Image1.png',
                                  //     fit: BoxFit.cover,
                                  //   ),
                                  // ),
                                  Container(
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 40,
                                          color: AppColors.primaryColor,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 22),
                                                child: Text(
                                                  'اكسسوارات جديدة',
                                                  textScaleFactor: 1,
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily: 'Cairo',
                                                      color:
                                                          AppColors.whiteColor),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  // Navigator.pushNamed(context,
                                                  //     NewAccessoriesScreen.routeName);
                                                  Get.toNamed(
                                                      '/new-accessories');
                                                },
                                                child: Container(
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 22),
                                                  child: Text(
                                                    'تصفح الكل',
                                                    textScaleFactor: 1,
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontFamily: 'Cairo',
                                                        color: AppColors
                                                            .whiteColor),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: 230,
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: AppColors.shadowColor,
                                                blurRadius: 20,
                                                offset: Offset(0, 3),
                                              ),
                                            ],
                                            color: AppColors.primaryColor,
                                          ),
                                          child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: controller
                                                .newAccessories.length,
                                            itemBuilder: (context, index) {
                                              return InkWell(
                                                onTap: () {
                                                  Get.toNamed(
                                                      '/new-accessories-details',
                                                      arguments: {
                                                        'id': controller
                                                            .newAccessories[
                                                                index]
                                                            .id,
                                                        'back_to_favoriteScreen':
                                                            false,
                                                        'is_home_go_To_acc':
                                                            false
                                                      });
                                                  // Get.to(
                                                  //     NewAccessoriesDetailsView(
                                                  //   item: controller
                                                  //       .newAccessories[index],
                                                  //   url: controller
                                                  //       .http.baseUrlForImages,
                                                  // ));
                                                },
                                                child: CarsListViewItem(
                                                    url: controller
                                                        .http.baseUrlForImages,
                                                    item: controller
                                                        .newAccessories[index],
                                                    height: height,
                                                    width: width),
                                              );
                                            },
                                          ),
                                        ),

                                        //Container(height: 1, color: Colors.white),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(bottom: 30),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 40,
                                          color: AppColors.primaryColor,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 22),
                                                child: Text(
                                                  ' اكسسوارات مستعملة',
                                                  textScaleFactor: 1,
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily: 'Cairo',
                                                      color:
                                                          AppColors.whiteColor),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  // Navigator.pushNamed(context,
                                                  //     UsedAccessoriesScreen.routeName);
                                                  Get.toNamed(
                                                      '/used-accessories');
                                                },
                                                child: Container(
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 22),
                                                  child: Text(
                                                    'تصفح الكل',
                                                    textScaleFactor: 1,
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontFamily: 'Cairo',
                                                        color: AppColors
                                                            .whiteColor),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: 230,
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: AppColors.shadowColor,
                                                blurRadius: 20,
                                                offset: Offset(0, 3),
                                              ),
                                            ],
                                            color: AppColors.primaryColor,
                                          ),
                                          child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: controller
                                                .usedAccessories.length,
                                            itemBuilder: (context, index) {
                                              return InkWell(
                                                onTap: () {
                                                  // Navigator.pushNamed(
                                                  //     context,
                                                  //     UsedAccessoryDetailsScreen
                                                  //         .routeName);
                                                  Get.to(UsedAccessoriesDetailsView(
                                                      url: controller.http
                                                          .baseUrlForImages,
                                                      item: controller
                                                              .usedAccessories[
                                                          index]));
                                                },
                                                child: UsedAccesoriesListitem(
                                                    url: controller
                                                        .http.baseUrlForImages,
                                                    item: controller
                                                        .usedAccessories[index],
                                                    height: height,
                                                    width: width),
                                              );
                                            },
                                          ),
                                        ),
                                        Divider(
                                          height: 1,
                                        ),
                                        SizedBox(
                                          height: height * .1,
                                        ),
                                        //Container(height: 1, color: Colors.white),
                                      ],
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
    );
  }
}

//insideSizedBox()

class AccessoriesHomeShimmer extends StatelessWidget {
  const AccessoriesHomeShimmer({
    Key key,
    @required this.height,
    @required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AnimationLimiter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: AnimationConfiguration.toStaggeredList(
            duration: const Duration(milliseconds: 0),
            childAnimationBuilder: (widget) => SlideAnimation(
              horizontalOffset: MediaQuery.of(context).size.width / 1,
              child: SlideAnimation(child: widget),
            ),
            children: [
              //  CarouselSlider(
              //                 autoPlay: true,
              //                 autoPlayInterval:
              //                     Duration(seconds: 5),
              //                 height: 180,
              //                 viewportFraction: 1.0,
              //                 onPageChanged: (index) {},
              //                 items: controller
              //                     .homeDataList[0].topSlider
              //                     .map((slide) {
              //                   return Builder(
              //                     builder: (BuildContext context) {
              //                       return  Container(
              //   margin: EdgeInsets.only(
              //       right: 20, left: 20, top: height * 0.02),
              //   height: height * 0.19,
              //   width: width,
              //   child: Image.asset(
              //     'assets/images/Image1.png',
              //     fit: BoxFit.cover,
              //   ),
              // );
              //                     },
              //                   );
              //                 }).toList(),
              //               ),
              Shimmer.fromColors(
                baseColor: Colors.grey[300],
                highlightColor: Colors.grey[100],
                enabled: true,
                child: Container(
                  margin:
                      EdgeInsets.only(right: 20, left: 20, top: height * 0.02),
                  height: height * 0.19,
                  width: width,
                  child: Image.asset(
                    'assets/images/Image1.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      height: 40,
                      color: AppColors.primaryColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 22),
                            child: Text(
                              'اكسسوارات جديدة',
                              textScaleFactor: 1,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Cairo',
                                  color: AppColors.whiteColor),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              // Navigator.pushNamed(context,
                              //     NewAccessoriesScreen.routeName);
                              Get.toNamed('/new-accessories');
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 22),
                              child: Text(
                                'تصفح الكل',
                                textScaleFactor: 1,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Cairo',
                                    color: AppColors.whiteColor),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: height * .33,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.shadowColor,
                            blurRadius: 20,
                            offset: Offset(0, 3),
                          ),
                        ],
                        color: AppColors.primaryColor,
                      ),
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey[300],
                        highlightColor: Colors.grey[100],
                        enabled: true,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                // Navigator.pushNamed(
                                //     context,
                                //     NewAccessoryDetailsScreen
                                //         .routeName);
                                Get.to(NewAccessoriesDetailsView());
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 2),
                                height: height * 0.6,
                                width: width * 0.346,
                                color: AppColors.whiteColor,
                                child: Stack(
                                  children: [
                                    // Image.network(
                                    //   url + item.imageUrl,
                                    //   fit: BoxFit.contain,
                                    //   height: height * 0.24,
                                    //   width: width * 0.3,
                                    // ),
                                    Positioned(
                                        bottom: 0,
                                        right: 0,
                                        child: Row(
                                          children: [
                                            Container(
                                              height: 18,
                                              color: Colors.grey,
                                              width: width * 0.20,
                                              child: Center(
                                                child: Text(
                                                  // + item.carYearName
                                                  '',
                                                  textScaleFactor: 1,
                                                  style: TextStyle(
                                                      fontSize: 9,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily: 'Cairo',
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: 18,
                                              width: width * 0.18,
                                              color: Color.fromRGBO(
                                                  200, 142, 116, 1),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'item.unitPrice.toString()',
                                                    textScaleFactor: 1,
                                                    style: TextStyle(
                                                        // decoration: TextDecoration.lineThrough,
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontFamily: 'Cairo',
                                                        color: Colors.white),
                                                  ),
                                                  Text(
                                                    ' د.ك',
                                                    textScaleFactor: 1,
                                                    style: TextStyle(
                                                        // decoration: TextDecoration.lineThrough,
                                                        fontSize: 8,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontFamily: 'Cairo',
                                                        color: Colors.white),
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )),
                                    Positioned(
                                      bottom: 30,
                                      left: 0,
                                      width: width * 0.346,
                                      child: Container(
                                        width: width * 0.346,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Center(
                                              child: Text(
                                                ' item.partName',
                                                textScaleFactor: 1,
                                                style: TextStyle(
                                                    fontSize: 11,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: 'Cairo',
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),

                    //Container(height: 1, color: Colors.white),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 30),
                child: Column(
                  children: [
                    Container(
                      height: 40,
                      color: AppColors.primaryColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 22),
                            child: Text(
                              ' اكسسوارات مستعملة',
                              textScaleFactor: 1,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Cairo',
                                  color: AppColors.whiteColor),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              // Navigator.pushNamed(context,
                              //     UsedAccessoriesScreen.routeName);
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 22),
                              child: Text(
                                'تصفح الكل',
                                textScaleFactor: 1,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Cairo',
                                    color: AppColors.whiteColor),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: height * .33,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.shadowColor,
                            blurRadius: 20,
                            offset: Offset(0, 3),
                          ),
                        ],
                        color: AppColors.primaryColor,
                      ),
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey[300],
                        highlightColor: Colors.grey[100],
                        enabled: true,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return InkWell(
                                onTap: () {
                                  // Navigator.pushNamed(
                                  //     context,
                                  //     UsedAccessoryDetailsScreen
                                  //         .routeName);
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 2),
                                  height: height * 0.6,
                                  width: width * 0.346,
                                  color: AppColors.whiteColor,
                                  child: Stack(
                                    children: [
                                      // Image.network(
                                      //   url + item.imageUrl,
                                      //   fit: BoxFit.contain,
                                      //   height: height * 0.24,
                                      //   width: width * 0.3,
                                      // ),
                                      Positioned(
                                          bottom: 0,
                                          right: 0,
                                          child: Row(
                                            children: [
                                              Container(
                                                height: 18,
                                                color: Colors.grey,
                                                width: width * 0.20,
                                                child: Center(
                                                  child: Text(
                                                    // + item.carYearName
                                                    '',
                                                    textScaleFactor: 1,
                                                    style: TextStyle(
                                                        fontSize: 9,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontFamily: 'Cairo',
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 18,
                                                width: width * 0.18,
                                                color: Color.fromRGBO(
                                                    200, 142, 116, 1),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'item.unitPrice.toString()',
                                                      textScaleFactor: 1,
                                                      style: TextStyle(
                                                          // decoration: TextDecoration.lineThrough,
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontFamily: 'Cairo',
                                                          color: Colors.white),
                                                    ),
                                                    Text(
                                                      ' د.ك',
                                                      textScaleFactor: 1,
                                                      style: TextStyle(
                                                          // decoration: TextDecoration.lineThrough,
                                                          fontSize: 8,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontFamily: 'Cairo',
                                                          color: Colors.white),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          )),
                                      Positioned(
                                        bottom: 30,
                                        left: 0,
                                        width: width * 0.346,
                                        child: Container(
                                          width: width * 0.346,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Center(
                                                child: Text(
                                                  ' item.partName',
                                                  textScaleFactor: 1,
                                                  style: TextStyle(
                                                      fontSize: 11,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily: 'Cairo',
                                                      color: Colors.black),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ));
                          },
                        ),
                      ),
                    ),
                    Divider(
                      height: 1,
                    ),
                    SizedBox(
                      height: height * .1,
                    ),
                    //Container(height: 1, color: Colors.white),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
