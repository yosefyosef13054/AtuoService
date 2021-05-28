import 'package:autoservice/app/modules/chat/controllers/message_details_api/text_message.dart';
import 'package:autoservice/app/modules/chat/controllers/message_details_api/audio_message.dart';
import 'package:autoservice/app/modules/chat/controllers/message_details_api/photo_message.dart';
import 'package:autoservice/app/modules/chat/controllers/reply_message.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class Message {
  static sendTextMessage(
      {String chatId,
      RxString message,
      int type,
      RxBool typing,
      String orderID,
      String myId,
      String companyId,
      String fcmToken,
      String receiverChatID,
      Rx<TextEditingController> textController,
      Rx<ReplyMessageModel> replyMessage,
      AutoScrollController scrollController,
      RxList messageList}) {
    TextMessage.sendText(
        message: message,
        messageList: messageList,
        replyMessage: replyMessage,
        myId: myId,
        fcmToken: fcmToken,
        orderID: orderID,
        companyId: companyId,
        receiverChatID: receiverChatID,
        typing: typing,
        scrollController: scrollController,
        textController: textController,
        type: type,
        chatId: chatId);
  }

  static sendAudioMessage(
      {String chatId,
      RxString message,
      RxString recordPath,
      int type,
      String orderID,
      String receiverChatID,
      String myId,
      String companyId,
      String fcmToken,
      RxBool recording,
      Rx<TextEditingController> textController,
      Rx<ReplyMessageModel> replyMessage,
      AutoScrollController scrollController,
      RxList messageList}) {
    AudioMessage.sendAudio(
        message: message,
        messageList: messageList,
        replyMessage: replyMessage,
        orderID: orderID,
        receiverChatID: receiverChatID,
        recordPath: recordPath,
        recording: recording,
        companyId: companyId,
        myId: myId,
        fcmToken: fcmToken,
        scrollController: scrollController,
        textController: textController,
        type: type,
        chatId: chatId);
  }

  static sendPhotoMessage(
      {String chatId,
      RxString message,
      int type,
      RxBool typing,
      String orderID,
      String myId,
      String companyId,
      String fcmToken,
      String receiverChatID,
      Rx<TextEditingController> textController,
      Rx<ReplyMessageModel> replyMessage,
      AutoScrollController scrollController,
      RxList messageList}) {
    PhotoMessage.sendPhoto(
        message: message,
        messageList: messageList,
        replyMessage: replyMessage,
        orderID: orderID,
        companyId: companyId,
        receiverChatID: receiverChatID,
        typing: typing,
        myId: myId,
        fcmToken: fcmToken,
        scrollController: scrollController,
        textController: textController,
        type: type,
        chatId: chatId);
  }
}
