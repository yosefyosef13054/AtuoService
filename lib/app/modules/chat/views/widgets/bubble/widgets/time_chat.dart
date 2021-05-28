import 'package:autoservice/generated/time/chat_time.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimeChat extends StatelessWidget {
  TimeChat(this.time);
  String time;
  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Container(
        padding: EdgeInsets.only(right: 5, left: 5),
        margin: EdgeInsets.all(5),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Get.theme.primaryColor.withOpacity(0.8),
            borderRadius: BorderRadius.circular(2)),
        child: Text(
          "${ChatTime.convertToReadableDate(time.toString())}",
          style: Get.textTheme.bodyText2.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
