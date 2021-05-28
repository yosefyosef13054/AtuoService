import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:autoservice/app/modules/chat/controllers/message_model.dart';
import 'package:autoservice/app/services/global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'dart:convert';

import 'package:scroll_to_index/scroll_to_index.dart';

class ChatDetails {
  static RxString chatId = RxString("");

  static Future getChatDetails(
      {String userId,
      String otherId,
      RxBool loading,
      RxList<MessageModal> messages}) async {
    String url = "${GlobalService.baseURLWithoutToken}v1/mobile/openChat";

    Map getChatDetailsBody = {
      'userId': userId,
      'otherId': otherId,
      'reverse': 1.toString()
    };

    // print(getChatDetailsBody);

    http.Response response = await http.post(url, body: getChatDetailsBody);

    var responseDecoded = json.decode(response.body);

    if (response.statusCode == 200) {
      // print(responseDecoded);

      chatId(responseDecoded['chatId']);

      for (var message in responseDecoded['data']) {
        messages.add(MessageModal.fromJson(message));
      }
      loading(false);
    } else {
      loading(false);
      // print(responseDecoded);
    }
  }
}
