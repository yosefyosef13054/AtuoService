import 'package:get/get.dart';

import 'package:autoservice/app/modules/scrap_delivery_request/controllers/scrap_delivery_request_controller.dart';

class ScrapDeliveryRequestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScrapDeliveryRequestController>(
      () => ScrapDeliveryRequestController(),
    );
  }
}
