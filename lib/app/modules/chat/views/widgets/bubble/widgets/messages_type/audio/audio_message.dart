import 'package:autoservice/app/modules/chat/controllers/chat_controller.dart';
import 'package:autoservice/app/modules/chat/controllers/message_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'audio_message_components.dart';
import '../../../../../../controllers/get_chat_details.dart';

class AudioMessage extends StatefulWidget {
  AudioMessage({this.messageModal, this.index});
  MessageModal messageModal;
  int index;

  @override
  _AudioMessageState createState() => _AudioMessageState();
}

class _AudioMessageState extends State<AudioMessage> {
  static final controller = Get.find<ChatController>();

  @override
  Widget build(BuildContext context) {
    // List messages = controller.messages;
    MessageModal messageDetails = widget.messageModal;
    return Row(
      children: [
        AudioMessageComponents.buildAudioButton(() async {
          if (messageDetails.plyIcon == Icons.play_arrow) {
            try {
              messageDetails.plyIcon = Icons.pause_outlined;
              await AudioMessageComponents.checkAudioPath(
                  widget.index,
                  messageDetails.message,
                  messageDetails.assetsAudioPlayer,
                  messageDetails.plyIcon,
                  controller.messages);
            } catch (e) {
              AudioMessageComponents.onPlayRecordError(context);
              messageDetails.plyIcon = Icons.play_arrow;
            }
          } else {
            messageDetails.plyIcon = Icons.play_arrow;
            messageDetails.assetsAudioPlayer.stop();
          }

          setState(() {});

          messageDetails.assetsAudioPlayer.playlistAudioFinished
              .listen((event) {
            messageDetails.plyIcon = Icons.play_arrow;

            setState(() {});
          });
        }, messageDetails.plyIcon),
        SizedBox(
          width: 6,
        ),
        AudioMessageComponents.buildAudioSlider(
            messageDetails.voiceTime, messageDetails.assetsAudioPlayer)
      ],
    );
  }
}
