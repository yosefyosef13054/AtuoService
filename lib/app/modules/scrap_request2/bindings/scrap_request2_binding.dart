import 'package:get/get.dart';

import 'package:autoservice/app/modules/scrap_request2/controllers/scrap_request2_controller.dart';

class ScrapRequest2Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScrapRequest2Controller>(
      () => ScrapRequest2Controller(),
    );
  }
}
