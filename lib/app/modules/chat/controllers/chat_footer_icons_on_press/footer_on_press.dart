import 'package:autoservice/app/modules/chat/controllers/chat_controller.dart';
import 'package:autoservice/app/modules/chat/controllers/photo/get_image.dart';
import 'package:autoservice/app/modules/chat/controllers/record/record_audio.dart';

class FooterOnPress {
  static sendIcon(ChatController controller) async {
    // UserStatusSocket.startRecording(
    //     controller.other_id.value, controller.id.value);
    if (controller.recording.value) {
      await RecordAudio.stopRecord(controller.recording);
      Future.delayed(Duration(seconds: 1), () {
        controller.sendMessage(
          replyMessage: controller.replyMessage,
          message: RecordAudio.recordfilePath,
          textMessage: controller.messageController,
          type: 3,
        );
      });
      controller.typing(false);
    } else {
      controller.sendMessage(
        replyMessage: controller.replyMessage,
        message: controller.messageText,
        textMessage: controller.messageController,
        type: 0,
      );
    }
    UserStatusSocket.stopRecording(
        "M_${controller.garageId.value}", controller.orderId.value);
    UserStatusSocket.stopTyping(
        "M_${controller.garageId.value}", controller.orderId.value);
  }

  static recordIcon(ChatController controller) async {
    controller.recording(true);
    controller.typing(true);
    await RecordAudio.startRecord();
    UserStatusSocket.startRecording(
        "M_${controller.garageId.value}", controller.orderId.value);
  }

  static photoIcon(ChatController controller) async {
    await GetImage.imageFromGallery();
    GetImage.galleryImage.value == ""
        ? null
        : await controller.sendMessage(
            type: 2,
            message: GetImage.galleryImage,
            replyMessage: controller.replyMessage,
            textMessage: controller.messageController);
    // await // print();
  }

  static stopRecordIcon(ChatController controller) async {
    controller.typing(false);
    await RecordAudio.stopRecord(controller.recording);
    UserStatusSocket.stopRecording(
        "M_${controller.garageId.value}", controller.orderId.value);
  }
}
