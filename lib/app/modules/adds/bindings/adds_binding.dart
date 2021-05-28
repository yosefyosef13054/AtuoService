import 'package:get/get.dart';

import 'package:autoservice/app/modules/adds/controllers/adds_controller.dart';

class AddsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddsController>(
      () => AddsController(),
    );
  }
}
