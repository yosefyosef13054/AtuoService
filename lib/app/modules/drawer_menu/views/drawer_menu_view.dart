import 'package:autoservice/app/modules/HomeScreen/controllers/home_screen_controller.dart';
import 'package:autoservice/app/modules/HomeScreen/views/home_screen_view.dart';
import 'package:autoservice/app/modules/adds/views/adds_view.dart';

import 'package:autoservice/app/modules/scrap_orders/views/scrap_orders_view.dart';
import 'package:flutter/material.dart';
import 'package:autoservice/app/modules/my_orders/views/my_orders_view.dart';

import 'package:get/get.dart';

import 'package:autoservice/app/modules/drawer_menu/controllers/drawer_menu_controller.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:autoservice/app/Colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class DrawerMenuView extends GetView<DrawerMenuController> {
  final HomeScreenController homecontroller = Get.find();
  showDialogLogOut(context) {
    Alert(
      context: context,
      type: AlertType.warning,
      title: "sure_Logout".tr,
      // desc:
      //     "sure_Logout".tr,
      buttons: [
        DialogButton(
          child: Text(
            'Log_out'.tr,
            textScaleFactor: 1,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () async {
            // SharedPreferences prefs = await SharedPreferences.getInstance();
            // await prefs.remove("token");
            homecontroller.logout();
          },
          color: Color.fromRGBO(0, 179, 134, 1.0),
        ),
        DialogButton(
          child: Text(
            'cancel'.tr,
            textScaleFactor: 1,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          color: Colors.red,
        ),
      ],
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final locale = Get.locale;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        // extendBodyBehindAppBar: true,
        appBar: AppBar(
            backgroundColor: AppColors.primaryColor,
            elevation: 0.0,
            toolbarHeight: 35,
            actions: [
              Text('V 1.0'),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 7),
                child: Image.asset(
                  'assets/images/Group786.png',
                  fit: BoxFit.contain,
                  height: 23,
                  width: 23,
                ),
              )
            ]),
        body: Obx(
          () => Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                // alignment: Alignment.topCenter,
                children: [
                  Container(
                    color: AppColors.primaryColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Obx(() => homecontroller.token.value.toString() ==
                                null.toString()
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Get.offAllNamed('/sign-in');
                                    },
                                    child: Container(
                                      width: width * 0.5,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: AppColors.whiteColor),
                                          color: AppColors.primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Center(
                                        child: Text(
                                          'login'.tr,
                                          textScaleFactor: 1,
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'Cairo',
                                              color: AppColors.whiteColor),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                ],
                              )
                            : Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  // SizedBox(height: 25),
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
                                    height: width * 0.2,
                                    width: width * 0.2,
                                  )),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    homecontroller.profile.clientName,
                                    textScaleFactor: 1,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Cairo',
                                        color: Colors.white),
                                  ),
                                  Directionality(
                                    textDirection: TextDirection.ltr,
                                    child: Text(
                                      homecontroller.profile.phone.toString(),
                                      textScaleFactor: 1,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Cairo',
                                          color: Colors.white),
                                    ),
                                  ),
                                  Text(
                                    homecontroller.profile.email == null
                                        ? ''
                                        : homecontroller.profile.email
                                            .toString(),
                                    textScaleFactor: 1,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Cairo',
                                        color: Colors.grey),
                                  ),
                                ],
                              )),
                        Obx(
                          () => homecontroller.token.value.toString() ==
                                      'null'.toString() ||
                                  homecontroller.token.value.toString() == ''
                              ? Container()
                              : InkWell(
                                  onTap: () async {
                                    String token = "";
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    homecontroller.token.value.toString() ==
                                                'null'.toString() ||
                                            homecontroller.token.value
                                                    .toString() ==
                                                ''
                                        ? Get.offNamed('/sign-in')
                                        : Get.to(AddsView());
                                    // Navigator.pushNamed(context, AddsScreen.routeName);
                                  },
                                  child: Container(
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.add,
                                                color: Colors.white,
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                'Add_add'.tr,
                                                textScaleFactor: 1,
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily: 'Cairo',
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    height: height * .055,
                                    width: width * 0.54,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: AppColors.whiteColor),
                                        color: AppColors.primaryColor,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                  ),
                                ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          // margin: EdgeInsets.only(bottom: height * .042),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () async {
                                  String token = "";
                                  SharedPreferences prefs =
                                      await SharedPreferences.getInstance();
                                  homecontroller.token.value.toString() ==
                                              'null'.toString() ||
                                          homecontroller.token.value
                                                  .toString() ==
                                              ''
                                      ? Get.offNamed('/sign-in')
                                      : Get.toNamed('/scrap-orders',
                                          arguments: {'profile': true});

                                  //Get.to(ScrapOrdersView());
                                  // Navigator.pushNamed(
                                  //     context, ScrapOrdersScreen.routeName);
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: AppColors.whiteColor,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15))),
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 20),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            height: 40,
                                            width: 50,
                                            child: Image.asset(
                                              'assets/images/icons/Menu/gordini@3x.png',
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                'my_orders'.tr,
                                                textScaleFactor: 1,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily: 'Cairo',
                                                    color: Colors.black),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )),
                              ),
                              InkWell(
                                onTap: () async {
                                  String token = "";
                                  SharedPreferences prefs =
                                      await SharedPreferences.getInstance();
                                  homecontroller.token.value.toString() ==
                                              'null'.toString() ||
                                          homecontroller.token.value
                                                  .toString() ==
                                              ''
                                      ? Get.offNamed('/sign-in')
                                      : Get.toNamed('/my-orders');

                                  // Navigator.pushNamed(
                                  //     context, ScrapOrdersScreen.routeName);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: AppColors.whiteColor,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          height: 40,
                                          width: 70,
                                          child: Image.asset(
                                            'assets/images/icons/Menu/Group815@3x.png',
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        Text(
                                          'moshtryaty'.tr,
                                          textScaleFactor: 1,
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'Cairo',
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  String token;
                                  SharedPreferences prefs =
                                      await SharedPreferences.getInstance();
                                  token = prefs.getString("token");
                                  homecontroller.token.value.toString() ==
                                              'null'.toString() ||
                                          homecontroller.token.value
                                                  .toString() ==
                                              ''
                                      ? Get.offNamed('/sign-in')
                                      : Get.toNamed('/my-adds');
                                },
                                child: Container(
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 20),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        // Icon(
                                        //   Icons.car_repair,
                                        //   size: 30,
                                        // ),
                                        Container(
                                          height: 40,
                                          width: 50,
                                          child: Image.asset(
                                            'assets/images/icons/Menu/Group726@3x.png',
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        Text(
                                          'my_adds'.tr,
                                          textScaleFactor: 1,
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'Cairo',
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // height: height * 0.11,
                                  // width: width * 0.25,
                                  decoration: BoxDecoration(
                                      color: AppColors.whiteColor,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //           Positioned(

                  //                         child: ListView(
                  // children: const <Widget>[
                  //   Card(child: ListTile(title: Text('One-line ListTile'))),
                  //   Card(
                  //     child: ListTile(
                  //       leading: FlutterLogo(),
                  //       title: Text('One-line with leading widget'),
                  //     ),
                  //   ),]),
                  //     ),
                  // Positioned(
                  //   top: 30,
                  //   right: width * 0.85,
                  //   left: 0,
                  //   child: Icon(
                  //     Icons.notifications,
                  //     size: 30,
                  //     color: Colors.white,
                  //   ),
                  // ),

                  Container(
                    height: homecontroller.token.value.toString() ==
                                'null'.toString() ||
                            homecontroller.token.value.toString() == ''
                        ? height * 0.7
                        : height * 0.5,
                    decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        locale == Locale('ar')
                            ? Container(
                                margin: EdgeInsets.only(left: 20),
                                child: Column(children: <Widget>[
                                  // الرئيسية صفحتي المفضلة خدمة العملاء الإعدادات الشروط والاحكام
                                  SizedBox(
                                    height: 22,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Get.to(HomeScreenView());
                                      // Navigator.pushNamed(
                                      //     context, HomeScreen.routeName);
                                    },
                                    child: Container(
                                      // margin: EdgeInsets.only(bottom: 5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                              height: 34,
                                              width: 45,
                                              child: Image.asset(
                                                'assets/images/icons/Menu/home@3x.png',
                                                fit: BoxFit.contain,
                                              )),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Text(
                                            'homepage'.tr,
                                            textScaleFactor: 1,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: 'Cairo',
                                                color: AppColors.primaryColor),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  homecontroller.token.value.toString() ==
                                              'null'.toString() ||
                                          homecontroller.token.value
                                                  .toString() ==
                                              ''
                                      ? Container()
                                      : SizedBox(
                                          height: 10,
                                        ),
                                  Obx(() => homecontroller.token.value
                                                  .toString() ==
                                              'null'.toString() ||
                                          homecontroller.token.value
                                                  .toString() ==
                                              ''
                                      ? Container()
                                      : InkWell(
                                          onTap: () {
                                            Get.toNamed('/my-profile',
                                                arguments: {'isShop': false});
                                          },
                                          child: Container(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  height: 34,
                                                  width: 45,
                                                  child: Image.asset(
                                                    'assets/images/icons/Menu/user@3x.png',
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 22,
                                                ),
                                                Text(
                                                  'profilePage'.tr,
                                                  textScaleFactor: 1,
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontFamily: 'Cairo',
                                                      color: AppColors
                                                          .primaryColor),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Obx(
                                    () => homecontroller.token.value
                                                    .toString() ==
                                                'null'.toString() ||
                                            homecontroller.token.value
                                                    .toString() ==
                                                ''
                                        ? Container()
                                        : InkWell(
                                            onTap: () {
                                              Get.toNamed('/myfavorite');
                                            },
                                            child: Container(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    height: 34,
                                                    width: 45,
                                                    child: Image.asset(
                                                      'assets/images/icons/Menu/Path4636@3x.png',
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 18,
                                                  ),
                                                  Text(
                                                    'my_favorite'.tr,
                                                    textScaleFactor: 1,
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontFamily: 'Cairo',
                                                        color: AppColors
                                                            .primaryColor),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Get.toNamed('/customer-services');
                                    },
                                    child: Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: 42,
                                          ),
                                          Container(
                                              height: 34,
                                              width: 45,
                                              child: Image.asset(
                                                'assets/images/icons/Menu/Support.png',
                                                //   'assets/images/icons/Menu/Group720@3x.png',
                                                fit: BoxFit.contain,
                                              )),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Text(
                                            'customerService'.tr,
                                            textScaleFactor: 1,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: 'Cairo',
                                                color: AppColors.primaryColor),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Get.toNamed('/sittings');
                                    },
                                    child: Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 34,
                                            width: 45,
                                            child: Image.asset(
                                              'assets/images/icons/Menu/Group721@3x.png',
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 18,
                                          ),
                                          Text(
                                            'edit'.tr,
                                            textScaleFactor: 1,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: 'Cairo',
                                                color: AppColors.primaryColor),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Get.toNamed('/terms-conditions');
                                    },
                                    child: Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: 38,
                                          ),
                                          Container(
                                            height: 34,
                                            width: 45,
                                            child: Image.asset(
                                              'assets/images/icons/Menu/Group722@3x.png',
                                              fit: BoxFit.contain,
                                              height: 34,
                                              width: 45,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            'terms_conditions'.tr,
                                            textScaleFactor: 1,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: 'Cairo',
                                                color: AppColors.primaryColor),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),

                                  Obx(
                                    () => homecontroller.token.value
                                                .toString() ==
                                            null.toString()
                                        ? Container()
                                        : InkWell(
                                            onTap: () {
                                              showDialogLogOut(context);
                                            },
                                            child: Container(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  SizedBox(
                                                    width: 7,
                                                  ),
                                                  Container(
                                                    height: 34,
                                                    width: 45,
                                                    child: Image.asset(
                                                      'assets/images/icons/Menu/Group724@3x.png',
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 34,
                                                  ),
                                                  Text(
                                                    'Log_out'.tr,
                                                    textScaleFactor: 1,
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontFamily: 'Cairo',
                                                        color: AppColors
                                                            .primaryColor),
                                                  ),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ]),
                              )
                            : Container(
                                margin: EdgeInsets.only(right: 20),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      // الرئيسية صفحتي المفضلة خدمة العملاء الإعدادات الشروط والاحكام
                                      SizedBox(
                                        height: 22,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Get.to(HomeScreenView());
                                          // Navigator.pushNamed(
                                          //     context, HomeScreen.routeName);
                                        },
                                        child: Container(
                                          // margin: EdgeInsets.only(bottom: 5),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                  height: 34,
                                                  width: 45,
                                                  child: Image.asset(
                                                    'assets/images/icons/Menu/home@3x.png',
                                                    fit: BoxFit.contain,
                                                  )),
                                              SizedBox(
                                                width: 26,
                                              ),
                                              Text(
                                                'homepage'.tr,
                                                textScaleFactor: 1,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily: 'Cairo',
                                                    color:
                                                        AppColors.primaryColor),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      homecontroller.token.value.toString() ==
                                                  'null'.toString() ||
                                              homecontroller.token.value
                                                      .toString() ==
                                                  ''
                                          ? Container()
                                          : SizedBox(
                                              height: 10,
                                            ),
                                      Obx(() => homecontroller.token.value
                                                      .toString() ==
                                                  'null'.toString() ||
                                              homecontroller.token.value
                                                      .toString() ==
                                                  ''
                                          ? Container()
                                          : InkWell(
                                              onTap: () {
                                                Get.toNamed('/my-profile',
                                                    arguments: {
                                                      'isShop': false
                                                    });
                                              },
                                              child: Container(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      height: 34,
                                                      width: 45,
                                                      child: Image.asset(
                                                        'assets/images/icons/Menu/user@3x.png',
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 22,
                                                    ),
                                                    Text(
                                                      'profilePage'.tr,
                                                      textScaleFactor: 1,
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontFamily: 'Cairo',
                                                          color: AppColors
                                                              .primaryColor),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Obx(
                                        () => homecontroller.token.value
                                                        .toString() ==
                                                    'null'.toString() ||
                                                homecontroller.token.value
                                                        .toString() ==
                                                    ''
                                            ? Container()
                                            : InkWell(
                                                onTap: () {
                                                  Get.toNamed('/myfavorite');
                                                },
                                                child: Container(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Container(
                                                        height: 34,
                                                        width: 45,
                                                        child: Image.asset(
                                                          'assets/images/icons/Menu/Path4636@3x.png',
                                                          fit: BoxFit.contain,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 22,
                                                      ),
                                                      Text(
                                                        'my_favorite'.tr,
                                                        textScaleFactor: 1,
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontFamily: 'Cairo',
                                                            color: AppColors
                                                                .primaryColor),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Get.toNamed('/customer-services');
                                        },
                                        child: Container(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                width: 14,
                                              ),
                                              Container(
                                                  height: 34,
                                                  width: 45,
                                                  child: Image.asset(
                                                    'assets/images/icons/Menu/Support.png',
                                                    //   'assets/images/icons/Menu/Group720@3x.png',,
                                                    fit: BoxFit.contain,
                                                    height: 28,
                                                    width: 25,
                                                  )),
                                              SizedBox(
                                                width: 30,
                                              ),
                                              Text(
                                                'customerService'.tr,
                                                textScaleFactor: 1,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily: 'Cairo',
                                                    color:
                                                        AppColors.primaryColor),
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Get.toNamed('/sittings');
                                        },
                                        child: Container(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Container(
                                                height: 34,
                                                width: 45,
                                                child: Image.asset(
                                                  'assets/images/icons/Menu/Group721@3x.png',
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 22,
                                              ),
                                              Text(
                                                'edit'.tr,
                                                textScaleFactor: 1,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily: 'Cairo',
                                                    color:
                                                        AppColors.primaryColor),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Get.toNamed('/terms-conditions');
                                        },
                                        child: Container(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                width: 55,
                                              ),
                                              Container(
                                                height: 34,
                                                width: 45,
                                                child: Image.asset(
                                                  'assets/images/icons/Menu/Group722@3x.png',
                                                  fit: BoxFit.contain,
                                                  height: 34,
                                                  width: 45,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 0,
                                              ),
                                              Text(
                                                'terms_conditions'.tr,
                                                textScaleFactor: 1,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily: 'Cairo',
                                                    color:
                                                        AppColors.primaryColor),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),

                                      SizedBox(
                                        height: 10,
                                      ),
                                      Obx(
                                        () => homecontroller.token.value
                                                    .toString() ==
                                                null.toString()
                                            ? Container()
                                            : InkWell(
                                                onTap: () {
                                                  showDialogLogOut(context);
                                                },
                                                child: Container(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Container(
                                                        height: 34,
                                                        width: 45,
                                                        child: Image.asset(
                                                          'assets/images/icons/Menu/Group724@3x.png',
                                                          fit: BoxFit.contain,
                                                          height: 34,
                                                          width: 45,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 20,
                                                      ),
                                                      Text(
                                                        'Log_out'.tr,
                                                        textScaleFactor: 1,
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontFamily: 'Cairo',
                                                            color: AppColors
                                                                .primaryColor),
                                                      ),
                                                      SizedBox(
                                                        width: 9,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                      ),
                                    ]),
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
    );
  }
}
