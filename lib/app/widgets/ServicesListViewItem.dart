import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:autoservice/app/Colors.dart';
import 'package:autoservice/app/modules/cars_services/model.dart';

class ServicesListViewItem extends StatelessWidget {
  ServicesListViewItem({
    this.url,
    Key key,
    @required this.width,
    this.item,
  }) : super(key: key);
  Services item;
  final double width;
  var url;
  @override
  Widget build(BuildContext context) {
    // print(url + item.imageUrl);
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      child: Container(
        width: width * .8,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(horizontal: 5),
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              item.serviceName.toString(),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClipOval(
                    child:
                        // image != null
                        //     ? Image.file(
                        //         image,
                        //         fit: BoxFit.cover,
                        //       )
                        //     :
                        Image.network(
                  url + item.companyLogoUrl,
                  fit: BoxFit.cover,
                  height: width * 0.15,
                  width: width * 0.15,
                )),
                Container(
                  height: 50,
                  width: 100,
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'السعر / د.ك',
                        textScaleFactor: 1,
                        style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Cairo',
                            color: AppColors.whiteColor),
                      ),
                      Text(
                        item.unitPrice.toString(),
                        textScaleFactor: 1,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Cairo',
                            color: AppColors.whiteColor),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  width: 100,
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
                        'المدة/دقيقة',
                        textScaleFactor: 1,
                        style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Cairo',
                            color: AppColors.whiteColor),
                      ),
                      Text(
                        item.duration.toString(),
                        textScaleFactor: 1,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Cairo',
                            color: AppColors.whiteColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
