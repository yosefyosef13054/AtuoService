import 'package:get/get.dart';

import 'package:autoservice/app/modules/bdalah/controllers/bdalah_controller.dart';

class BdalahBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<BdalahController>(
      BdalahController(),
    );
  }
}
