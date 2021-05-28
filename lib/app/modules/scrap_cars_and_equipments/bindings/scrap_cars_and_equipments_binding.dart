import 'package:get/get.dart';

import 'package:autoservice/app/modules/scrap_cars_and_equipments/controllers/scrap_cars_and_equipments_controller.dart';

class ScrapCarsAndEquipmentsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScrapCarsAndEquipmentsController>(
      () => ScrapCarsAndEquipmentsController(),
    );
  }
}
