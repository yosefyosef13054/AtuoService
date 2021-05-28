import 'dart:io';

import 'package:autoservice/app/services/agora_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './app/services/httpService.dart';
import 'package:get/get.dart';
import 'package:autoservice/app/locales/localization.dart';
import 'app/routes/app_pages.dart';
import 'package:autoservice/app/services/helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'dart:async';
import 'dart:collection';
import 'package:autoservice/app/shared/data/api_token.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:autoservice/services/notification_service.dart';
import 'package:autoservice/services/socket_service.dart';

MethodChannel channel = MethodChannel('auto_service.com/voice_call_channel');
Map<String, String> channelMap = {
  "id": "VOICE_CALL",
  "name": "Voice call",
  "description": "Voice call notifications",
};
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initServices();
  String token = "";
  // if (Platform.isAndroid) {
  //   await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);

  //   var swAvailable = await AndroidWebViewFeature.isFeatureSupported(
  //       AndroidWebViewFeature.SERVICE_WORKER_BASIC_USAGE);
  //   var swInterceptAvailable = await AndroidWebViewFeature.isFeatureSupported(
  //       AndroidWebViewFeature.SERVICE_WORKER_SHOULD_INTERCEPT_REQUEST);

  //   if (swAvailable && swInterceptAvailable) {
  //     AndroidServiceWorkerController serviceWorkerController =
  //         AndroidServiceWorkerController.instance();

  //     serviceWorkerController.serviceWorkerClient = AndroidServiceWorkerClient(
  //       shouldInterceptRequest: (request) async {
  //         // print(request);
  //         return null;
  //       },
  //     );
  //   }
  // }
  SharedPreferences prefs = await SharedPreferences.getInstance();
  token = prefs.getString("token");
//  if (Platform.isAndroid) {
//     await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);
//   }
// <<<<<<< HEAD
//   runApp(GetMaterialApp(
//     // theme: ThemeData(
//     //   fontFamily: 'Cairo',
//     // ),
//     // smartManagement: SmartManagement.keepFactory,
//     title: "Application",
//     translationsKeys: LocalizationService.keyss,
//     locale: LocalizationService.locale,

//     fallbackLocale: LocalizationService.fallbackLocale,
//     translations: LocalizationService(),
//     initialRoute: token != null ? AppPages.HomeScreen : AppPages.INITIAL,
//     getPages: AppPages.routes,
//   ));
// =======
  runApp(
    GetMaterialApp(
      theme: ThemeData(fontFamily: 'Cairo'),
      // smartManagement: SmartManagement.keepFactory,
      title: "Application",
      translationsKeys: LocalizationService.keyss,
      debugShowCheckedModeBanner: false,
      locale: LocalizationService.locale,
      fallbackLocale: LocalizationService.fallbackLocale,
      translations: LocalizationService(),
      initialRoute: token != null ? AppPages.HomeScreen : AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
// >>>>>>> de0e979126850f3ce99295a6a7e5016bfb9866d7
}

initServices() async {
  // print('starting services ...');
  APIToken.gatApiToken();
  await Get.putAsync(() => SocketService().init());
  await Get.putAsync(() => AgoraService().init());

  /// Here is where you put get_storage, hive, shared_pref initialization.
  /// or moor connection, or whatever that's async.
  // await Firebase.initializeApp();
  // await Get.putAsync(() => NotificationsService().init());
  await Get.putAsync(() => HttpService().init());
  await Get.putAsync(() => NotificationsService().init());
  await invokeCallChannel();
  // await GetStorage.init();
  // await Get.putAsync(() => SharedService().init());

  // print('All services started...');
}

invokeCallChannel() async {
  try {
    await channel.invokeMethod('createNotificationChannel', channelMap);
  } catch (e) {
    print(e);
  }
}
