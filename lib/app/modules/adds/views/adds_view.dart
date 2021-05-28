// import 'package:autoservice/app/modules/accessories_add/views/accessories_add_view.dart';
// import 'package:autoservice/app/modules/heavyCars_add/views/heavy_cars_add_view.dart';
// import 'package:autoservice/app/modules/scrap_add/views/scrap_add_view.dart';
// import 'package:autoservice/app/modules/usedCars_add/views/used_cars_add_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:autoservice/app/modules/adds/controllers/adds_controller.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:autoservice/app/Colors.dart';

class AddsView extends GetView<AddsController> {
  @override
  Widget build(BuildContext context) {
    List items = [
      ['usedCarsForSell'.tr, '/used-cars-add'],
      ['scarpForSell'.tr, '/scrap-add'],
      ['heavyCarsForSell'.tr, '/heavy-cars-add'],
      ['accessoriesAdd'.tr, '/accessories-add'],
    ];
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroud,
      extendBodyBehindAppBar: true,
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
                            SizedBox(
                              height: height * 0.15,
                            ),
                            Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: width * .1),
                                  child: Text(
                                    'Add_add'.tr,
                                    textScaleFactor: 1,
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Cairo',
                                        color: AppColors.whiteColor),
                                  ),
                                ),
                                Text(
                                  'choose_category'.tr,
                                  textScaleFactor: 1,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Cairo',
                                      color: AppColors.whiteColor),
                                ),
                              ],
                            ),
                            Container(
                              height: height * 0.7,
                              child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: 4,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                      onTap: () {
                                        Get.toNamed(items[index][1]);
//                                        Get.to(items[index][1]);
                                      },
                                      child: Center(
                                        child: Container(
                                          width: width * 0.85,
                                          margin: EdgeInsets.symmetric(
                                              vertical: 15),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            border: Border.all(
                                                color: Color.fromRGBO(
                                                    244, 207, 93, 1),
                                                width: 1),
                                          ),
                                          child: Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: 3, horizontal: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Icon(
                                                  Icons.add,
                                                  color: Colors.yellow,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  items[index][0],
                                                  textScaleFactor: 1,
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily: 'Cairo',
                                                      color:
                                                          AppColors.whiteColor),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ));
                                },
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
    );
  }
}
