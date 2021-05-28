import 'package:autoservice/app/modules/call/controllers/call_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class CallTimer extends GetView<CallController> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: controller.agoraService.stopWatchTimer.rawTime,
      initialData: controller.agoraService.stopWatchTimer.rawTime.value,
      builder: (context, snap) {
        final value = snap.data;
        final displayTime = StopWatchTimer.getDisplayTime(value,
            hours: false, milliSecond: false);
        return Text(
          displayTime,
          style: Get.textTheme.bodyText2.copyWith(fontSize: 18),
        );
      },
    );
  }
}
