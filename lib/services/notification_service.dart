// import 'package:auto_service_manager/app/services/socket_service.dart';
import 'package:autoservice/app/modules/call/controllers/call_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:autoservice/app/modules/chat/controllers/chat_controller.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'dart:convert';

Future onBackgroundHandler(event) async {
  await Firebase.initializeApp();

  return null;
}

class NotificationsService extends GetxService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  String messageTittle, messageBody, payload;
  Map decodePrivateData;
  String pushToken;
  int activeTypeNumber;

  Future<NotificationsService> init() async {
    var initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettingsIOS = IOSInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification:
          (int id, String title, String body, String payload) async {},
    );
    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid,iOS: initializationSettingsIOS);
    _flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);

    _flutterLocalNotificationsPlugin.cancelAll();

    // print('Notification Intiated ...');
    return this;
  }

  Future setupNotifications() async {
    _firebaseMessaging.subscribeToTopic('all');
    _firebaseMessaging.subscribeToTopic('user');

    pushToken = await _firebaseMessaging.getToken();

    _firebaseMessaging.configure(onMessage: (data) {
      messageTittle = data['data']['title'];
      messageBody = data['data']['body'];
      decodePrivateData = json.decode(data['data']['privateData']);

      Map allDataAboutNotifyJson = {
        'type': decodePrivateData['type'],
        'id': decodePrivateData['id'],
        'chatUser': decodePrivateData['chatUser'],
        'userId': decodePrivateData['userId'],
        'callerName': decodePrivateData['callerName'],
        'channelName': decodePrivateData['channelName'],
        'channelToken': decodePrivateData['channelToken'],
        'callerDeviceToken': decodePrivateData['callerDeviceToken'],
        'clientId': decodePrivateData['clientId'],
        'companyId': decodePrivateData['companyId'],
        'orderId': decodePrivateData['orderId'],
        'resourceId': decodePrivateData['resourceId'],
        'sid': decodePrivateData['sid'],
        'uId': decodePrivateData['uId'],
      };
      payload = json.encode(allDataAboutNotifyJson);
      print(json.encode(data));
      if (decodePrivateData['type'] != '5')
        showNotification(messageTittle, messageBody, payload,
            sound: "sound",
            channelId: "general_notification",
            channelName: "GENERAL",
            channelDesc: 'general channel');
      if (decodePrivateData['type'] == '5') onSelectNotification(payload);

      if (decodePrivateData['type'] == "4") {
        final controller = Get.find<CallController>();
        controller.callFirst.value = false;
        controller.closeCall.value = !controller.closeCall.value;
      }
      return null;
    }, //onLaunch
        onLaunch: (data) {
      whenAppOpened(data);
      return null;
    }, //onResume
        onResume: (data) {
      whenAppOpened(data);
      return null;
    });

    print(pushToken);
    return pushToken;
  }

  whenAppOpened(data) {
    decodePrivateData = json.decode(data['data']['privateData']);

    Map allDataAboutNotifyJson = {
      'type': decodePrivateData['type'],
      'id': decodePrivateData['id'],
      'chatUser': decodePrivateData['chatUser'],
      'userId': decodePrivateData['userId'],
      'callerName': decodePrivateData['callerName'],
      'channelToken': decodePrivateData['channelToken'],
      'channelName': decodePrivateData['channelName'],
      'callerDeviceToken': decodePrivateData['callerDeviceToken'],
      'clientId': decodePrivateData['clientId'],
      'companyId': decodePrivateData['companyId'],
      'orderId': decodePrivateData['orderId'],
      'resourceId': decodePrivateData['resourceId'],
      'sid': decodePrivateData['sid'],
      'uId': decodePrivateData['uId'],
    };
    payload = json.encode(allDataAboutNotifyJson);
    onSelectNotification(payload);
    if (decodePrivateData['type'] == "4") {
      final controller = Get.find<CallController>();
      controller.callFirst.value = false;
      controller.closeCall.value = !controller.closeCall.value;
    }
  }
}

showNotification(tittle, message, filterData,
    {sound, channelId, channelName, channelDesc}) async {
  var android = new AndroidNotificationDetails(
      channelId, channelName, channelDesc,
      priority: Priority.high,
      importance: Importance.max,
      sound: RawResourceAndroidNotificationSound(sound));
  var iOS = new IOSNotificationDetails(sound: '$sound.mp3');
  var platform = new NotificationDetails(android:android, iOS:iOS);
  await FlutterLocalNotificationsPlugin()
      .show(0, '$tittle', '$message', platform, payload: filterData);
}

Future onSelectNotification(String payload) async {
  Map fetchAllData = {
    'type': json.decode(payload)['type'],
    'id': json.decode(payload)['id'],
    'chatUser': json.decode(payload)['chatUser'],
    'userId': json.decode(payload)['userId'],
    'callerName': json.decode(payload)['callerName'],
    'channelName': json.decode(payload)['channelName'],
    'channelToken': json.decode(payload)['channelToken'],
    'callerDeviceToken': json.decode(payload)['callerDeviceToken'],
    'clientId': json.decode(payload)['clientId'],
    'companyId': json.decode(payload)['companyId'],
    'orderId': json.decode(payload)['orderId'],
    'resourceId': json.decode(payload)['resourceId'],
    'sid': json.decode(payload)['sid'],
    'uId': json.decode(payload)['uId'],
  };
  print("All Data Fetched is $fetchAllData");
  if (payload != null) {
    if (fetchAllData['type'] == '6') {
      Get.toNamed('/chat', arguments: {
        'orderId': fetchAllData['orderId'],
        'otherName': fetchAllData['chatUser'],
      });
      // print(carInfoModel);
    }
    if (fetchAllData['type'] == '5') {
      print("This is tokeen ya bassshaa ${fetchAllData['callerDeviceToken']}");
      Get.toNamed('/call', arguments: [
        fetchAllData['channelToken'],
        fetchAllData['channelName'],
        fetchAllData['callerName'],
        true,
        fetchAllData['callerDeviceToken'],
        fetchAllData['resourceId'],
        fetchAllData['sid'],
        fetchAllData['uId'],
        fetchAllData['clientId'],
        fetchAllData['companyId'],
        fetchAllData['orderId'],
      ]);
    }
  }
}
