import 'dart:async';

import 'package:autoservice/app/modules/call/controllers/call_controller.dart';
import 'package:autoservice/app/modules/chat/controllers/record/record_audio.dart';
import 'package:autoservice/app/modules/chat/controllers/record/record_audio.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:flutter/material.dart';

// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'dart:math';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

RtcEngine _engine = null;

class AgoraService extends GetxService {
  RxBool isJoined = false.obs,
      openMicrophone = true.obs,
      enableSpeakerphone = false.obs,
      mute = false.obs,
      inCallRoom = false.obs,
      userIsLeave = false.obs,
      appPaused = false.obs,
      usersInCall = false.obs,
      playEffect = false.obs;
  int uid;
  RxInt usersCountInCall = 0.obs;
  // Timer timer;

  final StopWatchTimer stopWatchTimer = StopWatchTimer();

  AssetsAudioPlayer audio = AssetsAudioPlayer();

  void dispose() {
    _engine?.destroy();
  }

  Future<AgoraService> init() async {
    print('Agora Initiated ...');

    return this;
  }

  // Initialize the app
  Future<void> initAgora(appId, channelId, channelToken, Function closeCall,
      Function userJoin) async {
    // Get microphone permission
    await RecordAudio.checkPermission();

    uid = new Random().nextInt(1000);

    // Create RTC client instance
    _engine = await RtcEngine.createWithConfig(RtcEngineConfig(appId));

    this._addListeners(closeCall, userJoin);

    await _engine.enableAudio();
    await _engine.setChannelProfile(ChannelProfile.LiveBroadcasting);
    await _engine.setClientRole(ClientRole.Broadcaster);
    await joinChannel(channelId, channelToken);
  }

  _addListeners(Function closeCall, Function userJoin) {
    _engine?.setEventHandler(RtcEngineEventHandler(
      joinChannelSuccess: (channel, uid, elapsed) {
        print('joinChannelSuccess $channel $uid $elapsed');
        isJoined.value = true;
      },
      leaveChannel: (stats) {
        print('leaveChannel ${stats.toJson()}');
        isJoined.value = false;
      },
      error: (stats) {
        print("ErrorWhenJoinChannel $stats");
      },
      userJoined: (userNumber, user) {
        audio.stop();
        usersInCall(true);
        stopWatchTimer.onExecute.add(StopWatchExecute.start);
        userJoin();
      },
      userOffline: (num, user) {
        print("User is leavvvvve");
        print(num);
        print(user.index);
        userIsLeave(true);
      },
      rtcStats: (rtc) {
        print("usersInChannel ${rtc.users}");

        usersCountInCall.value = rtc.users;

        print(
            "InCallRoom ${inCallRoom.value}  appPaused ${appPaused.value}   userIsLeave ${userIsLeave.value}   rtc.users ${rtc.users}  usersInCall ${usersInCall.value} ");
        print(inCallRoom.value &&
            appPaused.value &&
            userIsLeave.value &&
            rtc.users == 1 &&
            usersInCall.value);
        if (inCallRoom.value &&
            appPaused.value &&
            userIsLeave.value &&
            rtc.users == 1 &&
            usersInCall.value) {
          print("Done Alll");
          closeCall();
        }
      },
    ));
  }

  joinChannel(channelId, channelToken) async {
    await _engine?.joinChannel(channelToken, channelId, null, uid);
  }

  leaveChannel() async {
    usersInCall(false);
    mute(false);
    enableSpeakerphone(false);
    stopWatchTimer.onExecute.add(StopWatchExecute.reset);
    await _engine?.leaveChannel();
  }

  switchMicrophone() {
    _engine?.enableLocalAudio(!openMicrophone.value)?.then((value) {
      openMicrophone.value = !openMicrophone.value;
    })?.catchError((err) {
      print('enableLocalAudio $err');
    });
  }

  switchSpeakerphone() {
    _engine?.setEnableSpeakerphone(enableSpeakerphone.value)?.then((value) {
      enableSpeakerphone.value = !enableSpeakerphone.value;
    })?.catchError((err) {
      print('setEnableSpeakerphone $err');
    });
  }

  setMute() {
    _engine?.muteLocalAudioStream(!mute.value)?.then((value) {
      mute.value = !mute.value;
    })?.catchError((err) {
      print('setMute $err');
    });
  }

// switchEffect() async {
//   if (playEffect.value) {
//     _engine?.stopEffect(1)?.then((value) {
//       playEffect.value = false;
//     })?.catchError((err) {
//       print('stopEffect $err');
//     });
//   } else {
//     _engine
//         ?.playEffect(
//             1,
//             await RtcEngineExtension.getAssetAbsolutePath(
//                 "assets/Sound_Horizon.mp3"),
//             -1,
//             1,
//             1,
//             100,
//             true)
//         ?.then((value) {
//       playEffect.value = true;
//     })?.catchError((err) {
//       print('playEffect $err');
//     });
//   }
// }
}
