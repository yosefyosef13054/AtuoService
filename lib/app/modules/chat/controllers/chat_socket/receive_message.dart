import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:autoservice/app/modules/chat/controllers/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../message_model.dart';

class ReceiveMessageSocket {
  static receiveMessage(Map data, ChatController chatController) async {
    chatController.messages.add(MessageModal(
        type: data['type'],
        message: data['content'],
        owner: 1,
        played: 0,
        plyIcon: Icons.play_arrow,
        assetsAudioPlayer: AssetsAudioPlayer(),
        voiceTime: data['voiceTime'],
        parent: int.parse(data['parent'].toString()),
        parentType: data['parentType'],
        parentMessage: data['parentMessage'],
        messageTime: DateTime.now().subtract(Duration(hours: 1)).toString(),
        readed: 1,
        id: int.parse(data['messageId'])));

    Future.delayed(Duration(milliseconds: 200), () {
      chatController.autoScrollCtrl
          .jumpTo(chatController.autoScrollCtrl.position.maxScrollExtent);
    });
  }
}
