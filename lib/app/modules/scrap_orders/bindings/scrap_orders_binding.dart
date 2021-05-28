import 'package:get/get.dart';

import 'package:autoservice/app/modules/scrap_orders/controllers/scrap_orders_controller.dart';

class ScrapOrdersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScrapOrdersController>(
      () => ScrapOrdersController(),
    );
  }
}
