import 'package:autoservice/app/modules/Cart/views/cart_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:autoservice/app/modules/againest_insurance/controllers/againest_insurance_controller.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:autoservice/app/Colors.dart';

class AgainestInsuranceView extends GetView<AgainestInsuranceController> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroud,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'التأمين ضد الغير',
          textScaleFactor: 1,
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              fontFamily: 'Cairo',
              color: AppColors.whiteColor),
        ),
        backgroundColor: AppColors.primaryColor,
        elevation: 0.0,
      ),
      bottomNavigationBar: Container(
        height: height * .11,
        width: width,
        color: AppColors.primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 1,
              color: Colors.white,
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Get.to(CartView());
                    // Navigator.pushNamed(context, CartScreen.routeName);
                  },
                  child: Container(
                    child: Center(
                      child: Text(
                        'استمر',
                        textScaleFactor: 1,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Cairo',
                            color: AppColors.whiteColor),
                      ),
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.whiteColor),
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(15)),
                    height: 40,
                    width: width * 0.4,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      'الإجمالي',
                      textScaleFactor: 1,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Cairo',
                          color: AppColors.whiteColor),
                    ),
                    Row(
                      children: [
                        Text(
                          '6,500',
                          textScaleFactor: 1,
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Cairo',
                              color: AppColors.whiteColor),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'د.ك',
                          textScaleFactor: 1,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Cairo',
                              color: AppColors.whiteColor),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Spacer(),
          ],
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
              top: height * 0.05,
              right: 0,
              left: 0,
              child: SizedBox(
                height: height,
                child: SingleChildScrollView(
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
                            height: height * 0.05,
                          ),
                          // Center(
                          //   child: Text(
                          //     'التأمين ضد الغير',
                          //     textScaleFactor: 1,
                          //      style: TextStyle(
                          //         fontSize: 24,
                          //         fontWeight: FontWeight.w500,
                          //         fontFamily: 'Cairo',
                          //         color: AppColors.whiteColor),
                          //   ),
                          // ),
                          Container(
                            width: width * .9,
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                                color: AppColors.whiteColor,
                                borderRadius: BorderRadius.circular(7)),
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 15),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        'assets/images/icons/Ta2min/Ta3min(1).png',
                                        height: 25,
                                        width: 25,
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        'نوع السيارة ',
                                        textScaleFactor: 1,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Cairo',
                                            color: AppColors.primaryColor),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 18,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: AppColors.primaryColor,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Container(
                                          width: width * 0.25,
                                          margin: EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 5),
                                          child: Center(
                                            child: Text(
                                              'خصوصي',
                                              textScaleFactor: 1,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: 'Cairo',
                                                  color: AppColors.whiteColor),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: width * 0.25,
                                        decoration: BoxDecoration(
                                            color: AppColors.primaryColor,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 5),
                                          child: Center(
                                            child: Text(
                                              'وانيت',
                                              textScaleFactor: 1,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: 'Cairo',
                                                  color: AppColors.whiteColor),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: width * 0.25,
                                        decoration: BoxDecoration(
                                            color: AppColors.primaryColor,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 5),
                                          child: Center(
                                            child: Text(
                                              'أخرى',
                                              textScaleFactor: 1,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: 'Cairo',
                                                  color: AppColors.whiteColor),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: width * .9,
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Column(children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/images/icons/Ta2min/Ta3min(7).png',
                                    height: 20,
                                    width: 20,
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    'مدة التأمين',
                                    textScaleFactor: 1,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Cairo',
                                        color: AppColors.primaryColor),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Column(
                                children: [
                                  Container(
                                    width: width * 0.36,
                                    decoration: BoxDecoration(
                                        color: AppColors.primaryColor,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 5),
                                      child: Center(
                                        child: Text(
                                          'سنة | 12 د.ك',
                                          textScaleFactor: 1,
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'Cairo',
                                              color: AppColors.whiteColor),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    width: width * 0.36,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: AppColors.primaryColor),
                                        color: AppColors.whiteColor,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 5),
                                      child: Center(
                                        child: Text(
                                          'سنتين | 19 د.ك',
                                          textScaleFactor: 1,
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'Cairo',
                                              color: AppColors.primaryColor),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    'يشترط المرور لتجديد السيارة سنتين أن تكون موديل 2014 ومافوق',
                                    textScaleFactor: 1,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Cairo',
                                        color: Colors.red),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              )
                            ]),
                          ),
                          Container(
                            width: width * .9,
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Column(children: [
                              Row(
                                children: [
                                  // Icon(
                                  //   Icons.error,
                                  //   color: AppColors.primaryColor,
                                  // ),
                                  Image.asset(
                                    'assets/images/icons/Ta2min/Ta3min(4).png',
                                    height: 20,
                                    width: 20,
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Flexible(
                                    child: Text(
                                      'عدم حق الرجوع (المسؤولية المدنية)',
                                      textScaleFactor: 1,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Cairo',
                                          color: AppColors.primaryColor),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                'في حالة مخالفتك لقانون السير وتسببت في حادث لاسمح الله لايحق لشركة التأمين بمقاضاتك وتتحمل عنك كامل المسؤولية',
                                textScaleFactor: 1,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Cairo',
                                    color: AppColors.primaryColor),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset(
                                    'assets/images/icons/Ta2min/Ta3min(6).png',
                                    height: 32,
                                    width: 32,
                                  ),
                                  Text(
                                    'اضغط هنا لإضافة الخدمة للطلب | 14 د.ك',
                                    textScaleFactor: 1,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Cairo',
                                        color: Colors.red),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ]),
                          ),
                          Container(
                            width: width * .9,
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.only(top: 10, bottom: 30),
                            decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      // Icon(
                                      //   Icons.error,
                                      //   color: AppColors.primaryColor,
                                      // ),
                                      Image.asset(
                                        'assets/images/icons/Ta2min/Ta3min(2).png',
                                        height: 20,
                                        width: 20,
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Flexible(
                                        child: Text(
                                          'الأوراق المطلوبة',
                                          textScaleFactor: 1,
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'Cairo',
                                              color: AppColors.primaryColor),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 30),
                                    child: Text(
                                      'البطاقة المدنية',
                                      textScaleFactor: 1,
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Cairo',
                                          color: AppColors.primaryColor),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Center(
                                    child: Container(
                                      width: width * .81,
                                      padding: EdgeInsets.all(10),
                                      margin: EdgeInsets.symmetric(vertical: 5),
                                      decoration: BoxDecoration(
                                        color: Color.fromRGBO(233, 236, 242, 1),
                                        borderRadius: BorderRadius.circular(7),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                                'وجه',
                                                textScaleFactor: 1,
                                                style: TextStyle(
                                                    fontSize: 11,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: 'Cairo',
                                                    color: Colors.black),
                                              ),
                                              Container(
                                                width: width * .22,
                                                height: height * 0.1,
                                                padding: EdgeInsets.all(10),
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 5),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(0),
                                                ),
                                                child: Center(
                                                  child: Icon(Icons.add),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                'ظهر',
                                                textScaleFactor: 1,
                                                style: TextStyle(
                                                    fontSize: 11,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: 'Cairo',
                                                    color: Colors.black),
                                              ),
                                              Container(
                                                width: width * .22,
                                                height: height * 0.1,
                                                padding: EdgeInsets.all(10),
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 5),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(0),
                                                ),
                                                child: Center(
                                                  child: Icon(Icons.add),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 30),
                                        child: Text(
                                          'دفتر السيارة',
                                          textScaleFactor: 1,
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'Cairo',
                                              color: AppColors.primaryColor),
                                        ),
                                      ),
                                      Center(
                                        child: Container(
                                          width: width * .81,
                                          padding: EdgeInsets.all(10),
                                          margin:
                                              EdgeInsets.symmetric(vertical: 5),
                                          decoration: BoxDecoration(
                                            color: Color.fromRGBO(
                                                233, 236, 242, 1),
                                            borderRadius:
                                                BorderRadius.circular(7),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Column(
                                                children: [
                                                  Container(
                                                    width: width * .22,
                                                    height: height * 0.1,
                                                    padding: EdgeInsets.all(10),
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            vertical: 5),
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0),
                                                    ),
                                                    child: Center(
                                                      child: Icon(Icons.add),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ]),
                          ),
                          Container(
                            height: 40,
                            margin: EdgeInsets.symmetric(vertical: 30),
                          )
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
