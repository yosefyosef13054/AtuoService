import 'package:autoservice/app/widgets/inputs/AccessoriesAddInput.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:autoservice/app/Colors.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:shimmer/shimmer.dart';
import 'package:autoservice/app/widgets/CarsGridViewItem.dart';

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
                  height: height * .04,
                  margin: EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    boxShadow: [
                      // BoxShadow(
                      //   color: AppColors.shadowColor,
                      //   blurRadius: 20,
                      //   offset: Offset(0, 3),
                      // ),
                    ],
                  ),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return Container(
                          height: 27,
                          width: 120,
                          margin: EdgeInsets.only(right: 5),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'dsadasd',
                                  textScaleFactor: 1,
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Cairo',
                                      color: AppColors.primaryColor),
                                ),
                              ],
                            ),
                          ),
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              border: Border.all(
                                  color: AppColors.primaryColor, width: 1),
                              color: AppColors.whiteColor,
                              // color:
                              //     Color.fromRGBO(239, 244, 255, 1),
                              borderRadius: BorderRadius.circular(10)));
                    },
                  ),
                ),

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
                // ListView.builder(
                //   scrollDirection: Axis.vertical,
                //   itemCount: 10,
                //   padding: const EdgeInsets.all(12),
                //   shrinkWrap: true,
                //   physics: NeverScrollableScrollPhysics(),
                //   itemBuilder: (context, index) {
                //     return InkWell(
                //       onTap: () {
                //         Navigator.pushNamed(
                //             context, CarsDetailsScreen.routeName);
                //       },
                //       child: Container(
                //         margin: EdgeInsets.only(bottom: 5),
                //         child: SellingCarWidget(
                //             height: height, width: width),
                //       ),
                //     );
                //   },
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
