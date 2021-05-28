import 'package:autoservice/app/modules/car_detail/views/car_detail_view.dart';
import 'package:autoservice/app/widgets/UsedCarWidget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:autoservice/app/modules/used_cars_forsell/controllers/used_cars_forsell_controller.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:autoservice/app/Colors.dart';
import 'package:shimmer/shimmer.dart';

class UsedCarShimmer extends GetView<UsedCarsForsellController> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    bool enabled = true;
    return Column(
      children: [
        Column(
          children: [
            Container(
              height: height * .04,
              margin: EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(boxShadow: [
                // BoxShadow(
                //   color: AppColors.shadowColor,
                //   blurRadius: 20,
                //   offset: Offset(0, 3),
                // ),
              ], color: AppColors.whiteColor),
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300],
                highlightColor: Colors.grey[100],
                enabled: enabled,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return Container(
                        height: 27,
                        width: 80,
                        margin: EdgeInsets.only(right: 5),
                        child: Center(
                          child: Text(
                            '',
                            textScaleFactor: 1,
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Cairo',
                                color: AppColors.primaryColor),
                          ),
                        ),
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            border: Border.all(
                                color: AppColors.primaryColor, width: 1),
                            // color:
                            //     Color.fromRGBO(239, 244, 255, 1),
                            borderRadius: BorderRadius.circular(10)));
                  },
                ),
              ),
            ),
            Shimmer.fromColors(
              baseColor: Colors.grey[300],
              highlightColor: Colors.grey[100],
              enabled: enabled,
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
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 5),
                      child: Container(
                        height: height * .2,
                        width: width * .85,
                        margin: EdgeInsets.symmetric(horizontal: 2.5),
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: width * .12,
                              ),
                              child: Text('نيسان باترول للبيع',
                                  textScaleFactor: 1,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Cairo',
                                      color: Colors.black)),
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 40,
                                  width: width * 0.14,
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
                                    children: [
                                      Text(
                                        'سنة الصنع',
                                        textScaleFactor: 1,
                                        style: TextStyle(
                                            fontSize: 8,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Cairo',
                                            color: AppColors.whiteColor),
                                      ),
                                      Text(
                                        '2018',
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
                                SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  height: 40,
                                  width: width * 0.14,
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: AppColors.shadowColor,
                                          blurRadius: 20,
                                          offset: Offset(0, 10),
                                        ),
                                      ],
                                      color: Color.fromRGBO(55, 166, 178, 1),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'العداد/ كم',
                                        textScaleFactor: 1,
                                        style: TextStyle(
                                            fontSize: 8,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Cairo',
                                            color: AppColors.whiteColor),
                                      ),
                                      Text(
                                        '12000',
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
                                SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  height: 40,
                                  width: width * 0.14,
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
                                        'السعر / د.ك',
                                        textScaleFactor: 1,
                                        style: TextStyle(
                                            fontSize: 8,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Cairo',
                                            color: AppColors.whiteColor),
                                      ),
                                      Text(
                                        '2500',
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
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  height: height * .11,
                                  width: width * 0.4,
                                  child: Image.asset(
                                    'assets/images/BlueCar.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
