import 'package:get/get.dart';

import '../controllers/web_view_in_a_p_p_controller.dart';

class WebViewInAPPBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WebViewInAPPController>(
      () => WebViewInAPPController(),
    );
  }
}
