import 'package:autoservice/app/Colors.dart';
import 'package:autoservice/app/modules/myfavorite/controllers/myfavorite_controller.dart';

import 'package:flutter/material.dart';
import 'package:autoservice/app/modules/accessories/model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AccessoryFavoriteItem extends StatelessWidget {
  AccessoryFavoriteItem({
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

  final MyfavoriteController favController = Get.put(MyfavoriteController());

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
              top: 10,
              right: 0,
              height: 30,
              width: 60,
              child: item.unitPriceDiscount.toString() == null.toString()
                  ? Container()
                  : Container(
                      height: 20,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15),
                        ),
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
                          item.unitPriceDiscount.toString() + '%' ' - ',
                          textScaleFactor: 1,
                          style: TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Cairo',
                              color: AppColors.whiteColor),
                        ),
                      ))),

          ////////////////////////////DISCOUND PERCENTAGE////////////////////
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
            left: 0,
            child: IconButton(
              onPressed: () {
                favController.accessoriesList
                    .removeWhere((element) => element.id == item.id);
                favController.addORremoveFav(item.id);
              },
              icon: SvgPicture.asset('assets/images/delete.svg',
                  color: Colors.red,
                  fit: BoxFit.cover,
                  width: 20,
                  height: 20,
                  semanticsLabel: ''),
            ),
          ),
        ],
      ),
    );
  }
}
