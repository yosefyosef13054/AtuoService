import 'package:get/get.dart';

import 'package:autoservice/app/modules/fullinsurance_offers_details/controllers/fullinsurance_offers_details_controller.dart';

class FullinsuranceOffersDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FullinsuranceOffersDetailsController>(
      () => FullinsuranceOffersDetailsController(),
    );
  }
}
