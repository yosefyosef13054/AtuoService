import 'package:autoservice/app/modules/call/controllers/call_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CallAcceptable extends GetView<CallController> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        buildCallOption(
            color: Colors.green,
            loading: controller.startCall,
            onTap: () {
              controller.incomingCall(false);
              controller.acceptCall();
            },
            icon: Icons.call),
        buildCallOption(
            color: Colors.red,
            onTap: () {
              controller.userJoin();
              controller.leaveChannel();
            },
            loading: controller.endCall,
            icon: Icons.call_end_sharp),
      ],
    );
  }

  buildCallOption(
          {Color color, Function onTap, IconData icon, RxBool loading}) =>
      Container(
        width: 80,
        height: 80,
        decoration:
            BoxDecoration(color: Colors.transparent, shape: BoxShape.circle),
        child: Obx(() => RaisedButton(
              color: color,
              onPressed: onTap,
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
                      color: Colors.white,
                    ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60)),
              elevation: 0.0,
              highlightElevation: 0.0,
            )),
      );
}
