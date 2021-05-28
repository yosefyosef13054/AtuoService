import 'package:autoservice/app/modules/chat/controllers/chat_controller.dart';
import 'package:autoservice/app/modules/chat/views/widgets/bubble/message_bubble.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class ChatList extends StatefulWidget {
  const ChatList({
    Key key,
    @required ChatController chatController,
  })  : _chatController = chatController,
        super(key: key);

  final ChatController _chatController;

  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  final scrollDirection = Axis.vertical;

  @override
  void initState() {
    super.initState();
    widget._chatController.showRequestDialog(context);
    widget._chatController.autoScrollCtrl = AutoScrollController(
        viewportBoundaryGetter: () =>
            Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
        axis: scrollDirection);

    //To get More Message
    widget._chatController.getMoreMessage();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.builder(
          scrollDirection: scrollDirection,
          controller: widget._chatController.autoScrollCtrl,
          itemCount: widget._chatController.messages.length,
          shrinkWrap: true,
          itemBuilder: (c, i) => AutoScrollTag(
            index: i,
            key: ValueKey(i),
            highlightColor: Get.theme.primaryColor.withOpacity(0.2),
            controller: widget._chatController.autoScrollCtrl,
            child: MessageBubble(
                widget._chatController.messages[i],
                widget._chatController.replyMessage,
                i,
                widget._chatController.autoScrollCtrl),
          ),
        ));
  }
}
