import 'package:get/get.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class SplashScreenController extends GetxController {
  //TODO: Implement SplashScreenController

  final count = 0.obs;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  @override
  void onInit() {
    Future.delayed(Duration(seconds: 3), () {
      Get.offNamed('/home-screen');
    });
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
