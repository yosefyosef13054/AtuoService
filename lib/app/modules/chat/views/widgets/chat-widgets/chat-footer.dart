import 'package:autoservice/app/modules/chat/controllers/chat_controller.dart';
import 'package:autoservice/app/modules/chat/controllers/chat_footer_icons_on_press/footer_on_press.dart';
import 'package:autoservice/app/modules/chat/views/widgets/chat-widgets/footer-widgets/record_time.dart';
import 'package:autoservice/app/shared/data/detect_locale.dart';
import 'footer-widgets/reply_message.dart';
import 'package:autoservice/app/modules/chat/views/widgets/chat-widgets/footer-widgets/chat_text_field.dart';
import 'package:autoservice/theme/variables.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatFooter extends GetView<ChatController> {
  ChatFooter({
    Key key,
    @required this.formKey,
  });

  GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppTheme.controlPadding),
      child: Obx(() => Column(
            children: [
              controller.replyMessage.value == null
                  ? SizedBox()
                  : ReplyMessage(
                      replyMessage: controller.replyMessage,
                    ),
              Row(
                children: [
                  controller.typing.value
                      ? drawIconButtonFooter(
                          onPress: () {
                            FooterOnPress.sendIcon(controller);
                          },
                          isRotated: DetectLocale.detectLocale() ? 2 : 0,
                      imgName: 'send')
                      : Row(
                          children: [
                            drawIconButtonFooter(
                                imgName: 'mic',
                                isRotated: 0,
                                onPress: () async {
                                  FooterOnPress.recordIcon(controller);
                                }),
                            drawIconButtonFooter(
                                onPress: () {
                                  FooterOnPress.photoIcon(controller);
                                },
                                isRotated: 0,
                                imgName: 'camera'),
                          ],
                        ),
                  controller.recording.value
                      ? drawIconButtonFooter(
                          onPress: () async {
                            FooterOnPress.stopRecordIcon(controller);
                          },
                          isRotated: DetectLocale.detectLocale() ? 2 : 0,
                      imgName: 'stop')
                      : SizedBox(),
                  controller.recording.value
                      ? RecordTime()
                      : ChatTextField(
                          chatController: controller,
                          formKey: formKey,
                        ),
                ],
              ),
            ],
          )),
    );
  }

  drawIconButtonFooter({onPress, imgName, isRotated}) => IconButton(
        padding: EdgeInsets.all(8),
        onPressed: onPress,
        icon: RotatedBox(
          quarterTurns: isRotated,
          child: Image.asset(
            'assets/images/chat-icons/$imgName.png',
            color: AppTheme.primaryColor,
            width: 24,
          ),
        ),
      );
}
