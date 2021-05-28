import 'package:autoservice/app/Colors.dart';

import 'package:flutter/material.dart';
import 'package:autoservice/app/modules/new_accessories/model.dart' as model;

class GridViewItem extends StatelessWidget {
  GridViewItem({
    Key key,
    this.item,
    this.url,
    @required this.height,
    @required this.width,
  }) : super(key: key);
  model.Accessories item;
  String url;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 15),
      height: height * 0.24,
      width: width * 0.346,
      color: Colors.white,
      child: Stack(
        children: [
          Image.network(
            url + item.imageUrl.toString(),
            fit: BoxFit.cover,
            height: width * 0.42,
            width: width,
          ),
          Positioned(
            bottom: 25,
            width: width * 0.45,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    item.partName,
                    textScaleFactor: 1,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Cairo',
                        color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              bottom: 0,
              right: 0,
              child: Row(
                children: [
                  Container(
                    height: 18,
                    width: width * 0.22,
                    color: Colors.grey,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        // item.carModelName.toString() +
                        item.carModelName.toString(),
                        textScaleFactor: 1,
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Cairo',
                            color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    height: 18,
                    width: width * 0.23,
                    color: Color.fromRGBO(200, 142, 116, 1),
                    child: Center(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            item.unitPrice.toString(),
                            textScaleFactor: 1,
                            style: TextStyle(
                                // decoration: TextDecoration.lineThrough,
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Cairo',
                                color: Colors.white),
                          ),
                          Text(
                            ' د.ك',
                            textScaleFactor: 1,
                            style: TextStyle(
                                // decoration: TextDecoration.lineThrough,
                                fontSize: 8,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Cairo',
                                color: Colors.white),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
