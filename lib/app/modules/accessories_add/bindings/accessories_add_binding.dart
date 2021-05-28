import 'package:get/get.dart';

import 'package:autoservice/app/modules/accessories_add/controllers/accessories_add_controller.dart';

class AccessoriesAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccessoriesAddController>(
      () => AccessoriesAddController(),
    );
  }
}
