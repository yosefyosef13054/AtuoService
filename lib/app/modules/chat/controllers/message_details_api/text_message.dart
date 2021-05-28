import 'package:autoservice/app/modules/chat/controllers/chat_socket/send_message.dart';
import 'package:autoservice/app/modules/chat/controllers/get_chat_details.dart';
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


class TextMessage {
  static sendText(
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
    MessageBubble.addMessageBubble(scrollController, messageList, typing,
        message.value, type, textController, replyMessage);

    String url =
        "${GlobalService.baseURLWithoutToken}v1/mobile/sendChatMessage";

    print(orderID.toString());

    Map sendTextBody = {
      'chatId': chatId,
      'message': message.value,
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
//chatController.otherfcmToken.value
    print("Token here : $fcmToken");

    print(sendTextBody);

    http.Response response = await http.post(url,
        body: sendTextBody,
        headers: {'Authorization': 'Bearer ${APIToken.apiToken}'});

    var responseDecoded = json.decode(response.body);

    if (response.statusCode == 200) {
      messageList.last.id = int.parse(responseDecoded['messageId']);

      SendMessageSocket.sendMessage(
          content: message,
          type: type,
          voiceTime: '',
          replyMessageModal: replyMessage.value,
          messageId: responseDecoded['messageId'],
          senderChatID: "$myId",
          orderID: orderID,
          receiverChatID: receiverChatID);

      replyMessage.value = null;
    } else {
      MessageBubble.removeMessageBubble(messageList, messageList.last);
    }
  }
}
