import 'package:get/get.dart';

import 'package:autoservice/app/modules/used_accessories_details/controllers/used_accessories_details_controller.dart';

class UsedAccessoriesDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UsedAccessoriesDetailsController>(
      () => UsedAccessoriesDetailsController(),
    );
  }
}
