import 'package:get/get.dart';

import 'package:autoservice/app/modules/failed_payment/controllers/failed_payment_controller.dart';

class FailedPaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FailedPaymentController>(
      () => FailedPaymentController(),
    );
  }
}
