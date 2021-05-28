import 'dart:io';

import 'package:autoservice/app/Colors.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart' as flutter;
import 'package:get/get.dart';
import 'package:autoservice/app/services/helper.dart';
import 'package:autoservice/app/modules/drawer_menu/model.dart';
import '../../../services/httpService.dart';
import 'package:dio/dio.dart' as dio;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:autoservice/app/modules/HomeScreen/model.dart';
import 'package:autoservice/services/notification_service.dart';
import 'package:autoservice/services/socket_service.dart';

class HomeScreenController extends GetxController {
  //TODO: Implement DrawerMenuController
  final http = Get.find<HttpService>();
  final socketService = Get.find<SocketService>();
  final notificationService = Get.find<NotificationsService>();
  var pushtoken = ''.obs;
  Profile profile;
  var loading = false.obs;
  var homeLoading = false.obs;
  var token = ''.obs;
  void havetoken() async {
    loading.value = true;

    try {
      token.value =
          Get.arguments != null ? Get.arguments['token'] : await getToken();

      var response = await http.get('Client/GetClient');
      profile = await Profile.fromJson(response.data);
      // // print(profile.id);
      update();
      await connectToSocket();
      pushtoken.value = await NotificationsService().setupNotifications();
      loading.value = false;
    } catch (e) {
      print(e);

      havetoken();
    }
  }

  void refreshFcmToken() async {
    final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
    String pushToken;
    pushToken = await _firebaseMessaging.getToken();
    http
        .postUrl('Client/changeFCMTokken?token=$pushToken', {}, true)
        .then((response) {
      print(response);
      print('tokeeeeeeeeeeeen refresh');
      print(pushToken);
      try {} catch (e) {
        print(e);
      }
    }).catchError((onError) {});
  }

  connectToSocket() {
    socketService.initSocket(profile.id.toString());
    notificationService.setupNotifications();
  }

  var homeDataList = HomeScreemModel().obs;
  // ignore: deprecated_member_use
  var topSlider = List<Slider>().obs;
  // ignore: deprecated_member_use
  var bottomSlider = List<Slider>().obs;
  // ignore: deprecated_member_use
  var usedCars = List<UsedCar>().obs;
  var newAccessories = List<NewAccessory>().obs;

  void getDAta() async {
    homeLoading.value = true;

    try {
      var response = await http.get('Mobile/GetHome');

      print(response.data);
      homeDataList.value = HomeScreemModel.fromJson(response.data);
      print(homeDataList.value.newAccessories.length);
      homeLoading.value = false;
    } catch (e) {
      getDAta();
      // homeLoading.value = false;

      // print(e);
    }
  }

  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove("token");
    profile = null;
    token.value = null;
    // print(token);

    update();
    Get.offAllNamed('/sign-in');
  }

  connectionCheck(context) async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        // Navigator.pop(context);
      }
    } on SocketException catch (_) {
      flutter.showDialog(
        context: context,
        builder: (context) => TestInternetAlert(
          ontab: () async {
            try {
              final result = await InternetAddress.lookup('google.com');
              if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
                // Navigator.popAndPushNamed(context, homePage.routeName);
              }
            } on SocketException catch (_) {
              try {
                final result = await InternetAddress.lookup('google.com');
                if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
//Navigator.popAndPushNamed(context, homePage.routeName);
                }
              } on SocketException catch (_) {}
              // print('not connected');
            }
          },
        ),
      );
    }
  }

  @override
  void onInit() {
    refreshFcmToken();
    havetoken();
    getDAta();

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}

class TestInternetAlert extends flutter.StatelessWidget {
  TestInternetAlert({
    this.ontab,
  });
  Function ontab;
  @override
  flutter.Widget build(flutter.BuildContext context) {
    return flutter.AlertDialog(
      content: flutter.Container(
        height: 120,
        decoration: flutter.BoxDecoration(
          borderRadius: flutter.BorderRadius.circular(20.00),
        ),
        //  borderRadius: BorderRadius.circular(10)),
        child: flutter.Column(
          children: <flutter.Widget>[
            flutter.Container(
              child: flutter.Text('There is No Connection'),
            ),
            flutter.Spacer(),
            FloatingContinueButton(
              title: 'Retry',
              ontab: ontab,
            )
          ],
        ),
      ),
    );
  }
}

class FloatingContinueButton extends flutter.StatelessWidget {
  const FloatingContinueButton({
    this.title,
    this.ontab,
  });

  final title;
  final Function ontab;
  @override
  flutter.Widget build(flutter.BuildContext context) {
    return flutter.InkWell(
      onTap: ontab,
      child: flutter.Container(
        padding: flutter.EdgeInsets.all(10),
        height: 45,
        width: 140,
        // padding: EdgeInsets.all(20),
        // margin: EdgeInsets.symmetric(horizontal: 60),
        decoration: flutter.BoxDecoration(
            borderRadius:
                flutter.BorderRadius.all(flutter.Radius.circular(10.0)),
            color: AppColors.primaryColor,
            shape: flutter.BoxShape.rectangle),
        child: flutter.Center(
            child: flutter.Text(
          title
          // 'Continue  > >'
          ,
          style: flutter.TextStyle(
              color: flutter.Colors.white, fontWeight: flutter.FontWeight.bold),
        )),
      ),
    );
  }
}
