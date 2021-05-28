import 'package:autoservice/app/modules/address_payment/views/address_payment_view.dart';
import 'package:autoservice/app/widgets/CartListViewItem.dart';
import 'package:autoservice/app/widgets/inputs/LoginInput.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import 'package:autoservice/app/modules/Cart/controllers/cart_controller.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:autoservice/app/Colors.dart';
import 'package:fdottedline/fdottedline.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class CartView extends GetView<CartController> {
  TextEditingController codeController = TextEditingController();
  showDialogLogOut(context, index) {
    Alert(
      context: context,
      type: AlertType.warning,
      title: "sure_Logout".tr,
      // desc:
      //     "sure_Logout".tr,
      buttons: [
        DialogButton(
          child: Text(
            'delete'.tr,
            textScaleFactor: 1,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () async {
            controller.cartItemsList.remove(controller.cartItemsList[index]);
            controller.calculatetotalAmount();
            Get.back();
          },
          color: Color.fromRGBO(0, 179, 134, 1.0),
        ),
        DialogButton(
          child: Text(
            'back'.tr,
            textScaleFactor: 1,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Get.back(),
          color: Colors.red,
        ),
      ],
    ).show();
  }

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
        title: Text(
          'سلة المشتريات',
          textScaleFactor: 1,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              fontFamily: 'Cairo',
              color: AppColors.whiteColor),
        ),
        centerTitle: true,
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(color: AppColors.scaffoldBackgroud),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SingleChildScrollView(
                child: AnimationLimiter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: AnimationConfiguration.toStaggeredList(
                      duration: const Duration(milliseconds: 600),
                      childAnimationBuilder: (widget) => SlideAnimation(
                        horizontalOffset: MediaQuery.of(context).size.width / 1,
                        child: SlideAnimation(child: widget),
                      ),
                      children: [
                        Obx(
                          () => controller.cartItemsList.length == 0
                              ? Container(
                                  margin: EdgeInsets.only(top: height * .1),
                                  child: Column(
                                    children: [
                                      Text(
                                        'noCartItems'.tr,
                                        textScaleFactor: 1,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'Cairo',
                                            color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          Get.back();
                                          // Navigator.pushNamed(context, AddsScreen.routeName);
                                        },
                                        child: Container(
                                          child: Center(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text(
                                                  'back'.tr,
                                                  textScaleFactor: 1,
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontFamily: 'Cairo',
                                                      color: AppColors
                                                          .primaryColor),
                                                ),
                                              ],
                                            ),
                                          ),
                                          height: 60,
                                          width: width * 0.54,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color:
                                                      AppColors.primaryColor),
                                              color: AppColors.whiteColor,
                                              borderRadius:
                                                  BorderRadius.circular(25)),
                                        ),
                                      ),
                                      SizedBox(
                                        height: height * .05,
                                      ),
                                      Image.asset(
                                          'assets/images/emptymoshtryat.png'),
                                    ],
                                  ))
                              : ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  itemCount: controller.cartItemsList.length,
                                  padding: const EdgeInsets.all(12),
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    var itemCount = 0.obs;
                                    var totalItemCost = 0.0.obs;

                                    itemCount.value =
                                        controller.cartItemsList[index].quntity;
                                    totalItemCost.value = double.parse(
                                            controller
                                                .cartItemsList[index].quntity
                                                .toString()) *
                                        double.parse(controller
                                            .cartItemsList[index]
                                            .itemDate
                                            .unitPrice
                                            .toString());
                                    return Obx(
                                      () => Container(
                                        height: 100,
                                        width: width * .8,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 5, vertical: 3),
                                        decoration: BoxDecoration(
                                            color: AppColors.whiteColor,
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: Row(
                                          children: [
                                            Container(
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                child: Image.network(
                                                  controller.http
                                                          .baseUrlForImages +
                                                      controller
                                                          .cartItemsList[index]
                                                          .itemDate
                                                          .imageUrl,
                                                  fit: BoxFit.contain,
                                                  width: 100,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text(
                                                  controller
                                                      .cartItemsList[index]
                                                      .itemDate
                                                      .productName,
                                                  textScaleFactor: 1,
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily: 'Cairo',
                                                      color: Colors.black),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        itemCount.value++;
                                                        controller
                                                                .cartItemsList[
                                                                    index]
                                                                .quntity =
                                                            itemCount.value;
                                                        print(controller
                                                            .cartItemsList[
                                                                index]
                                                            .quntity);

                                                        totalItemCost
                                                            .value = double
                                                                .parse(controller
                                                                    .cartItemsList[
                                                                        index]
                                                                    .quntity
                                                                    .toString()) *
                                                            double.parse(controller
                                                                .cartItemsList[
                                                                    index]
                                                                .itemDate
                                                                .unitPrice
                                                                .toString());
                                                        // controller.cartItemsList
                                                        //     .where((element) =>
                                                        //         element ==
                                                        //         controller
                                                        //                 .cartItemsList[
                                                        //             index])
                                                        //     .first
                                                        //     .quntity++;

                                                        // controller
                                                        //     .cartItemsList[index]
                                                        //     .quntity++;
                                                        print(controller
                                                            .cartItemsList[
                                                                index]
                                                            .quntity);
                                                        controller
                                                            .calculatetotalAmount();
                                                      },
                                                      child: Container(
                                                        height: 30,
                                                        width: 30,
                                                        child: Icon(
                                                          Icons.add,
                                                          color: Colors.white,
                                                          size: 15,
                                                        ),
                                                        margin: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 5),
                                                        decoration: BoxDecoration(
                                                            color: AppColors
                                                                .primaryColor,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        25)),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Obx(
                                                      () => Text(
                                                        itemCount.value
                                                            .toString(),
                                                        // controller
                                                        //     .cartItemsList[index]
                                                        //     .quntity
                                                        //     .toString(),
                                                        // controller.cartItemsList
                                                        //     .where((element) =>
                                                        //         element ==
                                                        //         controller
                                                        //                 .cartItemsList[
                                                        //             index])
                                                        //     .obs
                                                        //     .quntity
                                                        //     .toString(),
                                                        textScaleFactor: 1,
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontFamily: 'Cairo',
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        controller
                                                                    .cartItemsList[
                                                                        index]
                                                                    .quntity ==
                                                                1
                                                            ? null

                                                            // controller.cartItemsList
                                                            //     .remove(controller
                                                            //             .cartItemsList[
                                                            //         index])
                                                            : itemCount.value--;
                                                        controller
                                                                .cartItemsList[
                                                                    index]
                                                                .quntity =
                                                            itemCount.value;

                                                        totalItemCost
                                                            .value = double
                                                                .parse(controller
                                                                    .cartItemsList[
                                                                        index]
                                                                    .quntity
                                                                    .toString()) *
                                                            double.parse(controller
                                                                .cartItemsList[
                                                                    index]
                                                                .itemDate
                                                                .unitPrice
                                                                .toString());
                                                        controller
                                                            .calculatetotalAmount();
                                                      },
                                                      child: Container(
                                                        height: 30,
                                                        width: 30,
                                                        child: Icon(
                                                          Icons.remove,
                                                          color: Colors.white,
                                                          size: 15,
                                                        ),
                                                        margin: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 5),
                                                        decoration: BoxDecoration(
                                                            color: AppColors
                                                                .primaryColor,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        25)),
                                                      ),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                            Spacer(),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text(
                                                  totalItemCost.value
                                                          .toString() +
                                                      ' ' +
                                                      'KWD',
                                                  textScaleFactor: 1,
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: 'Cairo',
                                                      color: Colors.black),
                                                ),
                                                Obx(
                                                  () => Row(
                                                    children: [
                                                      Text(
                                                        'KWD',
                                                        textScaleFactor: 1,
                                                        style: TextStyle(
                                                            fontSize: 11,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontFamily: 'Cairo',
                                                            color:
                                                                Colors.black),
                                                      ),
                                                      Text(
                                                        ' ${controller.cartItemsList[index].itemDate.unitPrice.toString()}'
                                                        ' x ',
                                                        textScaleFactor: 1,
                                                        style: TextStyle(
                                                            fontSize: 11,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontFamily: 'Cairo',
                                                            color:
                                                                Colors.black),
                                                      ),
                                                      Text(
                                                        '${itemCount.value.toString()}',
                                                        textScaleFactor: 1,
                                                        style: TextStyle(
                                                            fontSize: 11,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontFamily: 'Cairo',
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                IconButton(
                                                  onPressed: () {
                                                    showDialogLogOut(
                                                        context, index);
                                                  },
                                                  icon: SvgPicture.asset(
                                                      'assets/images/delete.svg',
                                                      color: Colors.red,
                                                      fit: BoxFit.cover,
                                                      width: 20,
                                                      height: 20,
                                                      semanticsLabel: ''),
                                                ),
                                              ],
                                            ),
                                            Spacer(),
                                          ],
                                        ),
                                      ),
                                    );
                                    // InkWell(
                                    //   onTap: () {},
                                    //   child: CardListViewItem(
                                    //       url: controller.http.baseUrlForImages,
                                    //       item: controller.cartItemsList[index],
                                    //       height: height,
                                    //       width: width),
                                    // );
                                  },
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
      ),
      bottomNavigationBar: Obx(
        () => controller.cartItemsList.length == 0
            ? Container(
                height: height * .11,
                width: width,
              )
            : Container(
                height: height * .11,
                width: width,
                color: AppColors.primaryColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Obx(
                          () => controller.cartItemsList.length == 0
                              ? Container()
                              : InkWell(
                                  onTap: () {
                                    controller.totalPrice.value == 0.0
                                        ? null
                                        : Get.toNamed('/address-payment',
                                            arguments: {'isShop': true});
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
                                        border: Border.all(
                                            color: AppColors.whiteColor),
                                        color: AppColors.primaryColor,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    height: 40,
                                    width: width * 0.4,
                                  ),
                                ),
                        ),
                        Obx(
                          () => controller.cartItemsList.length == 0
                              ? Container()
                              : Column(
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
                                        Obx(
                                          () => Text(
                                            controller.totalPrice.value
                                                .toStringAsFixed(3),
                                            textScaleFactor: 1,
                                            style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'Cairo',
                                                color: AppColors.whiteColor),
                                          ),
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
