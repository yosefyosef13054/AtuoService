import 'package:get/get.dart';

import '../controllers/service_time_controller.dart';

class ServiceTimeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ServiceTimeController>(
      () => ServiceTimeController(),
    );
  }
}
