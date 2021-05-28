import 'package:get/get.dart';

import 'package:autoservice/app/modules/new_accessories_details/controllers/new_accessories_details_controller.dart';

class NewAccessoriesDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewAccessoriesDetailsController>(
      () => NewAccessoriesDetailsController(),
    );
  }
}
