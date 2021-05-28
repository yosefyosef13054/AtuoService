import 'package:get/get.dart';

import 'package:autoservice/app/modules/payment_success/controllers/payment_success_controller.dart';

class PaymentSuccessBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<PaymentSuccessController>(
      PaymentSuccessController(),
    );
  }
}
