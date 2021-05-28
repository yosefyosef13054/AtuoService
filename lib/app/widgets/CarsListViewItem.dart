import 'package:autoservice/app/Colors.dart';
import 'package:flutter/material.dart';
import 'package:autoservice/app/modules/accessories/model.dart' as model;

class CarsListViewItem extends StatelessWidget {
  CarsListViewItem(
      {Key key,
      @required this.height,
      @required this.width,
      this.url,
      this.item})
      : super(key: key);

  model.NewAccessory item;
  final double height;
  final double width;
  String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.5),
      height: height * 0.24,
      width: width * 0.346,
      child: Stack(
        children: [
          Container(
            color: Colors.white,
            height: height * 0.4,
            width: width * 0.346,
          ),
          Image.network(
            // index == 1
            //     ? 'assets/images/Image6.png'
            //  :
            url.toString() + item.imageUrl.toString(),
            fit: BoxFit.contain,
            height: height * 0.25,
            width: width * 0.346,
          ),
          Positioned(
              bottom: 5,
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
          Positioned(
              bottom: 5,
              right: 10,
              child: Row(
                children: [
                  Text(
                    'KD' + '${item.unitPrice} ',
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
                ],
              )),
          Positioned(
            bottom: 30,
            width: width * 0.346,
            left: 0,
            child: Container(
              width: width * 0.346,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      item.productName,
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
          ),
        ],
      ),
    );
  }
}
