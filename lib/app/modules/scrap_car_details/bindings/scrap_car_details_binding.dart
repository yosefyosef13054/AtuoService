import 'package:get/get.dart';

import 'package:autoservice/app/modules/scrap_car_details/controllers/scrap_car_details_controller.dart';

class ScrapCarDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScrapCarDetailsController>(
      () => ScrapCarDetailsController(),
    );
  }
}
