import 'package:get/get.dart';

import 'package:autoservice/app/modules/drawer_menu/controllers/drawer_menu_controller.dart';

class DrawerMenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<DrawerMenuController>(
      DrawerMenuController(),
    );
  }
}
