import 'package:get/get.dart';

import 'package:autoservice/app/modules/cars_services/controllers/cars_services_controller.dart';

class CarsServicesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CarsServicesController>(
      () => CarsServicesController(),
    );
  }
}
