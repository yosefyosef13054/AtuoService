import 'package:get/get.dart';

import 'package:autoservice/app/modules/car_detail/controllers/car_detail_controller.dart';

class CarDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CarDetailController>(
      () => CarDetailController(),
    );
  }
}
