import 'package:get/get.dart';

import 'package:autoservice/app/modules/new_accessories/controllers/new_accessories_controller.dart';

class NewAccessoriesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewAccessoriesController>(
      () => NewAccessoriesController(),
    );
  }
}
