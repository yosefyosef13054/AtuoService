import 'package:get/get.dart';

import '../controllers/customer_services_controller.dart';

class CustomerServicesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustomerServicesController>(
      () => CustomerServicesController(),
    );
  }
}
