import 'package:get/get.dart';

import 'package:autoservice/app/modules/spareParts/controllers/spare_parts_controller.dart';

class SparePartsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SparePartsController>(
      () => SparePartsController(),
    );
  }
}
