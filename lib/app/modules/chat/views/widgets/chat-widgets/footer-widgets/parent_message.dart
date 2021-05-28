import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ParentMessage extends StatelessWidget {
  ParentMessage(this.mentionMessage, this.mentionMessageId);
  String mentionMessage;
  int mentionMessageId;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
          height: mentionMessageId == 2 ? 70 : 30,
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
              color: Get.theme.primaryColor.withOpacity(0.4),
              borderRadius: BorderRadius.circular(4)),
          child: SingleChildScrollView(
            child: mentionMessageId == 0 || mentionMessageId == 3
                ? Text(
                    "$mentionMessage",
                    style:
                        Get.textTheme.bodyText2.copyWith(color: Colors.white),
                  )
                : Image.network(
                    "$mentionMessage",
                    width: 100,
                    height: 100,
                  ),
          )),
    );
  }
}
