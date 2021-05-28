import 'package:get/get.dart';

import '../controllers/webview_screen_controller.dart';

class WebviewScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WebviewScreenController>(
      () => WebviewScreenController(),
    );
  }
}
