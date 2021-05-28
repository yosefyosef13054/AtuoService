import 'package:autoservice/app/modules/chat/controllers/chat_controller.dart';
import 'package:autoservice/app/modules/chat/views/widgets/bubble/widgets/messages_type/image_message.dart';
import 'package:autoservice/generated/time/chat_time.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'widgets/messages_type/audio/audio_message.dart';
import 'package:autoservice/app/modules/chat/controllers/message_model.dart';
import 'package:autoservice/app/modules/chat/controllers/reply_message.dart';
import 'package:autoservice/app/modules/chat/views/widgets/bubble/widgets/time_chat.dart';
import 'package:autoservice/app/modules/chat/views/widgets/chat-widgets/footer-widgets/parent_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swipe_to/swipe_to.dart';
import 'widgets/bubble.dart';

class MessageBubble extends GetView<ChatController> {
  MessageBubble(
      this.messageDetails, this.replyMessage, this.index, this.autoScrollCtrl);
  MessageModal messageDetails;
  Rx<ReplyMessageModel> replyMessage;
  AutoScrollController autoScrollCtrl;
  int index;
  @override
  Widget build(BuildContext context) {
    return messageDetails.type == -1
        ? TimeChat(messageDetails.messageTime)
        : SwipeTo(
            onRightSwipe: () {
              addReplyMessage();
            },
            child: Bubble(
              child: checkMessageType(
                  Text("${messageDetails.message}"),
                  ImageMessage(
                    imgUrl: '${messageDetails.message}',
                  ),
                  AudioMessage(index: index, messageModal: messageDetails)),
              color: checkHeIsMe(
                  messageDetails.type == 3
                      ? Colors.transparent
                      : Colors.grey[300],
                  messageDetails.type == 3
                      ? Colors.transparent
                      : Colors.grey[200]),
              shadowColor: Colors.transparent,
              alignment:
                  checkHeIsMe(Alignment.centerRight, Alignment.centerLeft),
              crossAxisAlignment:
                  checkHeIsMe(CrossAxisAlignment.start, CrossAxisAlignment.end),
              belowWidgetPadding: EdgeInsets.only(right: 15, left: 15),
              belowWidget: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Obx(() => controller.isReadiedAllMsg.value
                      ? readiedIcon()
                      : readiedIcon()),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "${ChatTime.showMessageTime(messageDetails.messageTime.toString())}",
                    style: Get.textTheme.caption,
                  ),
                ],
              ),
              margin: checkHeIsMe(
                  BubbleEdges.only(left: 100), BubbleEdges.only(right: 100)),
              nip: checkHeIsMe(BubbleNip.rightTop, BubbleNip.leftTop),
            ),
          );
  }

  readiedIcon() => messageDetails.owner == 0
      ? messageDetails.readed == 1
          ? Icon(
              Icons.done,
              color: Colors.grey,
              size: 15,
            )
          : Icon(
              Icons.done_all,
              color: Get.theme.primaryColor,
              size: 15,
            )
      : SizedBox();

  checkHeIsMe(val1, val2) => messageDetails.owner == 0 ? val1 : val2;
  checkMessageType(val1, val2, val3) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          messageDetails.parentMessage == ""
              ? SizedBox()
              : InkWell(
                  onTap: () async {
                    final int index = controller.messages.indexWhere(
                        (element) => element.id == messageDetails.parent);

                    // print("Message parent Index:$index");
                    print(messageDetails.parent);

                    await this.autoScrollCtrl.scrollToIndex(index,
                        preferPosition: AutoScrollPosition.begin);
                    this.autoScrollCtrl.highlight(index);
                  },
                  child: ParentMessage(
                      messageDetails.parentMessage, messageDetails.parentType),
                ),
          SizedBox(
            height: 4,
          ),
          messageDetails.type == 0
              ? val1
              : messageDetails.type == 2
                  ? val2
                  : val3
        ],
      );

  addReplyMessage() {
    int messageType = messageDetails.type;
    replyMessage.value = ReplyMessageModel(
        type: messageType,
        parent: messageDetails.id,
        owner: messageDetails.owner,
        voiceTime: messageDetails.voiceTime,
        parentMessage: messageType == 3
            ? " تسجيل صوتي ${messageDetails.voiceTime}"
            : messageDetails.message);

    // print(replyMessage.value.parentMessage);
    // print(messageDetails.owner);
    // print(messageDetails.type);
  }
}
