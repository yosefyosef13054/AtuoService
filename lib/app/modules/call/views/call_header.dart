import 'package:autoservice/app/modules/call/controllers/call_controller.dart';
import 'package:autoservice/app/modules/call/views/widgets/call_timer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CallHeader extends GetView<CallController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 140,
          height: 140,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Get.theme.primaryColor,
              border: Border.all(width: 4, color: Colors.grey[200])),
          child: Center(
              child: Image.asset(
            'assets/images/logo.png',
            width: 110,
            height: 110,
          )),
        ),
        Text(
          "${controller.userName.value}",
          style: Get.textTheme.bodyText2
              .copyWith(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 9,
        ),
        Obx(() => controller.agoraService.usersInCall.value
            ? CallTimer()
            : Text(
                controller.incomingCall.value
                    ? "مكالمة واردة"
                    : "${controller.callingStatue.value}",
                style: Get.textTheme.bodyText2.copyWith(fontSize: 18)))
      ],
    );
  }
}
