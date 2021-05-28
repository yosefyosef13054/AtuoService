import 'package:get/get.dart';

import '../controllers/sittings_controller.dart';

class SittingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SittingsController>(
      () => SittingsController(),
    );
  }
}
