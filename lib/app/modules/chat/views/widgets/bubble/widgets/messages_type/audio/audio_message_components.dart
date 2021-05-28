import 'package:autoservice/app/modules/chat/controllers/get_chat_details.dart';
import 'package:autoservice/app/modules/chat/controllers/message_model.dart';
import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:get/get.dart';
import 'package:toast/toast.dart';

import 'audio_slider.dart';

class AudioMessageComponents {
  static Future checkAudioPath(
      int index,
      String message,
      AssetsAudioPlayer myPlayer,
      IconData plyIcon,
      List<MessageModal> messages) async {
    if (message.contains('auto_serv')) {
      myPlayer.stop();
      myPlayer.open(
        Audio.file(message),
        showNotification: true,
      );
    } else {
      myPlayer.stop();
      await myPlayer.open(
        Audio.network(message, cached: true),
        showNotification: true,
      );
    }
    for (int i = 0; i < messages.length; i++) {
      if (i != index) {
        // ChatDetails.myPlayer[i].stop();
        messages[i].assetsAudioPlayer.stop();
      }
      if (i == index) {
        // print("index $index equal $i");
      }
    }
  }

  static Widget buildAudioSlider(
          String recordTime, AssetsAudioPlayer myPlayer) =>
      myPlayer.builderRealtimePlayingInfos(builder: (context, info) {
        if (info == null) {
          return AudioSlider(recordTime);
        }
        return AudioSlider(recordTime, info.duration, info.currentPosition,
            Get.theme.primaryColor, Get.theme.accentColor, (to) {
          myPlayer.seek(to);
        });
      });

  static buildAudioButton(onTap, icon) => InkWell(
        onTap: onTap,
        child: CircleAvatar(
          backgroundColor: Get.theme.primaryColor,
          child: Icon(icon),
        ),
      );

  static onPlayRecordError(context) {
    Toast.show("audio-error-tittle".tr, context);
  }
}
