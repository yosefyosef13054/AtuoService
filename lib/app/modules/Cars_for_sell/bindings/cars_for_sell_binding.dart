import 'package:get/get.dart';

import 'package:autoservice/app/modules/Cars_for_sell/controllers/cars_for_sell_controller.dart';

class CarsForSellBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CarsForSellController>(
      () => CarsForSellController(),
    );
  }
}
