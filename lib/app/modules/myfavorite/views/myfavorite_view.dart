import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/myfavorite_controller.dart';

import 'package:autoservice/app/modules/used_accessories_details/views/used_accessories_details_view.dart';

import 'package:autoservice/app/modules/new_accessories/new_accessories_favItem.dart';

import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:autoservice/app/Colors.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shimmer/shimmer.dart';
import 'package:autoservice/app/widgets/CarsGridViewItem.dart';
import 'package:autoservice/app/modules/new_accessories_details/views/new_accessories_details_view.dart';
import 'package:autoservice/app/modules/Cart/controllers/cart_controller.dart';

class MyfavoriteView extends GetView<MyfavoriteController> {
  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final double itemHeight = MediaQuery.of(context).size.height / 2;
    final double itemWidth = MediaQuery.of(context).size.width / 2;

    return Scaffold(
      backgroundColor:
          // Color.fromRGBO(255, 255, 255, 1),
          AppColors.scaffoldBackgroud,
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () {
              Get.toNamed('/cart');
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/images/icons/Acs/Acs(9).png',
                    height: 30,
                    width: 42,
                  ),
                  // cart_bloc.items.length == 0
                  //     ? Container()
                  //     :
                  Positioned(
                    right: 0,
                    top: 15,
                    child: Container(
                      height: 20,
                      width: 20,
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
                          cartController.cartItemsList.length.toString(),
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
        ],
        backgroundColor: AppColors.primaryColor,
        elevation: 0.0,
        centerTitle: true,
        toolbarHeight: height * .1,
        title: Text(
          'my_favorite'.tr,
          textScaleFactor: 1,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              fontFamily: 'Cairo',
              color: AppColors.whiteColor),
        ),
      ),
      body: Obx(
        () => controller.loading.value == true
            ? ProductsListShimmer()
            : Container(
                constraints: BoxConstraints.expand(),
                decoration: BoxDecoration(
                  color: AppColors.scaffoldBackgroud,
                ),
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
                                horizontalOffset:
                                    MediaQuery.of(context).size.width / 1,
                                child: SlideAnimation(child: widget),
                              ),
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                controller.accessoriesList.length == 0
                                    ? Column(
                                        children: [
                                          SizedBox(
                                            height: 100,
                                          ),
                                          Text(
                                            'nofav'.tr,
                                            textScaleFactor: 1,
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
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
                                                      MainAxisAlignment
                                                          .spaceEvenly,
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
                                                      color: AppColors
                                                          .primaryColor),
                                                  color: AppColors.whiteColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25)),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Center(
                                            child: Image.asset(
                                              'assets/images/emptyFavorit.png',
                                            ),
                                          ),
                                        ],
                                      )
                                    : Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: GridView.builder(
                                            controller:
                                                controller.scrollController,
                                            shrinkWrap: true,
                                            itemCount: controller
                                                .accessoriesList.length,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            // gridDelegate:
                                            //     SliverGridDelegateWithFixedCrossAxisCount(
                                            //         crossAxisCount: 2),
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 2,
                                                    childAspectRatio:
                                                        (itemWidth /
                                                                itemHeight) *
                                                            1.4,
                                                    crossAxisSpacing: 5,
                                                    mainAxisSpacing: 0),
                                            itemBuilder: (_, index) => InkWell(
                                                  onTap: () {
                                                    Get.offAndToNamed(
                                                        '/new-accessories-details',
                                                        arguments: {
                                                          'id': controller
                                                              .accessoriesList[
                                                                  index]
                                                              .id,
                                                          'back_to_favoriteScreen':
                                                              true,
                                                          'is_home_go_To_acc':
                                                              false
                                                        });
                                                  },
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                        bottom: 5),
                                                    child:
                                                        AccessoryFavoriteItem(
                                                      url: controller.http
                                                          .baseUrlForImages,
                                                      item: controller
                                                              .accessoriesList[
                                                          index],
                                                      height: height,
                                                      width: width,
                                                    ),
                                                  ),
                                                )),
                                      ),
                                Obx(() => controller.paginate.value == true
                                    ? Center(child: CircularProgressIndicator())
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
    );
  }
}

class ProductsListShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final double itemHeight = MediaQuery.of(context).size.height / 2;
    final double itemWidth = MediaQuery.of(context).size.width / 2;
    bool _enabled = true;
    return SingleChildScrollView(
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300],
        highlightColor: Colors.grey[100],
        enabled: _enabled,
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  height: height,
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    // gridDelegate:
                    //     SliverGridDelegateWithFixedCrossAxisCount(
                    //         crossAxisCount: 2),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: (itemWidth / itemHeight) * 1.4,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 0),
                    itemBuilder: (_, index) => InkWell(
                      onTap: () {
                        // Navigator.pushNamed(context,
                        //     UsedAccessoryDetailsScreen.routeName);
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 5),
                        child: CarsGridViewItem(
                          height: height,
                          width: width,
                        ),
                      ),
                    ),
                    itemCount: 10,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
