import 'package:autoservice/app/Colors.dart';
import 'package:autoservice/app/modules/heavyCars_list/views/heavy_cars_list_view.dart';
import 'package:autoservice/app/modules/scrap_cars_and_equipments/views/scrap_cars_and_equipments_view.dart';
import 'package:autoservice/app/modules/used_cars_forsell/views/used_cars_forsell_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import 'package:autoservice/app/modules/Cars_for_sell/controllers/cars_for_sell_controller.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarsForSellView extends GetView<CarsForSellController> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroud,
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0.0,
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
                child: Obx(
                  () => controller.loading.value == true
                      ? ShimmerLoading(
                          height: height,
                          width: width,
                        )
                      : SizedBox(
                          height: height,
                          child: SingleChildScrollView(
                            child: AnimationLimiter(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
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
                                    Center(
                                      child: Text(
                                        'سيارات للبيع',
                                        textScaleFactor: 1,
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Cairo',
                                            color: AppColors.whiteColor),
                                      ),
                                    ),
                                    CarouselSlider(
                                      autoPlay: true,
                                      autoPlayInterval: Duration(seconds: 5),
                                      height: height * 0.16,
                                      viewportFraction: 1.0,
                                      onPageChanged: (index) {},
                                      items: controller.topSlider
                                          .toList()
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
                                                  horizontal: 16),
                                              height: height * 0.16,
                                              width: width,
                                              child: Image.network(
                                                controller
                                                        .http.baseUrlForImages +
                                                    slide.imageUrl,
                                                fit: BoxFit.none,
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
                                    //       top: height * 0.03),
                                    //   height: height * 0.16,
                                    //   width: width,
                                    //   child: Image.asset(
                                    //     'assets/images/Image1.png',
                                    //     fit: BoxFit.cover,
                                    //   ),
                                    // ),
                                    SizedBox(
                                      height: 35,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Get.toNamed('/used-cars-forsell');
                                            // Navigator.pushNamed(
                                            //     context, UsedCarsForSell.routeName);
                                          },
                                          child: Container(
                                            width: width * 0.397,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.rectangle,
                                              border: Border.all(
                                                  color: Color.fromRGBO(
                                                      255, 255, 255, 1),
                                                  width: 1),
                                            ),
                                            child: Container(
                                              margin: EdgeInsets.all(5),
                                              child: Column(
                                                children: [
                                                  Image.asset(
                                                    'assets/images/icons/Cars/cars(2).png',
                                                    height: 60,
                                                    width: 80,
                                                  ),
                                                  // Icon(
                                                  //   Icons.car_repair,
                                                  //   color: Colors.white,
                                                  //   size: 60,
                                                  // ),
                                                  Text(
                                                    'سيارات مستعملة',
                                                    textScaleFactor: 1,
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily: 'Cairo',
                                                        color: AppColors
                                                            .whiteColor),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Get.toNamed(
                                                '/scrap-cars-and-equipments');
                                            // Navigator.pushNamed(context,
                                            //     ScrapCarsAndEquipMents.routeName);
                                          },
                                          child: Container(
                                            width: width * 0.397,
                                            // height: height * 0.116,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.rectangle,
                                              border: Border.all(
                                                  color: Color.fromRGBO(
                                                      255, 255, 255, 1),
                                                  width: 1),
                                            ),
                                            child: Container(
                                              margin: EdgeInsets.all(5),
                                              child: Column(
                                                children: [
                                                  Image.asset(
                                                    'assets/images/icons/Cars/cars(3).png',
                                                    height: 60,
                                                    width: 80,
                                                  ),
                                                  Text(
                                                    'سيارات سكراب',
                                                    textScaleFactor: 1,
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily: 'Cairo',
                                                        color: AppColors
                                                            .whiteColor),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 18,
                                    ),
                                    Center(
                                      child: InkWell(
                                        onTap: () {
                                          Get.toNamed('/heavy-cars-list');
                                        },
                                        child: Container(
                                          width: width * 0.397,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            border: Border.all(
                                                color: Color.fromRGBO(
                                                    255, 255, 255, 1),
                                                width: 1),
                                          ),
                                          child: Container(
                                            margin: EdgeInsets.all(5),
                                            child: Column(
                                              children: [
                                                Image.asset(
                                                  'assets/images/icons/Cars/cars(1).png',
                                                  height: 60,
                                                  width: 80,
                                                ),
                                                Text(
                                                  'شاحنات ومعدات',
                                                  textScaleFactor: 1,
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: 'Cairo',
                                                      color:
                                                          AppColors.whiteColor),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 35),
                                      child: CarouselSlider(
                                        autoPlay: true,
                                        autoPlayInterval: Duration(seconds: 5),
                                        height: height * 0.2,
                                        viewportFraction: 1.0,
                                        onPageChanged: (index) {},
                                        items: controller.bottomlider
                                            .toList()
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
                                                    horizontal: 16),
                                                height: height * 0.16,
                                                width: width,
                                                child: Image.network(
                                                  controller.http
                                                          .baseUrlForImages +
                                                      slide.imageUrl,
                                                  fit: BoxFit.cover,
                                                ),
                                              );
                                            },
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                    // Container(
                                    //   margin: EdgeInsets.only(
                                    //       right: 20, left: 20, top: 35),
                                    //   height: height * 0.2,
                                    //   width: width,
                                    //   child: Image.network(
                                    //     'https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1147&q=80',
                                    //     fit: BoxFit.cover,
                                    //   ),
                                    // ),
                                  ],
                                ),
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

class ShimmerLoading extends StatelessWidget {
  const ShimmerLoading({
    Key key,
    @required this.height,
    @required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300],
      highlightColor: Colors.grey[100],
      enabled: true,
      child: SizedBox(
        height: height,
        child: SingleChildScrollView(
          child: AnimationLimiter(
            child: Column(
              children: [
                Center(
                  child: Text(
                    'سيارات للبيع',
                    textScaleFactor: 1,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Cairo',
                        color: AppColors.whiteColor),
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(right: 20, left: 20, top: height * 0.03),
                  height: height * 0.16,
                  width: width,
                  child: Image.asset(
                    'assets/images/Image1.png',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.toNamed('/used-cars-forsell');
                        // Navigator.pushNamed(
                        //     context, UsedCarsForSell.routeName);
                      },
                      child: Container(
                        width: width * 0.397,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border: Border.all(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              width: 1),
                        ),
                        child: Container(
                          margin: EdgeInsets.all(5),
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/icons/Cars/cars(2).png',
                                height: 60,
                                width: 80,
                              ),
                              // Icon(
                              //   Icons.car_repair,
                              //   color: Colors.white,
                              //   size: 60,
                              // ),
                              Text(
                                'سيارات مستعملة',
                                textScaleFactor: 1,
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Cairo',
                                    color: AppColors.whiteColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed('/scrap-cars-and-equipments');
                        // Navigator.pushNamed(context,
                        //     ScrapCarsAndEquipMents.routeName);
                      },
                      child: Container(
                        width: width * 0.397,
                        // height: height * 0.116,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border: Border.all(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              width: 1),
                        ),
                        child: Container(
                          margin: EdgeInsets.all(5),
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/icons/Cars/cars(3).png',
                                height: 60,
                                width: 80,
                              ),
                              Text(
                                'سيارات سكراب',
                                textScaleFactor: 1,
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Cairo',
                                    color: AppColors.whiteColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 18,
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      Get.toNamed('/heavy-cars-list');
                    },
                    child: Container(
                      width: width * 0.397,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        border: Border.all(
                            color: Color.fromRGBO(255, 255, 255, 1), width: 1),
                      ),
                      child: Container(
                        margin: EdgeInsets.all(5),
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/icons/Cars/cars(1).png',
                              height: 60,
                              width: 80,
                            ),
                            Text(
                              'شاحنات ومعدات',
                              textScaleFactor: 1,
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Cairo',
                                  color: AppColors.whiteColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 20, left: 20, top: 35),
                  height: height * 0.2,
                  width: width,
                  child: Image.network(
                    'https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1147&q=80',
                    fit: BoxFit.cover,
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
