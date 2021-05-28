import 'package:autoservice/app/modules/chat/controllers/chat_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../../../image_interactive.dart';
import 'dart:io';
import '../../../../../controllers/photo/get_image.dart';

class ImageMessage extends GetView<ChatController> {
  ImageMessage({this.imgUrl});
  String imgUrl;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => ImageInteractive(
              imgUrl: imgUrl,
            ));
        print(imgUrl);
      },
      child: CachedNetworkImage(
        imageUrl: imgUrl,
        imageBuilder: (c, url) => Container(
          height: 200,
          width: Get.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(imgUrl), fit: BoxFit.cover)),
        ),
        placeholder: (context, url) => Shimmer.fromColors(
          baseColor: Get.theme.primaryColor.withOpacity(0.2),
          highlightColor: Get.theme.accentColor.withOpacity(0.5),
          child: Image.asset('assets/images/logo.png'),
        ),
        errorWidget: (context, url, error) => Container(
          width: 40,height: 40,
        ),
      ),
    );
  }
}
