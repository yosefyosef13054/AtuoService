import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/scrap_request_controller.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
class RecordTime extends GetView<ScrapRequestController> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder<int>(
        stream: controller.stopWatchTimer.rawTime,
        initialData: controller.stopWatchTimer.rawTime.value,
        builder: (context, snap) {
          final value = snap.data;
          final displayTime = StopWatchTimer.getDisplayTime(value,
              hours: false, milliSecond: false);
          // RecordAudio.recordTime(displayTime);

          // if (RecordAudio.maxRecordTime.value == "02:00") {
          // RecordAudio.stopRecord();
          // Timer(Duration(seconds: 1), () {
          //   // print(RecordAudio.recordFilePath.value);
          //   RecordAudio.maxRecordTime("02:00");
          //   RecordAudio
          //       .sendAudio(
          //       RecordAudio.chatId.value,
          //       RecordAudio.recordFilePath.value,
          //       RecordAudio.replyMessageModal.value)
          //       .then((value) {
          //     RecordAudio.stopRecordInSocket();
          //   });
          // });
          // }
          return Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "record-now".tr,
                  style: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Text(
                      displayTime,
                      style: const TextStyle(
                          fontSize: 20,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Image.asset(
                      'assets/images/voice.gif',
                      color: Colors.red,
                      width: 30,
                    )
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
