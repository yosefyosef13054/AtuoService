import 'package:get/get.dart';

import 'package:autoservice/app/modules/scrap_request/controllers/scrap_request_controller.dart';

class ScrapRequestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScrapRequestController>(
      () => ScrapRequestController(),
    );
  }
}
