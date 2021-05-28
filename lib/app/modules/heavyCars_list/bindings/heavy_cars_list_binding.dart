import 'package:get/get.dart';

import 'package:autoservice/app/modules/heavyCars_list/controllers/heavy_cars_list_controller.dart';

class HeavyCarsListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HeavyCarsListController>(
      () => HeavyCarsListController(),
    );
  }
}
