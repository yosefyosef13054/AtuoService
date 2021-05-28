import 'dart:ui';
import 'package:autoservice/app/Colors.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter/material.dart';
import 'package:autoservice/app/modules/scrap_orders/model.dart';

class GarageListItem extends StatelessWidget {
  GarageListItem(
      {Key key,
      @required this.width,
      this.item,
      this.url,
      })
      : super(key: key);
  Company item;
  var url;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(239, 244, 255, 1),
        borderRadius: BorderRadius.circular(7),
      ),
      child: Container(
        margin: EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
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
                  url + item.imageUrl,
                  fit: BoxFit.cover,
                  height: width * 0.09,
                  width: width * 0.09,
                )),
                SizedBox(
                  width: 15,
                ),
                Text(
                  item.companyName,
                  textScaleFactor: 1,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Cairo',
                      color: Colors.black),
                ),
              ],
            ),
            Row(
              children: [
                Image.asset(
                  'assets/images/icons/Scrap/scrap(6).png',
                  height: 27,
                  width: 27,
                ),
                SizedBox(
                  width: 16,
                ),
                Image.asset(
                  'assets/images/icons/Scrap/scrap(3).png',
                  height: 23,
                  width: 23,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
