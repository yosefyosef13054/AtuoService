import 'package:get/get.dart';

import 'package:autoservice/app/modules/heavyCars_add/controllers/heavy_cars_add_controller.dart';

class HeavyCarsAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HeavyCarsAddController>(
      () => HeavyCarsAddController(),
    );
  }
}
