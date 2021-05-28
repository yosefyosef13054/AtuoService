import 'package:autoservice/app/modules/my_orders/model.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/my_orders_controller.dart';
import 'package:autoservice/app/modules/scrap_garages/views/scrap_garages_view.dart';
import 'package:autoservice/app/widgets/ScrapOrderItem.dart';

import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:autoservice/app/Colors.dart';
import 'package:shimmer/shimmer.dart';

class MyOrdersView extends GetView<MyOrdersController> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var format = DateFormat('yMd');
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Color.fromRGBO(239, 244, 255, 1),
        extendBodyBehindAppBar: true,
        // appBar: AppBar(
        //   backgroundColor: AppColors.primaryColor,
        //   elevation: 0.0,
        //   centerTitle: true,
        //   title: Text(
        //     'moshtryaty'.tr,
        //     textScaleFactor: 1,
        //                             style: TextStyle(
        //         fontSize: 20,
        //         fontWeight: FontWeight.w500,
        //         fontFamily: 'Cairo',
        //         color: AppColors.whiteColor),
        //   ),
        // ),
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          bottom: TabBar(
            tabs: [
              Text(
                'myServices'.tr,
                textScaleFactor: 1,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Cairo',
                    color: AppColors.whiteColor),
              ),
              Text(
                'moshtryaty'.tr,
                textScaleFactor: 1,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Cairo',
                    color: AppColors.whiteColor),
              ),
            ],
          ),
          // title: Text(
          //   ''.tr,
          //   textScaleFactor: 1,
          //             style: TextStyle(
          //       fontSize: 20,
          //       fontWeight: FontWeight.w500,
          //       fontFamily: 'Cairo',
          //       color: AppColors.whiteColor),
          // ),
        ),
        body: TabBarView(
          children: [
            ServicesView(
              height: height,
              listitems: controller.myoredersList,
              width: width,
              format: format,
            ),
            CartOrdersViews(
              height: height,
              cartlistitems: controller.myCartoredersList,
              width: width,
              format: format,
            ),
          ],
        ),
      ),
    );
  }
}

//ServiceView
class ServicesView extends StatefulWidget {
  ServicesView(
      {Key key,
      @required this.height,
      @required this.width,
      @required this.format,
      this.listitems,
      this.cartlistitems})
      : super(key: key);
  List<MyOrders> listitems;
  List<CartOrder> cartlistitems;
  final double height;

  final double width;

  final DateFormat format;

  @override
  _ServicesViewState createState() => _ServicesViewState();
}

class _ServicesViewState extends State<ServicesView> {
  final MyOrdersController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.loading.value == true
          ? ShimmerOrders(
              height: widget.height,
            )
          : controller.myoredersList.length == 0
              ? Center(
                  child: Container(
                      margin: EdgeInsets.only(top: widget.height * .28),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () async {
                              String token = "";
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              token = prefs.getString("token");
                              token == null
                                  ? Get.offNamed('/sign-in')
                                  : Get.offNamed('/cars-services');
                              // Navigator.pushNamed(context, AddsScreen.routeName);
                            },
                            child: Container(
                              child: Center(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'buy'.tr,
                                      textScaleFactor: 1,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Cairo',
                                          color: AppColors.primaryColor),
                                    ),
                                  ],
                                ),
                              ),
                              height: 60,
                              width: widget.width * 0.54,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: AppColors.primaryColor),
                                  color: AppColors.whiteColor,
                                  borderRadius: BorderRadius.circular(25)),
                            ),
                          ),
                          SizedBox(
                            height: widget.height * .05,
                          ),
                          Image.asset('assets/images/emptymoshtryat.png'),
                        ],
                      )),
                )
              : Container(
                  constraints: BoxConstraints.expand(),
                  decoration: BoxDecoration(),
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
                            Container(
                              height: widget.height,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: widget.listitems.length,
                                itemBuilder: (context, index) {
                                  var item = widget.listitems[index];
                                  return Column(
                                    children: [
                                      InkWell(
                                          // onTap: (){
                                          //   Navigator.pushNamed(context, ScrapOrdersScreen)
                                          // },
                                          child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(7),
                                        ),
                                        child: Container(
                                          // margin: EdgeInsets.all(10),
                                          child: Column(
                                            children: [
                                              Container(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    SizedBox(
                                                      height: 8,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Center(
                                                          child: Container(
                                                            margin: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        15,
                                                                    vertical:
                                                                        4),
                                                            child: Text(
                                                              'رقم الطلب:' +
                                                                  item
                                                                      .orderDetails[
                                                                          0]
                                                                      .orderId
                                                                      .toString(),
                                                              // controller
                                                              //       .myoredersList[
                                                              //           index].
                                                              //       .
                                                              //      +
                                                              // 'تاريخ الطلب:',
                                                              textScaleFactor:
                                                                  1,
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
                                                        ),
                                                        Container(
                                                          margin: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      15),
                                                          child: Text(
                                                            'تاريخ الطلب: ' +
                                                                widget.format.format(
                                                                    DateTime.parse(item
                                                                        .orderDate
                                                                        .toString())),
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
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 10),
                                                      decoration: BoxDecoration(
                                                          color: Color.fromRGBO(
                                                              214, 223, 242, 1),
                                                          borderRadius:
                                                              BorderRadius.only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          7),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          7))
                                                          // BorderRadius
                                                          //     .circular(
                                                          //         7),
                                                          ),
                                                      child: Container(
                                                        margin:
                                                            EdgeInsets.all(5),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              'نوع  الطلب: ' +
                                                                  item
                                                                      .orderDetails[
                                                                          0]
                                                                      .serviceName,
                                                              textScaleFactor:
                                                                  1,
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontFamily:
                                                                      'Cairo',
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                            Text(
                                                              'طريقة الدفع: ' +
                                                                  item.paymentTypeName,
                                                              textScaleFactor:
                                                                  1,
                                                              style: TextStyle(
                                                                  fontSize: 12,
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
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )),
                                      SizedBox(
                                        height: 10,
                                      ),
                                    ],
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
    );
  }
}

//CartOrdersViews

class CartOrdersViews extends StatefulWidget {
  CartOrdersViews(
      {Key key,
      @required this.height,
      @required this.width,
      @required this.format,
      this.cartlistitems})
      : super(key: key);
  List<CartOrder> cartlistitems;
  final double height;

  final double width;

  final DateFormat format;

  @override
  _CartOrdersViewsState createState() => _CartOrdersViewsState();
}

class _CartOrdersViewsState extends State<CartOrdersViews> {
  final MyOrdersController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.loading.value == true
          ? ShimmerOrders(
              height: widget.height,
            )
          : controller.myoredersList.length == 0
              ? Center(
                  child: Container(
                      margin: EdgeInsets.only(top: widget.height * .28),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () async {
                              String token = "";
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              token = prefs.getString("token");
                              token == null
                                  ? Get.offNamed('/sign-in')
                                  : Get.offNamed('/cars-services');
                              // Navigator.pushNamed(context, AddsScreen.routeName);
                            },
                            child: Container(
                              child: Center(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'buy'.tr,
                                      textScaleFactor: 1,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Cairo',
                                          color: AppColors.primaryColor),
                                    ),
                                  ],
                                ),
                              ),
                              height: 60,
                              width: widget.width * 0.54,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: AppColors.primaryColor),
                                  color: AppColors.whiteColor,
                                  borderRadius: BorderRadius.circular(25)),
                            ),
                          ),
                          SizedBox(
                            height: widget.height * .05,
                          ),
                          Image.asset('assets/images/emptymoshtryat.png'),
                        ],
                      )),
                )
              : Container(
                  constraints: BoxConstraints.expand(),
                  decoration: BoxDecoration(),
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
                            Container(
                              height: widget.height,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              child: Obx(
                                () => SingleChildScrollView(
                                  controller: controller.scrollController,
                                  child: Column(
                                    children: [
                                      ListView.builder(
                                        scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: widget.cartlistitems.length,
                                        itemBuilder: (context, index) {
                                          var item =
                                              widget.cartlistitems[index];
                                          return Column(
                                            children: [
                                              InkWell(
                                                  // onTap: (){
                                                  //   Navigator.pushNamed(context, ScrapOrdersScreen)
                                                  // },
                                                  child: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(7),
                                                ),
                                                child: Container(
                                                  // margin: EdgeInsets.all(10),
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            SizedBox(
                                                              height: 8,
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Center(
                                                                  child:
                                                                      Container(
                                                                    margin: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            15,
                                                                        vertical:
                                                                            4),
                                                                    child: Text(
                                                                      'رقم الطلب:' +
                                                                          item.orderDetails[0]
                                                                              .orderId
                                                                              .toString(),
                                                                      // controller
                                                                      //       .myoredersList[
                                                                      //           index].
                                                                      //       .
                                                                      //      +
                                                                      // 'تاريخ الطلب:',
                                                                      textScaleFactor:
                                                                          1,
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              13,
                                                                          fontWeight: FontWeight
                                                                              .w500,
                                                                          fontFamily:
                                                                              'Cairo',
                                                                          color:
                                                                              Colors.black),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  margin: EdgeInsets
                                                                      .symmetric(
                                                                          horizontal:
                                                                              15),
                                                                  child: Text(
                                                                    'تاريخ الطلب: ' +
                                                                        widget.format.format(DateTime.parse(item
                                                                            .orderDate
                                                                            .toString())),
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
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            Container(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          10),
                                                              decoration: BoxDecoration(
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          214,
                                                                          223,
                                                                          242,
                                                                          1),
                                                                  borderRadius: BorderRadius.only(
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              7),
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              7))
                                                                  // BorderRadius
                                                                  //     .circular(
                                                                  //         7),
                                                                  ),
                                                              child: Container(
                                                                margin:
                                                                    EdgeInsets
                                                                        .all(5),
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      'السعر الكلي: ' +
                                                                          item.balance

                                                                              // double.parse(' ${item.discount != null ? item.totalCost - item.discount : item.totalCost}')
                                                                              .toStringAsFixed(3),
                                                                      textScaleFactor:
                                                                          1,
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              12,
                                                                          fontWeight: FontWeight
                                                                              .w500,
                                                                          fontFamily:
                                                                              'Cairo',
                                                                          color:
                                                                              Colors.black),
                                                                    ),
                                                                    Text(
                                                                      'طريقة الدفع: ' +
                                                                          item.paymentTypeName,
                                                                      textScaleFactor:
                                                                          1,
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              12,
                                                                          fontWeight: FontWeight
                                                                              .w500,
                                                                          fontFamily:
                                                                              'Cairo',
                                                                          color:
                                                                              Colors.black),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )),
                                              SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                      Obx(() => controller.paginate.value ==
                                              true
                                          ? Center(
                                              child:
                                                  CircularProgressIndicator())
                                          : Container()),
                                    ],
                                  ),
                                ),
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

class ShimmerOrders extends StatelessWidget {
  ShimmerOrders({
    Key key,
    @required this.height,
  }) : super(key: key);

  final double height;
  bool enabled = true;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300],
      highlightColor: Colors.grey[100],
      enabled: enabled,
      child: Container(
        height: height,
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Column(
              children: [
                InkWell(
                    // onTap: (){
                    //   Navigator.pushNamed(context, ScrapOrdersScreen)
                    // },
                    child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Container(
                    // margin: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Center(
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 4),
                                      child: Text(
                                        'تاريخ الطلب: 22-10-2020',
                                        textScaleFactor: 1,
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Cairo',
                                            color: Colors.black),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 15),
                                    child: Text(
                                      'تاريخ الطلب: 22-10-2020',
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
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(214, 223, 242, 1),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(7),
                                        bottomRight: Radius.circular(7))
                                    // BorderRadius
                                    //     .circular(
                                    //         7),
                                    ),
                                child: Container(
                                  margin: EdgeInsets.all(5),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Text(
                                        'طريقة الدفع: معلق',
                                        textScaleFactor: 1,
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Cairo',
                                            color: Colors.black),
                                      ),
                                      Spacer(),
                                      SizedBox(
                                        width: 10,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
                SizedBox(
                  height: 10,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
