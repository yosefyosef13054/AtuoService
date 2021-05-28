import 'package:autoservice/app/Colors.dart';
import 'package:autoservice/app/modules/Cars_for_sell/views/cars_for_sell_view.dart';
import 'package:autoservice/app/modules/Cart/controllers/cart_controller.dart';

import 'package:autoservice/app/modules/accessories/views/accessories_view.dart';
import 'package:autoservice/app/modules/bdalah/views/bdalah_view.dart';
import 'package:autoservice/app/modules/car_detail/views/car_detail_view.dart';
import 'package:autoservice/app/modules/cars_insurance/views/cars_insurance_view.dart';
import 'package:autoservice/app/modules/cars_services/views/cars_services_view.dart';
import 'package:autoservice/app/modules/cars_services_details/views/cars_services_details_view.dart';
import 'package:autoservice/app/modules/drawer_menu/views/drawer_menu_view.dart';
import 'package:autoservice/app/modules/new_accessories/views/new_accessories_view.dart';
import 'package:autoservice/app/modules/new_accessories_details/views/new_accessories_details_view.dart';
import 'package:autoservice/app/modules/scrap_request/views/scrap_request_view.dart';
import 'package:autoservice/app/modules/spareParts/views/spare_parts_view.dart';
import 'package:autoservice/app/modules/used_cars_forsell/views/used_cars_forsell_view.dart';
import 'package:autoservice/app/widgets/CarsListViewItem.dart';
import 'package:autoservice/app/widgets/CategoryItemWidget.dart';
import 'package:autoservice/app/widgets/SellingCarWidget.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:autoservice/app/modules/accessories/model.dart' as model;
import 'package:autoservice/app/modules/HomeScreen/model.dart' as homeModel;

import 'package:autoservice/app/modules/HomeScreen/controllers/home_screen_controller.dart';

class HomeScreenView extends GetView<HomeScreenController> {
  final CartController cartController = Get.put(CartController());
  bool _enabled = false;
  static const routeName = '/HomeScreen';
  final HomeScreenController homecontroller = Get.find();
  @override
  Widget build(BuildContext context) {
    List items = [
      [
        'قطع غيار السكراب',
        'assets/images/icons/Home/Group224@3x.png',
        // ScrapRequestScreen.routeName
        //   controller.token.value == '' ? '/sign-in' :
        '/scrap-request'
      ],
      [
        'قطع الغيار',
        'assets/images/spare-parts.png',
        // CarsInsuranceScreen.routeName
        '/spare-parts'
      ],
      [
        'خدمات السيارات',
        'assets/images/icons/Home/Group232@3x.png',
        // CarsServicesScreen.routeName
        '/cars-services'
      ],
      [
        'اكسسورات السيارات',
        'assets/images/icons/Home/Group227@3x.png',
        // AccessoriesScreen.routeName
        '/accessories'
      ],
      [
        'سيارات للبيع',
        'assets/images/icons/Home/Group233@3x.png',
        // CarsForSellScreen.routeName
        '/cars-for-sell'
      ],
      [
        'بدالة الونشات',
        'assets/images/icons/Home/Group226@3x.png',
        // BdalahScreen.routeName
        '/bdalah'
      ],
    ];
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final double itemHeight = MediaQuery.of(context).size.height / 2;
    final double itemWidth = MediaQuery.of(context).size.width / 2;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        // extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          elevation: 0.0,
          automaticallyImplyLeading: false,
          toolbarHeight: 40,
          actions: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 7),
              child: Image.asset(
                'assets/images/Group786.png',
                fit: BoxFit.contain,
                height: 23,
                width: 23,
              ),
            )
          ],
          leading: IconButton(
            onPressed: () {
              Get.toNamed('/drawer-menu');
              // Navigator.pushNamed(context, ProfileScreen.routeName);
            },
            icon: Image.asset(
              'assets/images/Group5.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
        body: Obx(
          () => controller.homeLoading.value == true
              ? ShimmerHome(
                  height: height,
                  width: width,
                  items: items,
                  itemWidth: itemWidth,
                  itemHeight: itemHeight)
              : Container(
                  constraints: BoxConstraints.expand(),
                  decoration: BoxDecoration(),
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      // Positioned(
                      //   top: 1,
                      //   right: 0,
                      //   left: 0,
                      //   child: Container(
                      //     height: height * 0.26,
                      //     color: AppColors.primaryColor,
                      //   ),
                      // ),
                      Positioned.fill(
                        top: 0,
                        right: 0,
                        left: 0,
                        child: Container(
                          // height: height,
                          child: SingleChildScrollView(
                            child: AnimationLimiter(
                              child: Stack(
                                children: [
                                  Container(
                                    height: 100,
                                    color: AppColors.primaryColor,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children:
                                        AnimationConfiguration.toStaggeredList(
                                      duration:
                                          const Duration(milliseconds: 600),
                                      childAnimationBuilder: (widget) =>
                                          SlideAnimation(
                                        horizontalOffset:
                                            MediaQuery.of(context).size.width /
                                                1,
                                        child: SlideAnimation(child: widget),
                                      ),
                                      children: [
                                        // SizedBox(height: height * .15),
                                        CarouselSlider(
                                          autoPlay: controller.homeDataList
                                                      .value.topSlider.length ==
                                                  1
                                              ? false
                                              : true,
                                          autoPlayInterval:
                                              Duration(seconds: 5),
                                          height: 180,
                                          viewportFraction: 1.0,
                                          onPageChanged: (index) {},
                                          items: controller
                                              .homeDataList.value.topSlider
                                              .map((slide) {
                                            return Builder(
                                              builder: (BuildContext context) {
                                                return Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: AppColors
                                                              .primaryColor,
                                                          width: 2)),
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 8),
                                                  height: height * 0.25,
                                                  width: width,
                                                  child: Image.network(
                                                    controller.http
                                                            .baseUrlForImages +
                                                        slide.imageUrl,
                                                    fit: BoxFit.none,
                                                  ),
                                                );
                                              },
                                            );
                                          }).toList(),
                                        ),
                                        //Image
                                        // Container(
                                        //   margin: EdgeInsets.symmetric(
                                        //       horizontal: 16),
                                        //   height: height * 0.25,
                                        //   width: width,
                                        //   child: Image.asset(
                                        //     'assets/images/Image11.png',
                                        //     fit: BoxFit.none,
                                        //   ),
                                        // ),
                                        Container(
                                          padding: EdgeInsets.only(
                                              right: 15,
                                              left: 15,
                                              top: 5,
                                              bottom: 5),
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: GridView.builder(
                                            padding: const EdgeInsets.all(5),
                                            // itemCount: products.length,
                                            shrinkWrap: true,
                                            physics:
                                                const ClampingScrollPhysics(),
                                            itemCount: items.length,
                                            itemBuilder: (ctx, i) => InkWell(
                                              onTap: () {
                                                if (items[i][2] ==
                                                    '/scrap-request') {
                                                  homecontroller.token.value
                                                                  .toString() ==
                                                              'null'
                                                                  .toString() ||
                                                          homecontroller
                                                                  .token.value
                                                                  .toString() ==
                                                              ''
                                                      ? Get.toNamed('/sign-in')
                                                      : Get.toNamed(
                                                          items[i][2]);
                                                } else {
                                                  Get.toNamed(items[i][2]);
                                                }

                                                // Navigator.pushNamed(context, items[i][2]);
                                              },
                                              child: Container(
                                                margin: EdgeInsets.only(
                                                    right: 2, left: 2),
                                                child: CategoryWidget(
                                                  items: items,
                                                  i: i,
                                                ),
                                              ),
                                            ),

                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 2,
                                                    // childAspectRatio:
                                                    //     (itemWidth / itemHeight) *
                                                    //         3.4,
                                                    childAspectRatio: 1.88,
                                                    crossAxisSpacing: 0,
                                                    mainAxisSpacing: 5),
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
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 22),
                                                      child: Text(
                                                        'الاكسسورات',
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
                                                    InkWell(
                                                      onTap: () {
                                                        Get.toNamed(
                                                            '/new-accessories');
                                                        // Navigator.pushNamed(
                                                        //     context,
                                                        //     NewAccessoriesScreen
                                                        //         .routeName);
                                                      },
                                                      child: Container(
                                                        margin: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 22),
                                                        child: Text(
                                                          'تصفح الكل',
                                                          textScaleFactor: 1,
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontFamily:
                                                                  'Cairo',
                                                              color: AppColors
                                                                  .whiteColor),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                height: height * .3,
                                                decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color:
                                                          AppColors.shadowColor,
                                                      blurRadius: 20,
                                                      offset: Offset(0, 3),
                                                    ),
                                                  ],
                                                  color: AppColors.primaryColor,
                                                ),
                                                child: Obx(
                                                  () => ListView.builder(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemCount: controller
                                                        .homeDataList
                                                        .value
                                                        .newAccessories
                                                        .length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      homeModel.NewAccessory
                                                          item = controller
                                                                  .homeDataList
                                                                  .value
                                                                  .newAccessories[
                                                              index];
                                                      return InkWell(
                                                        onTap: () {
                                                          Get.toNamed(
                                                              '/new-accessories-details',
                                                              arguments: {
                                                                'id': item.id,
                                                                'back_to_favoriteScreen':
                                                                    false,
                                                                'is_home_go_To_acc':
                                                                    true
                                                              });
                                                        },
                                                        child: CarsListViewItem(
                                                            url: controller.http
                                                                .baseUrlForImages,
                                                            item: model
                                                                .NewAccessory(
                                                              id: item.id,
                                                              categoryId: item
                                                                  .categoryId,
                                                              categoryName: item
                                                                  .categoryName,
                                                              productNameEn: item
                                                                  .productNameEn,
                                                              productNameAr: item
                                                                  .productNameAr,
                                                              productName: item
                                                                  .productName,
                                                              descriptionEn: item
                                                                  .descriptionEn,
                                                              descriptionAr: item
                                                                  .descriptionAr,
                                                              description: item
                                                                  .description,
                                                              unitPrice: item
                                                                  .unitPrice,
                                                              deleted:
                                                                  item.deleted,
                                                              isActive:
                                                                  item.isActive,
                                                              enableDiscount: item
                                                                  .enableDiscount,
                                                              unitPriceDiscount:
                                                                  item.unitPriceDiscount,
                                                              shopCompanyId: item
                                                                  .shopCompanyId,
                                                              imageId:
                                                                  item.imageId,
                                                              imageUrl:
                                                                  item.imageUrl,
                                                              shopCompanyName: item
                                                                  .shopCompanyName,
                                                              approvalStatus: item
                                                                  .approvalStatus,
                                                              lastModifiedDate:
                                                                  item.lastModifiedDate,
                                                              models:
                                                                  item.models,
                                                              images:
                                                                  item.images,
                                                            ),
                                                            height: height,
                                                            width: width),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 15,
                                                color: AppColors.primaryColor,
                                              ),
                                              Divider(
                                                height: 1,
                                              ),
                                              //Container(height: 1, color: Colors.white),
                                              Container(
                                                child: Column(
                                                  children: [
                                                    Container(
                                                        color: AppColors
                                                            .primaryColor,
                                                        child: Container(
                                                          margin: EdgeInsets
                                                              .symmetric(
                                                                  vertical: 10),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Container(
                                                                margin: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            22),
                                                                child: Text(
                                                                  'سيارات للبيع',
                                                                  textScaleFactor:
                                                                      1,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      fontFamily:
                                                                          'Cairo',
                                                                      color: AppColors
                                                                          .whiteColor),
                                                                ),
                                                              ),
                                                              InkWell(
                                                                onTap: () {
                                                                  Get.toNamed(
                                                                      '/used-cars-forsell');
                                                                  // Get.to(
                                                                  //     UsedCarsForsellView());
                                                                  // Navigator.pushNamed(
                                                                  //     context,
                                                                  //     UsedCarsForSell
                                                                  //         .routeName);
                                                                },
                                                                child:
                                                                    Container(
                                                                  margin: EdgeInsets
                                                                      .symmetric(
                                                                          horizontal:
                                                                              22),
                                                                  child: Text(
                                                                    'تصفح الكل',
                                                                    textScaleFactor:
                                                                        1,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w400,
                                                                        fontFamily:
                                                                            'Cairo',
                                                                        color: AppColors
                                                                            .whiteColor),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        )),
                                                    Container(
                                                      height: 150,
                                                      // padding: EdgeInsets.symmetric(
                                                      //     vertical: 10),
                                                      decoration: BoxDecoration(
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: AppColors
                                                                .shadowColor,
                                                            blurRadius: 20,
                                                            offset:
                                                                Offset(0, 3),
                                                          ),
                                                        ],
                                                        color: AppColors
                                                            .primaryColor,
                                                      ),
                                                      child: ListView.builder(
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        itemCount: controller
                                                            .homeDataList
                                                            .value
                                                            .usedCars
                                                            .length,
                                                        itemBuilder:
                                                            (context, index) {
                                                          return InkWell(
                                                            onTap: () {
                                                              Get.to(CarDetailView(
                                                                  url: controller
                                                                      .http
                                                                      .baseUrlForImages,
                                                                  item: controller
                                                                          .homeDataList
                                                                          .value
                                                                          .usedCars[
                                                                      index]));
                                                              // Navigator.pushNamed(
                                                              //     context,
                                                              //     CarsDetailsScreen
                                                              //         .routeName);
                                                            },
                                                            child: SellingCarWidget(
                                                                height: height,
                                                                width: width,
                                                                url: controller
                                                                    .http
                                                                    .baseUrlForImages,
                                                                item: controller
                                                                    .homeDataList
                                                                    .value
                                                                    .usedCars[index]),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 20,
                                                      color: AppColors
                                                          .primaryColor,
                                                    ),
                                                    CarouselSlider(
                                                      autoPlayCurve:
                                                          Curves.fastOutSlowIn,
                                                      autoPlay: controller
                                                                  .homeDataList
                                                                  .value
                                                                  .bottomSlider
                                                                  .length ==
                                                              1
                                                          ? false
                                                          : true,
                                                      autoPlayInterval:
                                                          Duration(seconds: 5),
                                                      height: 160,
                                                      viewportFraction: 1.0,
                                                      onPageChanged: (index) {},
                                                      items: controller
                                                          .homeDataList
                                                          .value
                                                          .bottomSlider
                                                          .map((slide) {
                                                        return Builder(
                                                          builder: (BuildContext
                                                              context) {
                                                            return Container(
                                                              width: width,
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Image.network(
                                                                    controller
                                                                            .http
                                                                            .baseUrlForImages +
                                                                        slide
                                                                            .imageUrl,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                    height:
                                                                        height *
                                                                            .19,
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      }).toList(),
                                                    ),
                                                    // Container(
                                                    //   height: height * .19,
                                                    //   width: width,
                                                    //   child: Column(
                                                    //     mainAxisAlignment:
                                                    //         MainAxisAlignment
                                                    //             .start,
                                                    //     children: [
                                                    //       Image.asset(
                                                    //         'assets/images/Image8.png',
                                                    //         fit: BoxFit.contain,
                                                    //       ),
                                                    //     ],
                                                    //   ),
                                                    // ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
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

// ShimmerHome(height: height, width: width, items: items, itemWidth: itemWidth, itemHeight: itemHeight)
class ShimmerHome extends StatelessWidget {
  const ShimmerHome({
    Key key,
    @required this.height,
    @required this.width,
    @required this.items,
    @required this.itemWidth,
    @required this.itemHeight,
  }) : super(key: key);

  final double height;
  final double width;
  final List items;
  final double itemWidth;
  final double itemHeight;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300],
      highlightColor: Colors.grey[100],
      enabled: true,
      child: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            // Positioned(
            //   top: 1,
            //   right: 0,
            //   left: 0,
            //   child: Container(
            //     height: height * 0.26,
            //     color: AppColors.primaryColor,
            //   ),
            // ),
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: SizedBox(
                height: height,
                child: SingleChildScrollView(
                  child: AnimationLimiter(
                    child: Stack(
                      children: [
                        Container(
                          height: height * 0.19,
                          color: AppColors.primaryColor,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: AnimationConfiguration.toStaggeredList(
                            duration: const Duration(milliseconds: 600),
                            childAnimationBuilder: (widget) => SlideAnimation(
                              horizontalOffset:
                                  MediaQuery.of(context).size.width / 1,
                              child: SlideAnimation(child: widget),
                            ),
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 16),
                                height: height * 0.25,
                                width: width,
                                child: Image.asset(
                                  'assets/images/Image11.png',
                                  fit: BoxFit.none,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                // margin: EdgeInsets.symmetric(horizontal: width * 0.02),
                                child: GridView.builder(
                                  padding: const EdgeInsets.all(5),
                                  // itemCount: products.length,
                                  shrinkWrap: true,
                                  physics: const ClampingScrollPhysics(),
                                  itemCount: items.length,
                                  itemBuilder: (ctx, i) => InkWell(
                                    onTap: () {
                                      Get.toNamed(items[i][2]);
                                      // Navigator.pushNamed(context, items[i][2]);
                                    },
                                    child: CategoryWidget(
                                      items: items,
                                      i: i,
                                    ),
                                  ),

                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          childAspectRatio:
                                              (itemWidth / itemHeight) * 3.4,
                                          crossAxisSpacing: 5,
                                          mainAxisSpacing: 5),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 30),
                                child: Column(
                                  children: [
                                    // Container(
                                    //   height: 40,
                                    //   color: AppColors.primaryColor,
                                    //   child: Row(
                                    //     mainAxisAlignment:
                                    //         MainAxisAlignment.spaceBetween,
                                    //     children: [
                                    // Container(
                                    //   margin: EdgeInsets.symmetric(
                                    //       horizontal: 22),
                                    //   child: Text(
                                    //     'الاكسسورات',
                                    //     textScaleFactor: 1,
                                    //     style: TextStyle(
                                    //         fontSize: 16,
                                    //         fontWeight: FontWeight.w500,
                                    //         fontFamily: 'Cairo',
                                    //         color: AppColors.whiteColor),
                                    //   ),
                                    // ),
                                    // InkWell(
                                    //   onTap: () {
                                    //     Get.toNamed('/new-accessories');
                                    //     // Navigator.pushNamed(
                                    //     //     context,
                                    //     //     NewAccessoriesScreen
                                    //     //         .routeName);
                                    //   },
                                    //   child: Container(
                                    //     margin: EdgeInsets.symmetric(
                                    //         horizontal: 22),
                                    //     child: Text(
                                    //       'تصفح الكل',
                                    //       textScaleFactor: 1,
                                    //        style: TextStyle(
                                    //           fontSize: 16,
                                    //           fontWeight: FontWeight.w500,
                                    //           fontFamily: 'Cairo',
                                    //           color:
                                    //               AppColors.whiteColor),
                                    //     ),
                                    //   ),
                                    // ),
                                    //     ],
                                    //   ),
                                    // ),
                                    // Container(
                                    //   height: height * .3,
                                    //   decoration: BoxDecoration(
                                    //     boxShadow: [
                                    //       BoxShadow(
                                    //         color: AppColors.shadowColor,
                                    //         blurRadius: 20,
                                    //         offset: Offset(0, 3),
                                    //       ),
                                    //     ],
                                    //     color: AppColors.primaryColor,
                                    //   ),
                                    //   child: ListView.builder(
                                    //     scrollDirection: Axis.horizontal,
                                    //     itemCount: 10,
                                    //     itemBuilder: (context, index) {
                                    //       return InkWell(
                                    //         onTap: () {
                                    //           Get.to(
                                    //               NewAccessoriesDetailsView());
                                    //           // Navigator.pushNamed(
                                    //           //     context,
                                    //           //     NewAccessoryDetailsScreen
                                    //           //         .routeName);
                                    //         },
                                    //         child: CarsListViewItem(
                                    //             index: index,
                                    //             height: height,
                                    //             width: width),
                                    //       );
                                    //     },
                                    //   ),
                                    // ),
                                    Container(
                                      height: 15,
                                      color: AppColors.primaryColor,
                                    ),
                                    Divider(
                                      height: 1,
                                    ),
                                    //Container(height: 1, color: Colors.white),
                                    Container(
                                      child: Column(
                                        children: [
                                          Container(
                                              color: AppColors.primaryColor,
                                              child: Container(
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 10),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 22),
                                                      child: Text(
                                                        'سيارات للبيع',
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
                                                    InkWell(
                                                      onTap: () {
                                                        Get.to(
                                                            UsedCarsForsellView());
                                                        // Navigator.pushNamed(
                                                        //     context,
                                                        //     UsedCarsForSell
                                                        //         .routeName);
                                                      },
                                                      child: Container(
                                                        margin: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 22),
                                                        child: Text(
                                                          'تصفح الكل',
                                                          textScaleFactor: 1,
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontFamily:
                                                                  'Cairo',
                                                              color: AppColors
                                                                  .whiteColor),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )),
                                          Container(
                                            height: height * .19,
                                            // padding: EdgeInsets.symmetric(
                                            //     vertical: 10),
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
                                              itemCount: 10,
                                              itemBuilder: (context, index) {
                                                return InkWell(
                                                  onTap: () {
                                                    Get.to(CarDetailView());
                                                    // Navigator.pushNamed(
                                                    //     context,
                                                    //     CarsDetailsScreen
                                                    //         .routeName);
                                                  },
                                                  child: SellingCarWidget(
                                                      height: height,
                                                      width: width),
                                                );
                                              },
                                            ),
                                          ),
                                          Container(
                                            height: 20,
                                            color: AppColors.primaryColor,
                                          ),
                                          Container(
                                            height: height * .19,
                                            width: width,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Image.asset(
                                                  'assets/images/Image8.png',
                                                  fit: BoxFit.contain,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
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
