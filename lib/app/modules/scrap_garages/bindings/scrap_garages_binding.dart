import 'package:get/get.dart';

import 'package:autoservice/app/modules/scrap_garages/controllers/scrap_garages_controller.dart';

class ScrapGaragesBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ScrapGaragesController>(
      ScrapGaragesController(),
    );
  }
}
