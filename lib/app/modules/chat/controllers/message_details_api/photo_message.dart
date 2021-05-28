import 'package:autoservice/app/modules/chat/controllers/chat_socket/send_message.dart';
import 'package:autoservice/app/modules/chat/controllers/message_details_api/add_message_bubble.dart';
import 'package:autoservice/app/modules/chat/controllers/message_model.dart';
import 'package:autoservice/app/modules/chat/controllers/record/record_audio.dart';
import 'package:autoservice/app/modules/chat/controllers/reply_message.dart';
import 'package:autoservice/app/services/global.dart';
import 'package:autoservice/app/shared/data/user_data.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'dart:convert';
import 'package:autoservice/app/shared/data/api_token.dart';
import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:autoservice/app/modules/HomeScreen/controllers/home_screen_controller.dart';
import 'package:autoservice/app/modules/chat/controllers/chat_controller.dart';

class PhotoMessage {
  static sendPhoto(
      {String chatId,
      RxString message,
      RxBool typing,
      String orderID,
      String receiverChatID,
      String companyId,
      String fcmToken,
      String myId,
      int type,
      Rx<ReplyMessageModel> replyMessage,
      Rx<TextEditingController> textController,
      AutoScrollController scrollController,
      RxList<MessageModal> messageList}) async {
    String url =
        "${GlobalService.baseURLWithoutToken}v1/mobile/sendChatMessage";

    Map<String, String> sendPhotoBody = {
      'chatId': chatId,
      'type': type.toString(),
      'userId': orderID,
      'callerName': orderID,
      'companyId': companyId,
      'parent': replyMessage.value == null
    ? 0.toString()
          : replyMessage.value.parent.toString(),
      'parentMessage':
          replyMessage.value == null ? "" : replyMessage.value.parentMessage,
      'deviceToken': fcmToken,
      'parentType': replyMessage.value == null
          ? 0.toString()
          : replyMessage.value.type.toString(),
    };

    print("Token here : $fcmToken");

    // print(sendPhotoBody);

    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.files
        .add(await http.MultipartFile.fromPath('attachment', message.value));

    // print(message.value);

    request.headers.addAll({'Authorization': 'Bearer ${APIToken.apiToken}'});

    request.fields.addAll(sendPhotoBody);
    var response = await request.send();

    message("");

    response.stream.transform(utf8.decoder).listen((event) async {
      // print(event);
      var responseDecoded = json.decode(event);

      if (response.statusCode == 200) {
        // print(responseDecoded);
        MessageBubble.addMessageBubble(scrollController, messageList, typing,
            responseDecoded['message'], type, textController, replyMessage);
        messageList.last.id = int.parse(responseDecoded['messageId']);
        messageList.last.message = responseDecoded['message'];

        await SendMessageSocket.sendMessage(
            content: responseDecoded['message'],
            type: type,
            voiceTime: RecordAudio.recordTime.value,
            replyMessageModal: replyMessage.value,
            messageId: responseDecoded['messageId'],
            senderChatID: "$myId",
            orderID: orderID,
            receiverChatID: receiverChatID);

        // print(messageList.last.message);
        replyMessage.value = null;

        return true;
      } else {
        MessageBubble.removeMessageBubble(messageList, messageList.last);
      }
    });
  }
}
