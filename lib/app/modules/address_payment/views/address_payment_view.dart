import 'package:autoservice/app/modules/add_address/views/add_address_view.dart';
import 'package:autoservice/app/modules/payment_success/views/payment_success_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import 'package:autoservice/app/modules/address_payment/controllers/address_payment_controller.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:autoservice/app/Colors.dart';
import 'package:shimmer/shimmer.dart';
import 'package:autoservice/app/modules/cars_services/controllers/cars_services_controller.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:autoservice/app/widgets/inputs/LoginInput.dart';
import 'package:autoservice/app/modules/Cart/controllers/cart_controller.dart';
import 'package:dotted_border/dotted_border.dart';

class AddressPaymentView extends GetView<AddressPaymentController> {
  CarsServicesController serviceController = Get.put(CarsServicesController());
  final CartController cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    final double itemHeight = MediaQuery.of(context).size.height / 2;
    final double itemWidth = MediaQuery.of(context).size.width / 2;
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
        centerTitle: true,
        title: Text(
          'العنوان و الدفع',
          textScaleFactor: 1,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              fontFamily: 'Cairo',
              color: AppColors.whiteColor),
        ),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(color: AppColors.scaffoldBackgroud),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      'ادخل العنوان',
                      textScaleFactor: 1,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Cairo',
                          color: Colors.black),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Get.offAndToNamed('/add-address', arguments: {
                        'isProfile': false,
                        'isShop': controller.isShop.value
                      });
                      // Navigator.pushNamed(context, AddAddressScreen.routeName);
                    },
                    icon: Image.asset(
                      'assets/images/icons/Acs/Acs(7).png',
                      height: 30,
                      width: 30,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
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
                          () => controller.loading == true
                              ? AddressesShimmer(
                                  height: height,
                                  width: width,
                                )
                              : controller.addresses.length == 0
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Flexible(
                                          child: Text(
                                            'noAddresses'.tr,
                                            textScaleFactor: 1,
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'Cairo',
                                                color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    )
                                  : ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      itemCount: controller.addresses.length,
                                      padding: const EdgeInsets.all(12),
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return Obx(
                                          () => InkWell(
                                            onTap: () {
                                              controller.addressSelected.value =
                                                  true;
                                              controller.selectedAddress.value =
                                                  controller.addresses[index].id
                                                      .toString();
                                            },
                                            child: Container(
                                              margin:
                                                  EdgeInsets.only(bottom: 5),
                                              child: Container(
                                                height: width * .45,
                                                width: width * .8,
                                                padding: EdgeInsets.all(10),
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 5),
                                                decoration: BoxDecoration(
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: AppColors
                                                            .shadowColor,
                                                        blurRadius: 20,
                                                        offset: Offset(0, 3),
                                                      ),
                                                    ],
                                                    color: controller
                                                                .selectedAddress
                                                                .value ==
                                                            controller
                                                                .addresses[
                                                                    index]
                                                                .id
                                                                .toString()
                                                        ? AppColors.primaryColor
                                                        : AppColors.whiteColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Flexible(
                                                          child: Text(
                                                            controller
                                                                .addresses[
                                                                    index]
                                                                .address,
                                                            textScaleFactor: 1,
                                                            style: TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontFamily:
                                                                    'Cairo',
                                                                color: controller
                                                                            .selectedAddress
                                                                            .value ==
                                                                        controller
                                                                            .addresses[
                                                                                index]
                                                                            .id
                                                                            .toString()
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black),
                                                          ),
                                                        ),
                                                        Row(
                                                          children: [
                                                            //
                                                            IconButton(
                                                              onPressed: () {
                                                                controller.showDialogLogOut(
                                                                    context,
                                                                    controller
                                                                        .addresses[
                                                                            index]
                                                                        .id);
                                                              },
                                                              icon: SvgPicture.asset(
                                                                  'assets/images/ic_delete.svg',
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          162,
                                                                          162,
                                                                          162,
                                                                          1),
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  width: 16,
                                                                  height: 16,
                                                                  semanticsLabel:
                                                                      ''),
                                                            ),
                                                            SizedBox(
                                                              width: 13,
                                                            ),
                                                            IconButton(
                                                              onPressed: () {
                                                                Get.offAndToNamed(
                                                                    '/add-address',
                                                                    arguments: {
                                                                      'isProfile':
                                                                          false,
                                                                      'isedit':
                                                                          true,
                                                                      'data': controller
                                                                              .addresses[
                                                                          index]
                                                                    });
                                                                // Get.to(() =>
                                                                //     AddAddressView(
                                                                //       isEdit: true,
                                                                //     ));
                                                              },
                                                              icon: SvgPicture.asset(
                                                                  'assets/images/ic_pencil.svg',
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          162,
                                                                          162,
                                                                          162,
                                                                          1),
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  width: 16,
                                                                  height: 16,
                                                                  semanticsLabel:
                                                                      ''),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    Flexible(
                                                      child: Row(
                                                        children: [
                                                          Flexible(
                                                            child: Text(
                                                              controller
                                                                  .addresses[
                                                                      index]
                                                                  .addressName,
                                                              textScaleFactor:
                                                                  1,
                                                              style: TextStyle(
                                                                  fontSize: 13,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontFamily:
                                                                      'Cairo',
                                                                  color: controller
                                                                              .selectedAddress.value ==
                                                                          controller
                                                                              .addresses[
                                                                                  index]
                                                                              .id
                                                                              .toString()
                                                                      ? Colors
                                                                          .white
                                                                      : Colors
                                                                          .black),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: width * 0.1),
                    child: Text(
                      'وسيلة الدفع',
                      textScaleFactor: 1,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Cairo',
                          color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Obx(
                    () => controller.loading == true
                        ? PaymentMethodShimmer(
                            width: width,
                          )
                        : Container(
                            padding: EdgeInsets.all(5),
                            // margin: EdgeInsets.symmetric(horizontal: width * 0.02),
                            child: GridView.builder(
                              padding: const EdgeInsets.all(5),
                              // itemCount: products.length,
                              shrinkWrap: true,
                              physics: const ClampingScrollPhysics(),
                              itemCount: controller.paymentMethods.length,
                              itemBuilder: (ctx, i) => InkWell(
                                onTap: () {
                                  controller.selectedPayment.value = controller
                                      .paymentMethods[i].id
                                      .toString();
                                  controller.paymentSelect.value = true;
                                },
                                child: Obx(
                                  () => Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(Icons.circle,
                                            color: controller.selectedPayment
                                                        .value ==
                                                    controller
                                                        .paymentMethods[i].id
                                                        .toString()
                                                ? AppColors.primaryColor
                                                : Colors.grey),
                                        Flexible(
                                          child: Text(
                                            controller.paymentMethods[i].title,
                                            textScaleFactor: 1,
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'Cairo',
                                                color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                    // height: height * .07,
                                    width: width * .4,
                                    padding: EdgeInsets.all(15),
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 5),
                                    decoration: BoxDecoration(
                                        color: AppColors.whiteColor,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                  ),
                                ),
                              ),

                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 2.6,
                                      crossAxisSpacing: 5,
                                      mainAxisSpacing: 5),
                            ),
                          ),
                  ),
                  Obx(
                    () => controller.discountPercent.value != '0'
                        ? Container()
                        : Container(
                            margin:
                                EdgeInsets.symmetric(horizontal: width * 0.1),
                            child: Text(
                              'addCoupon'.tr,
                              textScaleFactor: 1,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Cairo',
                                  color: Colors.black),
                            ),
                          ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Obx(
                    () => Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          controller.discountPercent.value == '0'
                              ? Container()
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        controller.discountPercent.value = '0';
                                        controller.couponId.value = '0';
                                        controller.totalDiscound.value = '0';
                                      },
                                      child: controller.discountPercent.value ==
                                              '0'
                                          ? Container()
                                          : Container(
                                              width: 75,
                                              child: Center(
                                                child: Icon(
                                                  Icons.highlight_remove,
                                                  color: Colors.red,
                                                  size: 33,
                                                ),
                                              ),
                                            ),
                                    ),
                                    Text(
                                      'Discount Activated:  ' +
                                          controller.discountPercent.value +
                                          '%',
                                      textScaleFactor: 1,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Cairo',
                                          color: Colors.green),
                                    ),
                                  ],
                                ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              // Container(
                              //   width: width * 0.5,
                              //   child: ProfileInput(
                              //     lines: 1,
                              //     controller: controller.codeController,
                              //     label: 'كود الخصم',
                              //     type: TextInputType.text,
                              //     secure: false,
                              //     //   icon: Icons.access_alarm,
                              //     //    image: 'assets/images/noun_Lock_821908.png',
                              //     // validator: (value) {
                              //     //   if (value.isEmpty) {
                              //     //     return 'Please enter  ';
                              //     //   }
                              //     // }
                              //   ),
                              // ),
                              controller.discountPercent.value != '0'
                                  ? Container()
                                  : Container(
                                      width: width * .5,
                                      child: Center(
                                        child: DottedBorder(
                                          borderType: BorderType.RRect,
                                          color: Colors.green,
                                          strokeWidth: 1,
                                          radius: Radius.circular(15),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: AppColors.whiteColor,
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            height: 45,
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  width: 15,
                                                ),
                                                Container(
                                                  width: width * 0.3,
                                                  child: ProfileInput(
                                                    lines: 1,
                                                    controller: controller
                                                        .codeController,
                                                    label: 'addCoupon'.tr,
                                                    type: TextInputType.text,
                                                    secure: false,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 15,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                              controller.discountPercent.value == '0'
                                  ? InkWell(
                                      onTap: () {
                                        controller.addPromoCode(context,
                                            controller.codeController.text);
                                      },
                                      child: Container(
                                        width: 75,
                                        child: Center(
                                          child: SvgPicture.asset(
                                              'assets/images/check_crircle.svg',
                                              color: Colors.green,
                                              fit: BoxFit.cover,
                                              width: 35,
                                              height: 35,
                                              semanticsLabel: ''),
                                        ),
                                      ),
                                    )
                                  : InkWell(
                                      onTap: () {
                                        controller.discountPercent.value = '0';
                                        controller.couponId.value = '0';
                                        controller.totalDiscound.value = '0';
                                      },
                                      child: controller.discountPercent.value !=
                                              '0'
                                          ? Container()
                                          : Container(
                                              width: 75,
                                              child: Center(
                                                child: Icon(
                                                  Icons.highlight_remove,
                                                  color: Colors.red,
                                                  size: 33,
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
                ],
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: height * .11,
        width: width,
        color: AppColors.primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 150,
                  child: RoundedLoadingButton(
                    controller: controller.btnController,
                    borderRadius: 15,
                    color: AppColors.primaryColor,
                    onPressed: () {
                      if (controller.addressSelected.value == false) {
                        Fluttertoast.showToast(
                            msg: 'selectAddress'.tr,
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.TOP,
                            timeInSecForIosWeb: 0,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                        controller.btnController.error();
                        Future.delayed(Duration(milliseconds: 1200),
                            () => controller.btnController.reset());
                      } else if (controller.paymentSelect.value == false) {
                        Fluttertoast.showToast(
                            msg: 'selectPayment'.tr,
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.TOP,
                            timeInSecForIosWeb: 0,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                        controller.btnController.error();
                        Future.delayed(Duration(milliseconds: 1200),
                            () => controller.btnController.reset());
                      } else {
                        controller.submit(context);
                      }
                      // Get.to(PaymentSuccessView());
                    },
                    child: Center(
                      child: Text(
                        'ادفع',
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
                Obx(
                  () => Column(
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
                            controller.isShop.value == true
                                ? double.parse(
                                        ' ${cartController.totalPrice.value - double.parse(controller.totalDiscound.value)}')
                                    .toStringAsFixed(3)
                                :

                                //for Cars
                                //
                                serviceController.tootal.value == 0
                                    ? double.parse(
                                            ' ${serviceController.choosenService.value.unitPrice - double.parse(controller.totalDiscound.value)}')
                                        .toStringAsFixed(3)
                                    : double.parse(
                                            ' ${double.parse(serviceController.tootal.value.toString()) + double.parse(serviceController.choosenService.value.unitPrice.toString()) - double.parse(controller.totalDiscound.value)}')
                                        .toStringAsFixed(3),
                            textScaleFactor: 1,
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Cairo',
                                color: AppColors.whiteColor),
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
    );
  }
}

class PaymentMethodShimmer extends StatelessWidget {
  const PaymentMethodShimmer({
    Key key,
    @required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300],
      highlightColor: Colors.grey[100],
      enabled: true,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.circle, color: Colors.grey),
                Text(
                  'كي نت',
                  textScaleFactor: 1,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Cairo',
                      color: Colors.black),
                ),
              ],
            ),
            // height: height * .07,
            width: width * .4,
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(15)),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.circle, color: AppColors.primaryColor),
                Text(
                  'كاش',
                  textScaleFactor: 1,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Cairo',
                      color: Colors.black),
                ),
              ],
            ),
            // height: height * .07,
            width: width * .4,
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(15)),
          ),
        ],
      ),
    );
  }
}

class AddressesShimmer extends StatelessWidget {
  const AddressesShimmer({
    Key key,
    @required this.height,
    @required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300],
      highlightColor: Colors.grey[100],
      enabled: true,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 2,
        padding: const EdgeInsets.all(12),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(bottom: 5),
              child: Container(
                height: height * .139,
                width: width * .8,
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.shadowColor,
                        blurRadius: 20,
                        offset: Offset(0, 3),
                      ),
                    ],
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'المنزل',
                          textScaleFactor: 1,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Cairo',
                              color: Colors.black),
                        ),
                        Row(
                          children: [
                            SvgPicture.asset('assets/images/ic_delete.svg',
                                color: Color.fromRGBO(162, 162, 162, 1),
                                fit: BoxFit.cover,
                                width: 16,
                                height: 16,
                                semanticsLabel: ''),
                            SizedBox(
                              width: 13,
                            ),
                            SvgPicture.asset('assets/images/ic_pencil.svg',
                                color: Color.fromRGBO(162, 162, 162, 1),
                                fit: BoxFit.cover,
                                width: 16,
                                height: 16,
                                semanticsLabel: ''),
                          ],
                        ),
                      ],
                    ),
                    Text(
                      'قطعة 2 - جادة 3 - شارع 121 - منزل 15',
                      textScaleFactor: 1,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Cairo',
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
