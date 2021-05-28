import 'package:get/get.dart';

import 'package:autoservice/app/modules/cars_insurance/controllers/cars_insurance_controller.dart';

class CarsInsuranceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CarsInsuranceController>(
      () => CarsInsuranceController(),
    );
  }
}
