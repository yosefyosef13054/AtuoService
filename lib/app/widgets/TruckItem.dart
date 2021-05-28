import 'package:autoservice/app/Colors.dart';
import 'package:flutter/material.dart';
import 'package:autoservice/app/modules/used_cars_forsell/model.dart' as model;

class TruckItem extends StatelessWidget {
  TruckItem({
    Key key,
    this.item,
    this.url,
    @required this.height,
    @required this.width,
  }) : super(key: key);
  model.UsedCar item;
  final double height;
  final double width;
  String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * .2,
      width: width * .85,
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
            margin: EdgeInsets.symmetric(
              horizontal: width * .12,
            ),
            child: Text(item.partNameAr,
                textScaleFactor: 1,
                style: TextStyle(
                    fontSize: 18,
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
                width: width * 0.14,
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
                    Flexible(
                      child: Text(
                        item.carYearName.toString(),
                        textScaleFactor: 1,
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Cairo',
                            color: AppColors.whiteColor),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Container(
                height: 40,
                width: width * 0.14,
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
                    Flexible(
                      child: Text(
                        item.unitPrice.toString(),
                        textScaleFactor: 1,
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Cairo',
                            color: AppColors.whiteColor),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 6),
                height: width * .26,
                width: width * 0.4,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Image.network(
                    url + item.imageURL.toString(),
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
