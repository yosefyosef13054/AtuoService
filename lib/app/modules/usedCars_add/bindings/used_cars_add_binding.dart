import 'package:get/get.dart';

import 'package:autoservice/app/modules/usedCars_add/controllers/used_cars_add_controller.dart';

class UsedCarsAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UsedCarsAddController>(
      () => UsedCarsAddController(),
    );
  }
}
