import 'package:get/get.dart';

import 'package:autoservice/app/modules/accessories/controllers/accessories_controller.dart';

class AccessoriesBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AccessoriesController>(
      AccessoriesController(),
    );
  }
}
