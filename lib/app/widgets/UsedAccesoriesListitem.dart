import 'package:autoservice/app/Colors.dart';

import 'package:flutter/material.dart';
import 'package:autoservice/app/modules/accessories/model.dart' as model;

class UsedAccesoriesListitem extends StatelessWidget {
  UsedAccesoriesListitem(
      {Key key,
      @required this.height,
      @required this.width,
      this.item,
      this.url})
      : super(key: key);

  model.UsedAccessory item;
  final double height;
  final double width;
  String url;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2),
      height: height * 0.6,
      width: width * 0.346,
      color: AppColors.whiteColor,
      child: Stack(
        children: [
          item.images.isEmpty
              ? Container()
              : Image.network(
                  url + item.images.elementAt(0)['imageURL'],
                  fit: BoxFit.contain,
                  height: height * 0.24,
                  width: width * 0.3,
                ),
          Positioned(
              bottom: 0,
              right: 0,
              child: Row(
                children: [
                  Container(
                    height: 18,
                    color: Colors.grey,
                    width: width * 0.20,
                    child: Center(
                      child: Text(
                        // + item.carYearName
                        item.carTypeName + ' ' + item.carYearName,
                        textScaleFactor: 1,
                        style: TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Cairo',
                            color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    height: 18,
                    width: width * 0.18,
                    color: Color.fromRGBO(200, 142, 116, 1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          item.unitPrice.toString(),
                          textScaleFactor: 1,
                          style: TextStyle(
                              // decoration: TextDecoration.lineThrough,
                              fontSize: 10,
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
                ],
              )),
          Positioned(
            bottom: 30,
            left: 0,
            width: width * 0.346,
            child: Container(
              width: width * 0.346,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      item.partName,
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
