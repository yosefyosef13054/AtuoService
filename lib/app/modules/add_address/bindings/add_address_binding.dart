import 'package:get/get.dart';

import 'package:autoservice/app/modules/add_address/controllers/add_address_controller.dart';

class AddAddressBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddAddressController>(
      () => AddAddressController(),
    );
  }
}
