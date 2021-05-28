import 'package:get/get.dart';

import 'package:autoservice/app/modules/heavy_cars/controllers/heavy_cars_controller.dart';

class HeavyCarsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HeavyCarsController>(
      () => HeavyCarsController(),
    );
  }
}
