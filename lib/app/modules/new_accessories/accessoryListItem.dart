import 'package:autoservice/app/Colors.dart';

import 'package:flutter/material.dart';
import 'package:autoservice/app/modules/accessories/model.dart';

class AccessoryListItem extends StatelessWidget {
  AccessoryListItem({
    Key key,
    @required this.item,
    @required this.height,
    @required this.width,
    this.url,
  }) : super(key: key);
  NewAccessory item;
  final double height;
  final double width;
  String url;
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 5),
      height: height * 0.24,
      width: width * 0.346,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              color: Colors.white,
              height: height * 0.6,
              width: width,
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(bottom: 25),
              child: Image.network(
                url + item.imageUrl,
                fit: BoxFit.contain,
                height: height * 0.2,
              ),
            ),
          ),
          Positioned(
              bottom: 10,
              left: 10,
              height: 20,
              width: 40,
              child: Container(
                  height: 20,
                  width: 40,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.shadowColor,
                          blurRadius: 20,
                          offset: Offset(0, 3),
                        ),
                      ],
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(15)),
                  child: Icon(
                    Icons.shopping_cart,
                    size: 13,
                    color: AppColors.whiteColor,
                  ))),

          ////////////////////////////DISCOUND PERCENTAGE////////////////////
          // Positioned(
          //     top: 0,
          //     right: 0,
          //     height: 20,
          //     width: 40,
          //     child: Container(
          //         height: 20,
          //         width: 40,
          //         decoration: BoxDecoration(
          //           boxShadow: [
          //             BoxShadow(
          //               color: AppColors.shadowColor,
          //               blurRadius: 20,
          //               offset: Offset(0, 3),
          //             ),
          //           ],
          //           color: Colors.red,
          //         ),
          //         child: Center(
          //           child: Text(
          //             '-20%',
          //             textScaleFactor: 1,
          //                          style: TextStyle(
          //                 fontSize: 9,
          //                 fontWeight: FontWeight.w500,
          //                 fontFamily: 'Cairo',
          //                 color: AppColors.whiteColor),
          //           ),
          //         ))),
          //
          ////////////////////////////DISCOUND PERCENTAGE////////////////////
          Positioned(
              bottom: 10,
              right: 10,
              child: Row(
                children: [
                  Text(
                    item.unitPrice.toString(),
                    textScaleFactor: 1,
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Cairo',
                        color: Colors.black),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    item.unitPrice.toString(),
                    textScaleFactor: 1,
                    style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        fontSize: 9,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Cairo',
                        color: Color.fromRGBO(159, 163, 168, 1)),
                  ),
                ],
              )),
          Positioned(
            bottom: 30,
            right: 0,
            width: width * .45,
            child: Row(
              // noMoreCategoryFilters.value
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    item.productName.toString(),
                    textScaleFactor: 1,
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Cairo',
                        color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              top: 0,
              right: 0,
              height: 20,
              width: 40,
              child: item.unitPriceDiscount.toString() == null.toString()
                  ? Container()
                  : Container(
                      height: 20,
                      width: 40,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.shadowColor,
                            blurRadius: 20,
                            offset: Offset(0, 3),
                          ),
                        ],
                        color: Colors.red,
                      ),
                      child: Center(
                        child: Text(
                          item.unitPriceDiscount.toString() + ' - ',
                          textScaleFactor: 1,
                          style: TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Cairo',
                              color: AppColors.whiteColor),
                        ),
                      ))),
        ],
      ),
    );
  }
}
