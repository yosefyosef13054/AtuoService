import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:autoservice/app/modules/new_accessories_details/controllers/new_accessories_details_controller.dart';
import 'package:autoservice/app/modules/Cart/controllers/cart_controller.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:autoservice/app/Colors.dart';
import 'package:fdottedline/fdottedline.dart';
import 'package:autoservice/app/modules/accessories/model.dart' as model;
import 'package:autoservice/app/modules/Cart/views/cart_view.dart';
import 'package:autoservice/app/modules/new_accessories_details/accesoriesDetailsModel.dart'
    as detailsModel;
import 'package:shimmer/shimmer.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:autoservice/app/modules/HomeScreen/controllers/home_screen_controller.dart';

class NewAccessoriesDetailsView
    extends GetView<NewAccessoriesDetailsController> {
  // NewAccessoriesDetailsView({this.item, this.url});
  // String url;
  // var item;

  final CartController cartController = Get.put(CartController());
  final HomeScreenController homecontroller = Get.find();

  // final NewAccessoriesDetailsController controller =
  //     Get.put(NewAccessoriesDetailsController());

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    // detailsModel.AccessoriesDetailsModel item =
    //     controller.accessoriesDetailsModel;
    return WillPopScope(
      onWillPop: () async {
        var value = true;
        controller.isbackFavoriteScreen.value == true
            ? Get.offAndToNamed('/myfavorite')
            : Get.back();
        return value;
      },
      child: Stack(
        children: [
          Scaffold(
            backgroundColor:
                // Color.fromRGBO(255, 255, 255, 1),
                AppColors.scaffoldBackgroud,
            appBar: AppBar(
                toolbarHeight: 65,
                backgroundColor: AppColors.primaryColor,
                elevation: 0.0,
                title: Text(
                  'اكسسورات جديدة',
                  textScaleFactor: 1,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Cairo',
                      color: AppColors.whiteColor),
                ),
                centerTitle: true,
                actions: [
                  InkWell(
                    onTap: () {
                      homecontroller.token.value.toString() ==
                                  'null'.toString() ||
                              homecontroller.token.value.toString() == ''
                          ? Get.toNamed('/sign-in')
                          : Get.toNamed('/cart');
                      ;
                    },
                    child: Container(
                      width: 50,
                      margin: EdgeInsets.symmetric(horizontal: 12),
                      child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Obx(
                            () => AnimatedContainer(
                              width: controller.animateCart.value ? 35.0 : 45.0,
                              height:
                                  controller.animateCart.value ? 35.0 : 45.0,
                              duration: const Duration(milliseconds: 700),
                              child: Image.asset(
                                'assets/images/icons/Acs/Acs(9).png',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          // cart_bloc.items.length == 0
                          //     ? Container()
                          //     :
                          Positioned(
                            right: 0,
                            top: 10,
                            child: AnimatedContainer(
                              width: controller.animateCart.value ? 20.0 : 22.0,
                              height:
                                  controller.animateCart.value ? 20.0 : 22.0,
                              duration: const Duration(milliseconds: 700),
                              padding: EdgeInsets.all(2.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.00),
                                color: Colors.white,
                                // color: color != null ? color : Colors.white,
                              ),
                              // constraints: BoxConstraints(
                              //   minHeight: 16,
                              //   minWidth: 16,
                              // ),
                              child: Obx(
                                () => Text(
                                  cartController.cartItemsList.length
                                      .toString(),
                                  textAlign: TextAlign.center,
                                  textScaleFactor: 1,
                                  style: TextStyle(
                                      color: AppColors.primaryColor,
                                      fontSize: 9,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Container(
                  //     margin: EdgeInsets.only(left: 10),
                  //     child: Icon(Icons.shopping_cart, color: Colors.white)),
                ]),
            body: Obx(
              () => controller.loading.value == true
                  ? BodyShimmer(
                      controller: controller,
                      height: height,
                      width: width,
                      item: controller.accessoriesDetailsModel,
                    )
                  : Container(
                      constraints: BoxConstraints.expand(),
                      decoration: BoxDecoration(
                        color: AppColors.scaffoldBackgroud,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            AnimationLimiter(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:
                                    AnimationConfiguration.toStaggeredList(
                                  duration: const Duration(milliseconds: 1000),
                                  childAnimationBuilder: (widget) =>
                                      SlideAnimation(
                                    horizontalOffset:
                                        MediaQuery.of(context).size.width / 1,
                                    child: ScaleAnimation(child: widget),
                                  ),
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(top: 10),

                                          width: width * .92,
                                          // margin: EdgeInsets.symmetric(horizontal: 5),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15))),
                                          child: Column(
                                            children: [
                                              Stack(
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    child: Container(
                                                      height: height * .25,
                                                      width: width * .89,
                                                      color:
                                                          AppColors.whiteColor,
                                                      child: Image.network(
                                                        controller.http
                                                                .baseUrlForImages +
                                                            controller
                                                                .accessoriesDetailsModel
                                                                .imageUrl,
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    top: 0,
                                                    left: 0,
                                                    child: Obx(
                                                      () => IconButton(
                                                        onPressed: () {
                                                          homecontroller.token
                                                                          .value
                                                                          .toString() ==
                                                                      'null'
                                                                          .toString() ||
                                                                  homecontroller
                                                                          .token
                                                                          .value
                                                                          .toString() ==
                                                                      ''
                                                              ? Get.toNamed(
                                                                  '/sign-in')
                                                              : controller
                                                                  .addORremoveFav(
                                                                      controller
                                                                          .accessoriesDetailsModel
                                                                          .id);
                                                        },
                                                        icon: Icon(
                                                          controller.isfavorite
                                                                      .value ==
                                                                  false
                                                              ? Icons
                                                                  .favorite_border
                                                              : Icons.favorite,
                                                          color: AppColors
                                                              .primaryColor,
                                                          size: 30,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                height: height * 0.09,
                                                decoration: BoxDecoration(
                                                    color:
                                                        AppColors.primaryColor,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    15),
                                                            topRight: Radius
                                                                .circular(15))),
                                                child: Center(
                                                  child: Text(
                                                    controller
                                                        .accessoriesDetailsModel
                                                        .productName
                                                        .toString(),
                                                    textScaleFactor: 1,
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontFamily: 'Cairo',
                                                        color: AppColors
                                                            .whiteColor),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              ListView.builder(
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                scrollDirection: Axis.vertical,
                                                itemCount: controller
                                                    .accessoriesDetailsModel
                                                    .models
                                                    .length,
                                                shrinkWrap: true,
                                                itemBuilder: (context, index) {
                                                  return Column(
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Container(
                                                            width: width * .15,
                                                            child: Column(
                                                              children: [
                                                                index == 0
                                                                    ? Text(
                                                                        'بلد الصنع',
                                                                        textScaleFactor:
                                                                            1,
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                12,
                                                                            fontWeight: FontWeight
                                                                                .w500,
                                                                            fontFamily:
                                                                                'Cairo',
                                                                            color: Color.fromRGBO(
                                                                                143,
                                                                                146,
                                                                                161,
                                                                                1)),
                                                                      )
                                                                    : Container(),
                                                                Text(
                                                                  controller
                                                                      .accessoriesDetailsModel
                                                                      .models[
                                                                          index]
                                                                      .regionName
                                                                      .toString(),
                                                                  textScaleFactor:
                                                                      1,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          13,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontFamily:
                                                                          'Cairo',
                                                                      color: Colors
                                                                          .black),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          FDottedLine(
                                                            color: Colors.grey,
                                                            height: 45.0,
                                                            strokeWidth: 0.50,
                                                            dottedLength: 3.0,
                                                            space: 2.0,
                                                          ),
                                                          Container(
                                                            width: width * .2,
                                                            child: Column(
                                                              children: [
                                                                index == 0
                                                                    ? Text(
                                                                        'الموديل',
                                                                        textScaleFactor:
                                                                            1,
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                12,
                                                                            fontWeight: FontWeight
                                                                                .w500,
                                                                            fontFamily:
                                                                                'Cairo',
                                                                            color: Color.fromRGBO(
                                                                                143,
                                                                                146,
                                                                                161,
                                                                                1)),
                                                                      )
                                                                    : Container(),
                                                                Container(
                                                                  child: Text(
                                                                    controller
                                                                        .accessoriesDetailsModel
                                                                        .models[
                                                                            index]
                                                                        .modelName,
                                                                    textScaleFactor:
                                                                        1,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        fontFamily:
                                                                            'Cairo',
                                                                        color: Colors
                                                                            .black),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          FDottedLine(
                                                            color: Colors.grey,
                                                            height: 45.0,
                                                            strokeWidth: 0.50,
                                                            dottedLength: 3.0,
                                                            space: 2.0,
                                                          ),
                                                          Container(
                                                            width: width * .15,
                                                            child: Column(
                                                              children: [
                                                                index == 0
                                                                    ? Text(
                                                                        'النوع',
                                                                        textScaleFactor:
                                                                            1,
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                12,
                                                                            fontWeight: FontWeight
                                                                                .w500,
                                                                            fontFamily:
                                                                                'Cairo',
                                                                            color: Color.fromRGBO(
                                                                                143,
                                                                                146,
                                                                                161,
                                                                                1)),
                                                                      )
                                                                    : Container(),
                                                                Text(
                                                                  controller
                                                                      .accessoriesDetailsModel
                                                                      .models[
                                                                          index]
                                                                      .carTypeName,
                                                                  textScaleFactor:
                                                                      1,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          13,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontFamily:
                                                                          'Cairo',
                                                                      color: Colors
                                                                          .black),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          FDottedLine(
                                                            color: Colors.grey,
                                                            height: 45.0,
                                                            strokeWidth: 0.50,
                                                            dottedLength: 3.0,
                                                            space: 2.0,
                                                          ),
                                                          Container(
                                                            width: width * .21,
                                                            child: Column(
                                                              children: [
                                                                index == 0
                                                                    ? Text(
                                                                        'سنة الصنع',
                                                                        textScaleFactor:
                                                                            1,
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                12,
                                                                            fontWeight: FontWeight
                                                                                .w500,
                                                                            fontFamily:
                                                                                'Cairo',
                                                                            color: Color.fromRGBO(
                                                                                143,
                                                                                146,
                                                                                161,
                                                                                1)),
                                                                      )
                                                                    : Container(),
                                                                Text(
                                                                  controller
                                                                          .accessoriesDetailsModel
                                                                          .models[
                                                                              index]
                                                                          .startYear
                                                                          .toString() +
                                                                      '-' +
                                                                      controller
                                                                          .accessoriesDetailsModel
                                                                          .models[
                                                                              index]
                                                                          .finishYear
                                                                          .toString(),
                                                                  textScaleFactor:
                                                                      1,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          13,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontFamily:
                                                                          'Cairo',
                                                                      color: Colors
                                                                          .black),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets
                                                            .symmetric(
                                                                vertical: 1),
                                                        child: FDottedLine(
                                                          color: Colors.grey,
                                                          width: width * 0.8,
                                                          strokeWidth: 0.50,
                                                          dottedLength: 3.0,
                                                          space: 2.0,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                    ],
                                                  );
                                                },
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  bottom: 8.0,
                                                                  right: 5,
                                                                  left: 5),
                                                          child: Text(
                                                            controller
                                                                .accessoriesDetailsModel
                                                                .description,
                                                            textScaleFactor: 1,
                                                            style: TextStyle(
                                                                fontSize: 13,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontFamily:
                                                                    'Cairo',
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 30,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Positioned(
                                            top: 10,
                                            right: 0,
                                            height: 30,
                                            width: 60,
                                            child: controller
                                                        .accessoriesDetailsModel
                                                        .unitPriceDiscount
                                                        .toString() ==
                                                    null.toString()
                                                ? Container()
                                                : Container(
                                                    height: 20,
                                                    width: 40,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topRight:
                                                            Radius.circular(15),
                                                      ),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: AppColors
                                                              .shadowColor,
                                                          blurRadius: 20,
                                                          offset: Offset(0, 3),
                                                        ),
                                                      ],
                                                      color: Colors.red,
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        controller
                                                                .accessoriesDetailsModel
                                                                .unitPriceDiscount
                                                                .toString() +
                                                            '%' ' - ',
                                                        textScaleFactor: 1,
                                                        style: TextStyle(
                                                            fontSize: 9,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontFamily: 'Cairo',
                                                            color: AppColors
                                                                .whiteColor),
                                                      ),
                                                    ))),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
            ),
            bottomNavigationBar: Obx(
              () => controller.loading.value == true
                  ? Container()
                  : Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: [
                          SizedBox(
                            width: width * .02,
                          ),
                          Container(
                            height: 60,
                            width: width * 0.75,
                            decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 20),
                                  child: Row(
                                    children: [
                                      Obx(
                                        () => Text(
                                          '${controller.accessoriesDetailsModel.unitPrice * cartController.itemscount.value}'
                                              .toString(),
                                          textScaleFactor: 1,
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'Cairo',
                                              color: Colors.white),
                                        ),
                                      ),
                                      Text(
                                        'د.ك ',
                                        textScaleFactor: 1,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Cairo',
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 20),
                                  child: Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          cartController.itemscount.value += 1;
                                        },
                                        child: Container(
                                          height: 30,
                                          width: 30,
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                          // margin: EdgeInsets.symmetric(horizontal: 5),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: AppColors.whiteColor,
                                                width: 2),
                                            color: AppColors.primaryColor,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Obx(
                                        () => Text(
                                          cartController.itemscount.value
                                              .toString(),
                                          textScaleFactor: 1,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Cairo',
                                              color: Colors.white),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          cartController.itemscount.value != 0
                                              ? cartController
                                                  .itemscount.value -= 1
                                              : null;
                                        },
                                        child: Container(
                                          height: 30,
                                          width: 30,
                                          child: Icon(
                                            Icons.remove,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                          // margin: EdgeInsets.symmetric(horizontal: 5),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: AppColors.whiteColor,
                                                width: 2),
                                            color: AppColors.primaryColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: width * .02,
                          ),
                          InkWell(
                            onTap: () {
                              if (homecontroller.token.value.toString() ==
                                      'null'.toString() ||
                                  homecontroller.token.value.toString() == '') {
                                Get.toNamed('/sign-in');
                              } else {
                                controller.startAnimate.value =
                                    !controller.startAnimate.value;
                                Future.delayed(Duration(milliseconds: 100), () {
                                  controller.animatePositioned.value = false;
                                });

                                Future.delayed(Duration(milliseconds: 1200),
                                    () {
                                  controller.startAnimate.value =
                                      !controller.startAnimate.value;
                                  controller.animateCart.value =
                                      !controller.animateCart.value;
                                  Future.delayed(Duration(milliseconds: 200),
                                      () {
                                    cartController.addtoCart(
                                        controller.accessoriesDetailsModel);
                                    cartController.calculatetotalAmount();

                                    Future.delayed(Duration(milliseconds: 300),
                                        () {
                                      controller.isbackFavoriteScreen.value ==
                                              true
                                          ? Get.offAndToNamed('/myfavorite')
                                          : controller.is_home_go_To_acc
                                                      .value ==
                                                  true
                                              ? Get.offAndToNamed(
                                                  '/new-accessories')
                                              : Get.back();
                                      Fluttertoast.showToast(
                                          msg: 'addedToCart'.tr,
                                          toastLength: Toast.LENGTH_LONG,
                                          gravity: ToastGravity.TOP,
                                          timeInSecForIosWeb: 0,
                                          backgroundColor: Colors.green,
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                    });
                                  });
                                });
                              }
                            },
                            child: Container(
                              height: 60,
                              width: width * 0.15,
                              child: Container(
                                height: 30,
                                width: 42,
                                child: Container(
                                  margin: EdgeInsets.all(15),
                                  child: Obx(
                                    () => controller.startAnimate.value
                                        ? Image.asset(
                                            'assets/images/icons/Acs/Acs(9).png',
                                            height: 30,
                                            width: 42,
                                          )
                                        : Container(),
                                  ),
                                ),
                              ),
                              decoration: BoxDecoration(
                                  color: AppColors.primaryColor,
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
          ),

          //animatedPositioned
          // controller.startAnimate.value
          //     ? AnimatedPositioned(
          //         width: controller.animatePositioned.value ? 35.0 : 40.0,
          //         height: controller.animatePositioned.value ? 35.0 : 40.0,
          //         bottom:
          //             controller.animatePositioned.value ? 22.0 : height * .85,
          //         left: width * .08,
          //         duration: const Duration(seconds: 2),
          //         curve: Curves.fastOutSlowIn,
          //         child: Image.asset('assets/images/icons/Acs/Acs(9).png',
          //             fit: BoxFit.contain),
          //       )
          //     : Container(),.
          //
          Obx(
            () => controller.startAnimate.value
                ? Container()
                : AnimatedPositioned(
                    width: controller.animatePositioned.value ? 35.0 : 40.0,
                    height: controller.animatePositioned.value ? 35.0 : 40.0,
                    bottom: controller.animatePositioned.value
                        ? 22.0
                        : height * .85,
                    left: width * .08,
                    duration: const Duration(milliseconds: 1500),
                    curve: Curves.fastOutSlowIn,
                    child: Image.asset('assets/images/icons/Acs/Acs(9).png',
                        fit: BoxFit.contain),
                  ),
          )
        ],
      ),
    );
  }
}

class BodyShimmer extends StatelessWidget {
  const BodyShimmer({
    Key key,
    @required this.width,
    @required this.height,
    @required this.controller,
    @required this.item,
  }) : super(key: key);

  final double width;
  final double height;
  final NewAccessoriesDetailsController controller;

  final detailsModel.AccessoriesDetailsModel item;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300],
      highlightColor: Colors.grey[100],
      enabled: true,
      child: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: AppColors.scaffoldBackgroud,
        ),
        child: Column(
          children: [
            SingleChildScrollView(
              child: AnimationLimiter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: AnimationConfiguration.toStaggeredList(
                    duration: const Duration(milliseconds: 0),
                    childAnimationBuilder: (widget) => SlideAnimation(
                      horizontalOffset: MediaQuery.of(context).size.width / 1,
                      child: SlideAnimation(child: widget),
                    ),
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10),

                        width: width * .92,
                        // margin: EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Container(
                                    height: height * .25,
                                    width: width * .89,
                                    color: AppColors.whiteColor,
                                    // child: Image.network(
                                    //   controller.http.baseUrlForImages +
                                    //       controller
                                    //           .accessoriesDetailsModel.imageUrl,
                                    //   fit: BoxFit.contain,
                                    // ),
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  left: 0,
                                  child: Obx(
                                    () => IconButton(
                                      onPressed: () {
                                        controller.addORremoveFav(item.id);
                                      },
                                      icon: Icon(
                                        controller.isfavorite.value == false
                                            ? Icons.favorite_border
                                            : Icons.favorite,
                                        color: AppColors.primaryColor,
                                        size: 30,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: height * 0.09,
                              decoration: BoxDecoration(
                                  color: AppColors.primaryColor,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15))),
                              child: Center(
                                child: Text(
                                  'item.productName.toString()',
                                  textScaleFactor: 1,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Cairo',
                                      color: AppColors.whiteColor),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      'بلد الصنع',
                                      textScaleFactor: 1,
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Cairo',
                                          color:
                                              Color.fromRGBO(143, 146, 161, 1)),
                                    ),
                                    Text(
                                      'null',
                                      textScaleFactor: 1,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Cairo',
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                                FDottedLine(
                                  color: Colors.grey,
                                  height: 45.0,
                                  strokeWidth: 0.50,
                                  dottedLength: 3.0,
                                  space: 2.0,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'نوع السيارة',
                                      textScaleFactor: 1,
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Cairo',
                                          color:
                                              Color.fromRGBO(143, 146, 161, 1)),
                                    ),
                                    Text(
                                      'null',
                                      textScaleFactor: 1,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Cairo',
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                                FDottedLine(
                                  color: Colors.grey,
                                  height: 45.0,
                                  strokeWidth: 0.50,
                                  dottedLength: 3.0,
                                  space: 2.0,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'سنة الصنع',
                                      textScaleFactor: 1,
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Cairo',
                                          color:
                                              Color.fromRGBO(143, 146, 161, 1)),
                                    ),
                                    Text(
                                      'null',
                                      textScaleFactor: 1,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Cairo',
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                                FDottedLine(
                                  color: Colors.grey,
                                  height: 45.0,
                                  strokeWidth: 0.50,
                                  dottedLength: 3.0,
                                  space: 2.0,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'السعر',
                                      textScaleFactor: 1,
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Cairo',
                                          color:
                                              Color.fromRGBO(200, 142, 116, 1)),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'item.unitPrice.toString()',
                                          textScaleFactor: 1,
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'Cairo',
                                              color: Color.fromRGBO(
                                                  200, 142, 116, 1)),
                                        ),
                                        Text(
                                          'د.ك',
                                          textScaleFactor: 1,
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'Cairo',
                                              color: Color.fromRGBO(
                                                  200, 142, 116, 1)),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              child: FDottedLine(
                                color: Colors.grey,
                                width: width * 0.8,
                                strokeWidth: 0.50,
                                dottedLength: 3.0,
                                space: 2.0,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(
                                            bottom: 8.0, right: 5, left: 5),
                                        child: Text(
                                          'item.description',
                                          textScaleFactor: 1,
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'Cairo',
                                              color: Colors.black),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      ),
                    ],
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
