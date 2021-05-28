import 'dart:ui';
import 'package:autoservice/app/Colors.dart';

import 'package:flutter/material.dart';
import 'package:autoservice/app/modules/scrap_orders/model.dart';
import 'package:intl/intl.dart';

class ScrapOrderItem extends StatelessWidget {
  ScrapOrderItem({
    Key key,
    this.item,
    @required this.width,
  }) : super(key: key);
  MyScrapRequests item;
  final double width;
  var format = DateFormat('yMd');
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(239, 244, 255, 1),
            borderRadius: BorderRadius.circular(7),
          ),
          child: Container(
            // margin: EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'بلد الصنع',
                                  textScaleFactor: 1,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Cairo',
                                      color: Colors.black),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: width * 0.18,
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(233, 236, 242, 1),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Center(
                                    child: Container(
                                      margin: EdgeInsets.all(5),
                                      child: Text(
                                        item.regionName.toString(),
                                        textScaleFactor: 1,
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Cairo',
                                            color: AppColors.primaryColor),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  'نوع السيارة',
                                  textScaleFactor: 1,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Cairo',
                                      color: Colors.black),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: width * 0.18,
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(233, 236, 242, 1),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Center(
                                    child: Container(
                                      margin: EdgeInsets.all(5),
                                      child: Text(
                                        item.carTypeName.toString(),
                                        textScaleFactor: 1,
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Cairo',
                                            color: AppColors.primaryColor),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  'موديل السيارة',
                                  textScaleFactor: 1,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Cairo',
                                      color: Colors.black),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: width * 0.18,
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(233, 236, 242, 1),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Center(
                                    child: Container(
                                      margin: EdgeInsets.all(5),
                                      child: Text(
                                        item.modelName.toString(),
                                        textScaleFactor: 1,
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Cairo',
                                            color: AppColors.primaryColor),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  'سنة الصنع',
                                  textScaleFactor: 1,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Cairo',
                                      color: Colors.black),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: width * 0.18,
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(233, 236, 242, 1),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Center(
                                    child: Container(
                                      margin: EdgeInsets.all(5),
                                      child: Text(
                                        item.carYear.toString(),
                                        textScaleFactor: 1,
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Cairo',
                                            color: AppColors.primaryColor),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              'تاريخ الطلب:' +
                                  format.format(DateTime.parse(
                                      item.orderDate.toString())),
                              textScaleFactor: 1,
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Cairo',
                                  color: Colors.black),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              'رقم الطلب:#' + item.id.toString(),
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
                              Image.asset(
                                'assets/images/icons/Scrap/scrap(6).png',
                                height: 20,
                                width: 20,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                'لديك محادثة جديدة',
                                textScaleFactor: 1,
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Cairo',
                                    color: Colors.black),
                              ),
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
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Image.asset(
            'assets/images/icons/Scrap/scrap(11).png',
            height: 20,
            width: 20,
          ),
        ),
      ],
    );
  }
}
