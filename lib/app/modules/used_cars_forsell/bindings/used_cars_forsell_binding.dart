import 'package:get/get.dart';

import 'package:autoservice/app/modules/used_cars_forsell/controllers/used_cars_forsell_controller.dart';

class UsedCarsForsellBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UsedCarsForsellController>(
      () => UsedCarsForsellController(),
    );
  }
}
