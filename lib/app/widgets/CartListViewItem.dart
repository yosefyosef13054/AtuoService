import 'dart:ui';
import 'package:autoservice/app/Colors.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:autoservice/app/modules/Cart/controllers/cart_controller.dart';

class CardListViewItem extends StatelessWidget {
  CardListViewItem(
      {Key key,
      @required this.height,
      @required this.width,
      this.url,
      this.item})
      : super(key: key);
  OrderItems item;
  final double height;
  final double width;
  String url;
  final CartController cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    OrderItems theitem =
        cartController.cartItemsList.where((element) => element == item).first;

    return Container(
      margin: EdgeInsets.only(bottom: 5),
      child: Container(
        height: 100,
        width: width * .8,
        margin: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: [
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  url + item.itemDate.imageUrl,
                  fit: BoxFit.contain,
                  width: 100,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'فرش مقعد جلد',
                  textScaleFactor: 1,
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Cairo',
                      color: Colors.black),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        theitem.quntity++;
                        print(theitem.quntity);
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 15,
                        ),
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(25)),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Obx(
                      () => Text(
                        theitem.quntity.toString(),
                        textScaleFactor: 1,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Cairo',
                            color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: () {
                        print('removed');
                        item.quntity == 1
                            ? cartController.cartItemsList.remove(item)
                            : item.quntity--;
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        child: Icon(
                          Icons.remove,
                          color: Colors.white,
                          size: 15,
                        ),
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(25)),
                      ),
                    )
                  ],
                )
              ],
            ),
            Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '12KD',
                  textScaleFactor: 1,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Cairo',
                      color: Colors.black),
                ),
                Text(
                  '1 items x 12 KWD',
                  textScaleFactor: 1,
                  style: TextStyle(
                      fontSize: 8,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Cairo',
                      color: Colors.black),
                ),
                SvgPicture.asset('assets/images/delete.svg',
                    color: Colors.red,
                    fit: BoxFit.cover,
                    width: 20,
                    height: 20,
                    semanticsLabel: ''),
              ],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
