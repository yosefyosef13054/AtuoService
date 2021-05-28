import 'package:autoservice/app/modules/HomeScreen/views/home_screen_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:autoservice/app/modules/payment_success/controllers/payment_success_controller.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:autoservice/app/Colors.dart';

class PaymentSuccessView extends GetView<PaymentSuccessController> {
  PaymentSuccessController controller = Get.put(PaymentSuccessController());
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor:
          // Color.fromRGBO(255, 255, 255, 1),
          AppColors.scaffoldBackgroud,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        // toolbarHeight: 20,
        elevation: 0.0,
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(color: AppColors.scaffoldBackgroud),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: height,
                    width: width,
                    color: AppColors.primaryColor,
                    // child: Column(
                    //   children: [

                    //   ],
                    // ),
                  ),
                  SingleChildScrollView(
                    child: AnimationLimiter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: AnimationConfiguration.toStaggeredList(
                          duration: const Duration(milliseconds: 600),
                          childAnimationBuilder: (widget) => SlideAnimation(
                            horizontalOffset:
                                MediaQuery.of(context).size.width / 1,
                            child: SlideAnimation(child: widget),
                          ),
                          children: [
                            SizedBox(
                              height: height * 0.2,
                            ),
                            Text(
                              'عملية شراء مقبولة',
                              textScaleFactor: 1,
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Cairo',
                                  color: AppColors.whiteColor),
                            ),
                            SizedBox(
                              height: height * 0.1,
                            ),
                            Image.asset(
                              'assets/images/icons/Acs/Acs(8).png',
                              height: 130,
                              width: 130,
                            ),
                            SizedBox(
                              height: height * 0.1,
                            ),
                            InkWell(
                              onTap: () {
                                // Navigator.pushNamed(
                                //     context, HomeScreen.routeName);
                                // controller.submit();
                                Get.offAllNamed('/home-screen');
                              },
                              child: Center(
                                  child: Container(
                                child: Center(
                                  child: Container(
                                    child: Text(
                                      'استمر',
                                      textScaleFactor: 1,
                                      style: TextStyle(
                                          fontSize: 29,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Cairo',
                                          color: AppColors.whiteColor),
                                    ),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: AppColors.whiteColor),
                                    color: AppColors.primaryColor,
                                    borderRadius: BorderRadius.circular(15)),
                                height: 60,
                                width: width * 0.4,
                              )),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
