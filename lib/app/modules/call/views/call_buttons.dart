import 'package:autoservice/app/modules/call/controllers/call_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CallButtons extends GetView<CallController> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        //Mute button
        Obx(() => buildCallButton(
            onTap: !controller.agoraService.usersInCall.value
                ? null
                : () {
                    controller.agoraService.setMute();
                  },
            loading: false.obs,
            color: controller.agoraService.mute.value
                ? Get.theme.primaryColor
                : Colors.white,
            iconColor: controller.agoraService.mute.value
                ? Colors.white
                : Get.theme.primaryColor,
            borderColor: Get.theme.primaryColor,
            tooltip:
                controller.agoraService.mute.value ? "mute".tr : "un-mute".tr,
            icon: Icons.mic)),
        //Close call button
        buildCallButton(
            onTap: () {
              controller.userJoin();
              controller.leaveChannel();
            },
            loading: controller.endCall,
            tooltip: "Close call",
            color: Colors.red[600],
            icon: Icons.call),
        //Speaker or mic button
        Obx(() => buildCallButton(
            loading: false.obs,
            onTap: !controller.agoraService.usersInCall.value
                ? null
                : controller.agoraService.mute.value
                    ? null
                    : () {
                        controller.agoraService.switchSpeakerphone();
                      },
            color: controller.agoraService.enableSpeakerphone.value
                ? Get.theme.primaryColor
                : Colors.white,
            iconColor: controller.agoraService.enableSpeakerphone.value
                ? Colors.white
                : Get.theme.primaryColor,
            tooltip: controller.agoraService.enableSpeakerphone.value
                ? "speaker".tr
                : "earpiece".tr,
            borderColor: Get.theme.primaryColor,
            icon: Icons.volume_up)),
      ],
    );
  }

  buildCallButton(
          {Color color,
          Function onTap,
          IconData icon,
          Color iconColor,
          Color borderColor,
          String tooltip,
          RxBool loading}) =>
      Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: borderColor ?? Colors.transparent),
          color: color,
        ),
        child: Tooltip(
          message: tooltip,
          child: Obx(() => RaisedButton(
                onPressed: onTap,
                color: color,
                child: loading.value
                    ? Container(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          valueColor:
                              new AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      )
                    : Icon(
                        icon,
                        color: iconColor ?? Colors.white,
                      ),
                elevation: 0.0,
                highlightElevation: 0.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
              )),
        ),
      );
}
