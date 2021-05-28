import 'package:get/get.dart';

import 'package:autoservice/app/modules/fullinsurance/controllers/fullinsurance_controller.dart';

class FullinsuranceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FullinsuranceController>(
      () => FullinsuranceController(),
    );
  }
}
