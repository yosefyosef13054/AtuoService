import 'package:get/get.dart';

import 'package:autoservice/app/modules/scrap_add/controllers/scrap_add_controller.dart';

class ScrapAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScrapAddController>(
      () => ScrapAddController(),
    );
  }
}
