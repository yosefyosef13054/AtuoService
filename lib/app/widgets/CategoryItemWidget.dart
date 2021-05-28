import 'package:autoservice/app/Colors.dart';

import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    Key key,
    @required this.i,
    @required this.items,
  }) : super(key: key);
  final int i;
  final List items;

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 5,
          ),
          Image.asset(
            items[i][1],
            height: 40,
            width: 40,
          ),
          // Icon(
          //   items[i][1],
          //   color: Colors.white,
          //   size: 40,
          // ),
          Text(
            items[i][0],
            textScaleFactor: 1,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                fontFamily: 'Cairo',
                color: AppColors.whiteColor),
          ),
          SizedBox(
            height: 8,
          )
        ],
      ),
    );
  }
}
