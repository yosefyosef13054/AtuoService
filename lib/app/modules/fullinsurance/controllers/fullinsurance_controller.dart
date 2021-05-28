import 'package:get/get.dart';

class FullinsuranceController extends GetxController {
  //TODO: Implement FullinsuranceController

  // final count = 0.obs;
  var page = true.obs;

  void changePage(value) {
    page.value = value;
    // print(value);
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  // void increment() => count.value++;
}
