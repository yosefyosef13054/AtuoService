import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:autoservice/app/modules/scrap_delivery_request/controllers/scrap_delivery_request_controller.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:autoservice/app/Colors.dart';

class ScrapDeliveryRequestView extends GetView<ScrapDeliveryRequestController> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0.0,
        // centerTitle: true,
        // title: Text(
        //   'طلب توصيل من السكراب',
        //   textScaleFactor: 1,
        //                               style: TextStyle(
        //       fontSize: 20,
        //       fontWeight: FontWeight.w500,
        //       fontFamily: 'Cairo',
        //       color: AppColors.whiteColor),
        // ),
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
                height: height * .1,
                color: AppColors.primaryColor,
                child: Center(
                  child: Text(
                    'طلب توصيل من السكراب',
                    textScaleFactor: 1,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Cairo',
                        color: AppColors.whiteColor),
                  ),
                ),
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
                            Container(
                              height: height * .16,
                            ),

                            Center(
                              child: Container(
                                  width: width * .9,
                                  padding: EdgeInsets.all(10),
                                  margin: EdgeInsets.symmetric(vertical: 5),
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(233, 236, 242, 1),
                                    borderRadius: BorderRadius.circular(7),
                                  ),
                                  child: Column(children: [
                                    Container(
                                      margin: EdgeInsets.only(top: 30),
                                      child: Image.asset(
                                        'assets/images/icons/Acs/Acs(5).png',
                                        height: 40,
                                        width: 40,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Center(
                                      child: Text(
                                        'تم الاتفاق مع',
                                        textScaleFactor: 1,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'GE_SS_Two_Light',
                                            color: Colors.green),
                                      ),
                                    ),
                                    Container(
                                      height: height * .01,
                                    ),
                                    Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          ClipOval(
                                              child:
                                                  // image != null
                                                  //     ? Image.file(
                                                  //         image,
                                                  //         fit: BoxFit.cover,
                                                  //       )
                                                  //     :
                                                  Image.network(
                                            'https://images.unsplash.com/photo-1541963463532-d68292c34b19?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxleHBsb3JlLWZlZWR8M3x8fGVufDB8fHw%3D&w=1000&q=80',
                                            fit: BoxFit.cover,
                                            height: width * 0.09,
                                            width: width * 0.09,
                                          )),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Text(
                                            'كراج الحاج محمد',
                                            textScaleFactor: 1,
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'GE_SS_Two_Light',
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: height * .05,
                                    ),
                                    Center(
                                      child: Text(
                                        'أدخل رقم هاتفك',
                                        textScaleFactor: 1,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'GE_SS_Two_Light',
                                            color: AppColors.primaryColor),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Center(
                                      child: Container(
                                        child: Center(
                                          child: Text(
                                            'ارسل الطلب',
                                            textScaleFactor: 1,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'GE_SS_Two_Light',
                                                color: AppColors.whiteColor),
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: AppColors.whiteColor),
                                            color: AppColors.primaryColor,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        height: 40,
                                        width: width * 0.4,
                                      ),
                                    ),
                                    Container(
                                      height: height * .04,
                                    ),
                                  ])),
                            ),

                            // Row(
                            //   children: [
                            //     Container(
                            //       width: 60,
                            //       decoration: BoxDecoration(
                            //           border: Border.all(
                            //               color: AppColors.primaryColor),
                            //           color: Colors.white,
                            //           borderRadius: BorderRadius.circular(10)),
                            //       child: Center(
                            //         child: Container(
                            //           child: Text(
                            //             '2019',
                            //             textScaleFactor: 1,
                            //              style: TextStyle(
                            //                 fontSize: 18,
                            //                 fontWeight: FontWeight.w500,
                            //                 fontFamily: 'Cairo',
                            //                 color: AppColors.primaryColor),
                            //           ),
                            //         ),
                            //       ),
                            //     ),
                            //   ],
                            // )

                            SizedBox(
                              height: height * 0.15,
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
