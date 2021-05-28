import 'package:get/get.dart';

import '../controllers/my_adds_controller.dart';

class MyAddsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<MyAddsController>(
      MyAddsController(),
    );
  }
}
