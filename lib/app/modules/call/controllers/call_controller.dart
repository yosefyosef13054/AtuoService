import 'package:autoservice/app/modules/HomeScreen/controllers/home_screen_controller.dart';
import 'package:autoservice/app/modules/chat/controllers/message_details_api/audio_message.dart';
import 'package:autoservice/app/services/agora_service.dart';
import 'package:autoservice/services/notification_service.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'end_call.dart';
import 'answer_call.dart';
class CallController extends GetxController {
  final agoraService = Get.find<AgoraService>();
  int length = 0;
  RxBool incomingCall = false.obs,
      endCall = false.obs,
      startCall = false.obs,
      closeCall = false.obs,
      callFirst = true.obs;

  RxString userName = "".obs,
      appId = "".obs,
      channelName = "".obs,
      channelToken = "".obs,
      resourceId = "".obs,
      sid = "".obs,
      uId = "".obs,
      otherUserToken = "".obs,
      callingStatue = "".obs,
      clientId = "".obs,
      companyId = "".obs,
      orderId = "".obs;

  RxInt countDown = 0.obs, closeTime = 0.obs;

  Timer timer;

  @override
  void onInit() async {
    listenToOtherUserLeaveCall();
    initialData();
    printAllData();
    buildCallingWord();
    print("incomming calll ${incomingCall.value}");
    if (!(incomingCall.value)) {
      playAudio('voice_call_start');
      acceptCall();
      Timer.periodic(Duration(seconds: 1), (t) {
        print(countDown);
        countDown++;
        timer = t;
      });

      countDown.listen((value) {
        if (value == 30) leaveChannel();
      });
    }
    if (incomingCall.value) playAudio('incomingcall');

    super.onInit();
  }

  initialData() {
    appId('635ec22c22624c789134f166593ea348');
    channelToken(Get.arguments[0]);
    channelName(Get.arguments[1]);
    userName(Get.arguments[2]);
    incomingCall(Get.arguments[3]);
    otherUserToken(Get.arguments[4]);
    resourceId(Get.arguments[5]);
    sid(Get.arguments[6]);
    uId(Get.arguments[7]);
    clientId(Get.arguments[8]);
    companyId(Get.arguments[9]);
    orderId(Get.arguments[10]);
    agoraService.inCallRoom(true);
  }

  listenToOtherUserLeaveCall() {
    closeCall.listen((value) {
      leaveChannel();
      print("Inside Listen $value");
    });
  }

  acceptCall() async {
    agoraService.audio.stop();
    bool incomingCall = Get.arguments[3];
    if (incomingCall) {
      AgoraAnswerCall.answerAgoraCall(
          channelName: channelName.value, startCall: startCall);
    }
    await agoraService.initAgora(appId.value, channelName.value,
        channelToken.value, leaveChannel, userJoin);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    agoraService.inCallRoom(false);
  }

  userJoin() {
    try{
      timer.cancel();
    }catch(e){}
  }

  detectCloseCall() async {
    if (agoraService.inCallRoom.value &&
        (agoraService.appPaused.value || agoraService.userIsLeave.value) &&
        agoraService.usersCountInCall.value == 1 &&
        agoraService.usersInCall.value) {
      leaveChannel();
    }
  }

  leaveChannel() async {
    if (closeTime.value == 0) {
      closeTime.value++;
      if (callFirst.value)
        await AgoraCall.endAgoraCall(
            callerName: userName,
            channelName: channelName,
            resourceId: resourceId.value,
            channelToken: channelToken.value,
            sid: sid.value,
            uId: uId.value,
            endCall: endCall,
            otherDeviceToken: otherUserToken,
            orderId: orderId.value.toString(),
            clientId: clientId.value.toString(),
            companyId: companyId.value.toString());
      callingStatue('call-ended'.tr);
      agoraService.audio.stop();
      userJoin();
      playAudio('voice_call_end');
      await agoraService.leaveChannel();
      Get.back();
    }
  }

  printAllData() {
    print("======================================");
    print("UserName ${userName.value}");
    print("ChannelId ${channelName.value}");
    print("ChannelToken ${channelToken.value}");
    print("OtherUserFCMToken ${otherUserToken.value}");
    print("Recourse Id ${resourceId.value}");
    print("SID ${sid.value}");
    print("UID ${uId.value}");
    print("orderID ${orderId.value}");
    print("clientId ${clientId.value}");
    print("companyId ${companyId.value}");
    print("======================================");
  }

  buildCallingWord() {
    Timer.periodic(Duration(milliseconds: 700), (time) {
      length++;
      if (length == 4) length = 0;
      List point = List.generate(length, (index) => '.');
      callingStatue.value = "calling".tr +
          point
              .toString()
              .replaceAll(",", "")
              .replaceAll('[', "")
              .replaceAll(']', "");
    });
    for (int i = 1; i <= 3; i++) {}
  }

  playAudio(audioName) {
    agoraService.audio.open(Audio('assets/sounds/$audioName.mp3'));
  }
}
