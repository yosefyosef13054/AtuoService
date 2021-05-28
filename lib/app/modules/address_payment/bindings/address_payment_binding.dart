import 'package:get/get.dart';

import 'package:autoservice/app/modules/address_payment/controllers/address_payment_controller.dart';

class AddressPaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddressPaymentController>(
      () => AddressPaymentController(),
    );
  }
}
