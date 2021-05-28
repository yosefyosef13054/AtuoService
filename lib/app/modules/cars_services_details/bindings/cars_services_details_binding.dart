import 'package:get/get.dart';

import 'package:autoservice/app/modules/cars_services_details/controllers/cars_services_details_controller.dart';

class CarsServicesDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CarsServicesDetailsController>(
      () => CarsServicesDetailsController(),
    );
  }
}
