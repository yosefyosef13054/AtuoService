import 'package:get/get.dart';

import '../controllers/myfavorite_controller.dart';

class MyfavoriteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyfavoriteController>(
      () => MyfavoriteController(),
    );
  }
}
