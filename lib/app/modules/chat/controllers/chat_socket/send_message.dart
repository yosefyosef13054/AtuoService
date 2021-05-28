import 'dart:convert';
import 'package:autoservice/app/modules/chat/controllers/reply_message.dart';
import 'package:get/get.dart';
import 'package:autoservice/services/socket_service.dart';

class SendMessageSocket {
  static final socketService = Get.find<SocketService>();

  static sendMessage({
    receiverChatID,
    orderID,
    senderChatID,
    content,
    type,
    messageId,
    voiceTime,
    ReplyMessageModel replyMessageModal,
  }) {
    String socketMessageMap = json.encode({
      'receiverChatID': receiverChatID,
      'orderID': orderID,
      'senderChatID': senderChatID,
      'content': content,
      'type': type,
      'messageId': messageId,
      'voiceTime': voiceTime,
      'parent': replyMessageModal == null ? 0 : replyMessageModal.parent ?? "0",
      'parentType':
          replyMessageModal == null ? 0 : replyMessageModal.type ?? "0",
      'parentMessage':
          replyMessageModal == null ? "" : replyMessageModal.parentMessage ?? ""
    });

    socketService.sendMessage('send_message', socketMessageMap);
  }
}
