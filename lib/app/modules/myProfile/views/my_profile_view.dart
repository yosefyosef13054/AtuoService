import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/my_profile_controller.dart';

import 'package:intl/intl.dart';

import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:autoservice/app/Colors.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:autoservice/app/modules/address_payment/controllers/address_payment_controller.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:autoservice/app/widgets/inputs/LoginInput.dart';

class MyProfileView extends GetView<MyProfileController> {
  AddressPaymentController addressController =
      Get.put(AddressPaymentController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var format = DateFormat('yMd');
    return Scaffold(
      backgroundColor: Color.fromRGBO(239, 244, 255, 1),
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'myscreen'.tr,
          textScaleFactor: 1,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              fontFamily: 'Cairo',
              color: AppColors.whiteColor),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              SingleChildScrollView(
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
                          Obx(
                            () => controller.loading.value == true
                                ? InputsShimmer()
                                : Center(
                                    child: Container(
                                      width: width * .9,
                                      padding: EdgeInsets.all(15),
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 5, vertical: 10),
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: AppColors.shadowColor,
                                              blurRadius: 20,
                                              offset: Offset(0, 3),
                                            ),
                                          ],
                                          color: AppColors.whiteColor,
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Column(
                                        children: [
                                          ProfileInput(
                                              lines: 1,
                                              controller:
                                                  controller.nameController1,
                                              label: 'enter_name'.tr,
                                              type: TextInputType.name,
                                              secure: false,
                                              icon: Icons.access_alarm,
                                              image:
                                                  'assets/images/noun_Lock_821908.png',
                                              validator: (value) {
                                                if (value.isEmpty) {
                                                  return 'enter_name'.tr;
                                                }
                                              }),
                                          ProfileInput(
                                            enabled: false,
                                            lines: 1,
                                            controller:
                                                controller.numberController1,
                                            label: 'enter_mobile_number'.tr,
                                            type: TextInputType.number,
                                            secure: false,
                                            icon: Icons.access_alarm,
                                            image:
                                                'assets/images/noun_Lock_821908.png',
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return 'enter_mobile_validate'
                                                    .tr;
                                              }
                                              if (value.length < 9 ||
                                                  value.length > 12) {
                                                return 'invalid_phone_range'.tr;
                                              }
                                            },
                                          ),
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: 10),
                                            child: RoundedLoadingButton(
                                              width: width * .35,
                                              color: AppColors.primaryColor,
                                              child: Text(
                                                'update'.tr,
                                                textScaleFactor: 1,
                                                style: TextStyle(
                                                    fontSize: 22,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: 'Cairo',
                                                    color:
                                                        AppColors.whiteColor),
                                              ),
                                              controller:
                                                  controller.btnController,
                                              onPressed: () {
                                                final FormState form =
                                                    _formKey.currentState;

                                                if (form.validate()) {
                                                  controller.submit(context);
                                                } else {
                                                  controller.btnController
                                                      .error();
                                                  Future.delayed(
                                                      Duration(
                                                          milliseconds: 1200),
                                                      () {
                                                    controller.btnController
                                                        .reset();
                                                  });
                                                }
                                                // Get.to(HomeScreenView());
                                                // Navigator.of(context)
                                                //     .pushNamed(HomeScreen.routeName); // Submit
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                          ),
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
                                    'isProfile': true,
                                    'isShop': false
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
                          Obx(
                            () => addressController.loading.value == true
                                ? AddressesShimmer(
                                    height: height,
                                    width: width,
                                  )
                                : addressController.addresses.length == 0
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
                                        itemCount:
                                            addressController.addresses.length,
                                        padding: const EdgeInsets.all(12),
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          return Obx(
                                            () => InkWell(
                                              onTap: () {
                                                // addressController
                                                //     .addressSelected.value = true;
                                                // addressController
                                                //         .selectedAddress.value =
                                                //     addressController
                                                //         .addresses[index].id
                                                //         .toString();
                                              },
                                              child: Container(
                                                margin:
                                                    EdgeInsets.only(bottom: 5),
                                                child: Container(
                                                  height: width * .45,
                                                  width: width * .8,
                                                  padding: EdgeInsets.all(15),
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
                                                      color: addressController
                                                                  .selectedAddress
                                                                  .value ==
                                                              addressController
                                                                  .addresses[
                                                                      index]
                                                                  .id
                                                                  .toString()
                                                          ? AppColors
                                                              .primaryColor
                                                          : AppColors
                                                              .whiteColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8)),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Flexible(
                                                            child: Text(
                                                              addressController
                                                                  .addresses[
                                                                      index]
                                                                  .address,
                                                              textScaleFactor:
                                                                  1,
                                                              style: TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontFamily:
                                                                      'Cairo',
                                                                  color: addressController
                                                                              .selectedAddress.value ==
                                                                          addressController
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
                                                              IconButton(
                                                                onPressed: () {
                                                                  addressController.showDialogLogOut(
                                                                      context,
                                                                      addressController
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
                                                                        'isedit':
                                                                            true,
                                                                        'isProfile':
                                                                            true,
                                                                        'data':
                                                                            addressController.addresses[index]
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
                                                                addressController
                                                                    .addresses[
                                                                        index]
                                                                    .addressName,
                                                                textScaleFactor:
                                                                    1,
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        13,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontFamily:
                                                                        'Cairo',
                                                                    color: addressController.selectedAddress.value ==
                                                                            addressController.addresses[index].id
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
              ),
            ],
          ),
        ),
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

class InputsShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    TextEditingController nameController1 = TextEditingController();
    final RoundedLoadingButtonController btnController =
        new RoundedLoadingButtonController();
    return Shimmer.fromColors(
      baseColor: Colors.grey[300],
      highlightColor: Colors.grey[100],
      enabled: true,
      child: Center(
        child: Container(
          width: width * .9,
          padding: EdgeInsets.all(15),
          margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
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
            children: [
              ProfileInput(
                  lines: 1,
                  controller: nameController1,
                  label: 'enter_name'.tr,
                  type: TextInputType.name,
                  secure: false,
                  icon: Icons.access_alarm,
                  image: 'assets/images/noun_Lock_821908.png',
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'enter_name'.tr;
                    }
                  }),
              ProfileInput(
                lines: 1,
                controller: nameController1,
                label: 'enter_mobile_number'.tr,
                type: TextInputType.number,
                secure: false,
                icon: Icons.access_alarm,
                image: 'assets/images/noun_Lock_821908.png',
                validator: (value) {
                  if (value.isEmpty) {
                    return 'enter_mobile_validate'.tr;
                  }
                  if (value.length < 9 || value.length > 12) {
                    return 'invalid_phone_range'.tr;
                  }
                },
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: RoundedLoadingButton(
                  width: width * .35,
                  color: AppColors.primaryColor,
                  child: Text(
                    'submit'.tr,
                    textScaleFactor: 1,
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w200,
                        fontFamily: 'Cairo',
                        color: AppColors.whiteColor),
                  ),
                  controller: btnController,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
