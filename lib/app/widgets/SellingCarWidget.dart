import 'package:autoservice/app/Colors.dart';
import 'package:autoservice/app/modules/HomeScreen/model.dart' as model;

import 'package:flutter/material.dart';

class SellingCarWidget extends StatelessWidget {
  SellingCarWidget(
      {Key key,
      @required this.height,
      @required this.width,
      this.item,
      this.url})
      : super(key: key);
  var url;
  final double height;
  final double width;
  model.UsedCar item;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * .23,
      width: width * .8,
      margin: EdgeInsets.symmetric(horizontal: 2.5),
      decoration: BoxDecoration(
          // boxShadow: [
          //   BoxShadow(
          //     color: AppColors.shadowColor,
          //     blurRadius: 20,
          //     offset: Offset(0, 10),
          //   ),
          // ],
          color: Color.fromRGBO(239, 244, 255, 1),
          borderRadius: BorderRadius.circular(18)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: width * .08),
            child: Text(
                item.partNameAr.toString() == null.toString()
                    ? ''
                    : item.partNameAr.toString(),
                textScaleFactor: 1,
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Cairo',
                    color: Colors.black)),
          ),
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Container(
                height: 40,
                width: width * 0.13,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.shadowColor,
                        blurRadius: 20,
                        offset: Offset(0, 10),
                      ),
                    ],
                    color: Color.fromRGBO(128, 128, 188, 1),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'سنة الصنع',
                      textScaleFactor: 1,
                      style: TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Cairo',
                          color: AppColors.whiteColor),
                    ),
                    Text(
                      item.carYearName.toString(),
                      textScaleFactor: 1,
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Cairo',
                          color: AppColors.whiteColor),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Container(
                height: 40,
                width: width * 0.13,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.shadowColor,
                        blurRadius: 20,
                        offset: Offset(0, 10),
                      ),
                    ],
                    color: Color.fromRGBO(55, 166, 178, 1),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'العداد/ كم',
                      textScaleFactor: 1,
                      style: TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Cairo',
                          color: AppColors.whiteColor),
                    ),
                    Text(
                      item.kmCounter.toString(),
                      textScaleFactor: 1,
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Cairo',
                          color: AppColors.whiteColor),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Container(
                height: 40,
                width: width * 0.13,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.shadowColor,
                        blurRadius: 20,
                        offset: Offset(0, 10),
                      ),
                    ],
                    color: Color.fromRGBO(200, 142, 116, 1),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'السعر / د.ك',
                      textScaleFactor: 1,
                      style: TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Cairo',
                          color: AppColors.whiteColor),
                    ),
                    Text(
                      item.unitPrice.toString(),
                      textScaleFactor: 1,
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Cairo',
                          color: AppColors.whiteColor),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 6),
                height: width * .24,
                width: width * 0.3,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Image.network(
                    url + item.imageUrl.toString(),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
