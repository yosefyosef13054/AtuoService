import 'package:autoservice/theme/variables.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarInfo extends StatelessWidget {
  const CarInfo({
    Key key,
    @required title,
    @required value,
  })  : _title = title,
        _value = value,
        super(key: key);
  final _title;
  final _value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(3),
      child: Column(
        children: [
          Text(
            '${_title}'.tr,
            style:
                Theme.of(context).textTheme.overline.apply(color: Colors.white),
          ),
          Container(
            margin: EdgeInsets.only(top: 8),
            padding: EdgeInsets.only(top: 2, bottom: 2, right: 10, left: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.white,
            ),
            child: Text(
              _value,
              style: Theme.of(context).textTheme.overline.apply(
                    color: AppTheme.primaryColor,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
