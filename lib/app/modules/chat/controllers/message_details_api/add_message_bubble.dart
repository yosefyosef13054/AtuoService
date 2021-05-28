import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:autoservice/app/modules/chat/controllers/chat_socket/send_message.dart';
import 'package:autoservice/app/modules/chat/controllers/get_chat_details.dart';
import 'package:autoservice/app/modules/chat/controllers/record/record_audio.dart';
import 'package:autoservice/app/modules/chat/controllers/reply_message.dart';
import 'package:autoservice/generated/time/chat_time.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../message_model.dart';

class MessageBubble {
  static AssetsAudioPlayer localAudio = AssetsAudioPlayer();

  static addMessageBubble(
      AutoScrollController scrollController,
      RxList messageList,
      RxBool status,
      String message,
      int type,
      Rx<TextEditingController> textController,
      Rx<ReplyMessageModel> replyMessage) {
    messageList.add(MessageModal(
        message: message,
        type: type,
        parent: replyMessage.value == null ? 0 : replyMessage.value.parent,
        parentMessage:
            replyMessage.value == null ? "" : replyMessage.value.parentMessage,
        parentType: replyMessage.value == null ? 0 : replyMessage.value.type,
        messageTime: DateTime.now().subtract(Duration(hours: 2)).toString(),
        assetsAudioPlayer: AssetsAudioPlayer(),
        plyIcon: Icons.play_arrow,
        id: 0,
        owner: 0,
        readed: 1,
        voiceTime: RecordAudio.recordTime.value,
        messageDate: DateTime.now().subtract(Duration(hours: 2)).toString(),
        messageTimeOnly:
            DateTime.now().subtract(Duration(hours: 2)).toString()));

    localAudio.open(Audio('assets/sounds/text_tone.mp3'));

    scrollController.jumpTo(scrollController.position.maxScrollExtent + 50);
    status(false);
    textController.value.clear();
  }

  static removeMessageBubble(RxList messageList, MessageModal message) {
    messageList.remove(message);
  }
}
