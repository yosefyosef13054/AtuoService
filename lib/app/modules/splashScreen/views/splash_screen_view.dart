import 'package:autoservice/app/Colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  SplashScreenController serviceController = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        child: Image.asset(
          'assets/images/App-Splash.png',
          fit: BoxFit.cover,
          height: height,
          width: width,
        ),
      ),
      // body: Container(
      //     decoration: BoxDecoration(
      //       color: AppColors.primaryColor,
      //     ),
      //     child: Center(
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           Container(
      //             child: ClipRect(
      //                 child: Container(
      //               child: Image.asset(
      //                 'assets/images/App-Splash.png',
      //                 fit: BoxFit.cover,
      //               ),
      //             )),
      //           ),
      //           SizedBox(
      //             height: 20,
      //           ),
      //         ],
      //       ),
      //     )),
    );
  }
}
