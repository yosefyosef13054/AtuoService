import 'package:get/get.dart';

import 'package:autoservice/app/modules/used_accessories/controllers/used_accessories_controller.dart';

class UsedAccessoriesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UsedAccessoriesController>(
      () => UsedAccessoriesController(),
    );
  }
}
