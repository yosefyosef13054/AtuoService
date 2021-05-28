import 'package:autoservice/app/modules/chat/controllers/reply_message.dart';
import 'package:autoservice/app/shared/data/detect_locale.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class ReplyMessage extends StatelessWidget {
  ReplyMessage({this.replyMessage});
  Rx<ReplyMessageModel> replyMessage;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        children: [
          Container(
              width: 5,
              height: 70,
              decoration: BoxDecoration(
                  color: Get.theme.primaryColor,
                  borderRadius:
                      drawRadius(DetectLocale.detectLocale() ? false : true))),
          Expanded(
            child: Container(
              width: Get.width,
              height: 70,
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                  color: Get.theme.primaryColor.withOpacity(0.3),
                  borderRadius:
                      drawRadius(DetectLocale.detectLocale() ? true : false)),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          replyMessage.value.owner == 0
                              ? "your-message".tr
                              : "his-message".tr,
                          style: Get.textTheme.bodyText2.copyWith(
                              color: Get.theme.primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                        InkWell(
                            child: Icon(
                              Icons.close,
                              size: 20,
                            ),
                            onTap: () {
                              replyMessage.value = null;
                            })
                      ],
                    ),
                    replyMessage.value.type == 2
                        ? imageViewer()
                        : Text(replyMessage.value.type == 3
                            ? "voice-record".tr +
                                " ${replyMessage.value.voiceTime}"
                            : "${replyMessage.value.parentMessage}"),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  drawRadius(boolVal) => BorderRadius.only(
        topRight: boolVal ? Radius.circular(4) : Radius.circular(0),
        topLeft: boolVal ? Radius.circular(0) : Radius.circular(4),
        bottomRight: boolVal ? Radius.circular(4) : Radius.circular(0),
        bottomLeft: boolVal ? Radius.circular(0) : Radius.circular(4),
      );

  imageViewer() => CachedNetworkImage(
        imageUrl: replyMessage.value.parentMessage,
        imageBuilder: (context, imgUrl) => Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: NetworkImage(replyMessage.value.parentMessage),
          )),
        ),
        placeholder: (context, url) => Shimmer.fromColors(
          baseColor: Get.theme.primaryColor.withOpacity(0.2),
          highlightColor: Get.theme.accentColor.withOpacity(0.5),
          child: Image.asset('assets/images/logo.png'),
        ),
        errorWidget: (context, url, error) => Image.asset(
          'assets/images/logo.png',
          color: Colors.red[800],
          width: 30,
        ),
      );
}
