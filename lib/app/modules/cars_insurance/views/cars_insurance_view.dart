import 'package:autoservice/app/modules/againest_insurance/views/againest_insurance_view.dart';
import 'package:autoservice/app/modules/fullinsurance/views/fullinsurance_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:autoservice/app/modules/cars_insurance/controllers/cars_insurance_controller.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:autoservice/app/Colors.dart';

class CarsInsuranceView extends GetView<CarsInsuranceController> {
  @override
  Widget build(BuildContext context) {
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
              top: 1,
              right: 0,
              left: 0,
              child: Container(
                height: height,
                color: AppColors.primaryColor,
              ),
            ),
            Positioned(
              top: height * 0.05,
              right: 0,
              left: 0,
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
                            height: height * 0.07,
                          ),
                          Center(
                            child: Text(
                              'تأمين السيارت',
                              textScaleFactor: 1,
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Cairo',
                                  color: AppColors.whiteColor),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                right: 20, left: 20, top: height * 0.09),
                            height: height * 0.15,
                            width: width,
                            child: Image.network(
                              'https://image.shutterstock.com/image-photo/cars-sale-stock-row-car-260nw-636632101.jpg',
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
                                  Get.to(AgainestInsuranceView());
                                  // Navigator.pushNamed(context,
                                  //     AgainstOtherInsuranceScreen.routeName);
                                },
                                child: Container(
                                  width: width * 0.397,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    border: Border.all(
                                        color: AppColors.whiteColor, width: 1),
                                  ),
                                  child: Container(
                                    margin: EdgeInsets.all(5),
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          'assets/images/icons/Acs/Acs(2).png',
                                          height: 60,
                                          width: 80,
                                        ),
                                        Text(
                                          'التأمين ضد الغير',
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
                                  Get.to(FullinsuranceView());
                                  // Navigator.pushNamed(
                                  //     context, FullInsuranceScreen.routeName);
                                },
                                child: Container(
                                  width: width * 0.397,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    border: Border.all(
                                        color: AppColors.whiteColor, width: 1),
                                  ),
                                  child: Container(
                                    margin: EdgeInsets.all(5),
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          'assets/images/icons/Acs/Acs(1).png',
                                          height: 60,
                                          width: 60,
                                        ),
                                        Text(
                                          'التأمين الشامل',
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
                          Container(
                            margin: EdgeInsets.only(
                                right: 20, left: 20, top: height * 0.09),
                            height: height * 0.15,
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
