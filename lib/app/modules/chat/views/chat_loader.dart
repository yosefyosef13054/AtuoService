import 'package:autoservice/app/modules/chat/views/widgets/bubble/widgets/bubble.dart';
import 'package:autoservice/app/shared/data/detect_locale.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class ChatLoader extends StatelessWidget {
  List<int> messageWidth = [40, 700, 300, 260, 100, 100, 140, 440, 10, 55];
  List<int> messageHeight = [20, 50, 20, 20, 40, 10, 20, 20, 20, 10];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      shrinkWrap: true,
      itemBuilder: (c, i) => Shimmer.fromColors(
        highlightColor: Get.theme.primaryColor.withOpacity(0.4),
        baseColor: Get.theme.primaryColor.withOpacity(1),
        child: Bubble(
          child: Container(
            width: messageWidth[i].toDouble(),
            height: messageHeight[i].toDouble(),
          ),
          color: Get.theme.primaryColor.withOpacity(0.2),
          shadowColor: Colors.transparent,
          crossAxisAlignment: DetectLocale.detectLocale()
              ? checkHeIsMe(
                  i.isOdd, CrossAxisAlignment.end, CrossAxisAlignment.start)
              : checkHeIsMe(
                  i.isOdd, CrossAxisAlignment.end, CrossAxisAlignment.start),
          belowWidgetPadding: checkHeIsMe(
              i.isOdd, EdgeInsets.only(right: 15), EdgeInsets.only(left: 15)),
          belowWidget: Text(
            "00:00",
            style: Get.textTheme.caption,
          ),
          margin: checkHeIsMe(i.isOdd, BubbleEdges.only(left: 100),
              BubbleEdges.only(right: 100)),
          nip: checkHeIsMe(i.isOdd, BubbleNip.rightTop, BubbleNip.leftTop),
        ),
      ),
    );
  }

  checkHeIsMe(condition, val1, val2) => condition ? val1 : val2;
}
