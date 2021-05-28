import 'package:get/get.dart';

import 'package:autoservice/app/modules/againest_insurance/controllers/againest_insurance_controller.dart';

class AgainestInsuranceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AgainestInsuranceController>(
      () => AgainestInsuranceController(),
    );
  }
}
