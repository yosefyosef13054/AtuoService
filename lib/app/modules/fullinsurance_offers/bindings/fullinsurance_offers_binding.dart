import 'package:get/get.dart';

import 'package:autoservice/app/modules/fullinsurance_offers/controllers/fullinsurance_offers_controller.dart';

class FullinsuranceOffersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FullinsuranceOffersController>(
      () => FullinsuranceOffersController(),
    );
  }
}
