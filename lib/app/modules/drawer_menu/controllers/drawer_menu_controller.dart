import 'package:get/get.dart';
import 'package:autoservice/app/services/helper.dart';
import 'package:autoservice/app/modules/drawer_menu/model.dart';
import '../../../services/httpService.dart';
import 'package:dio/dio.dart' as dio;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:autoservice/app/modules/HomeScreen/controllers/home_screen_controller.dart';

class DrawerMenuController extends GetxController {
  final HomeScreenController homecontroller = Get.put(HomeScreenController());
  // //TODO: Implement DrawerMenuController
  // final http = Get.find<HttpService>();

  // Profile profile;
  // var loading = false.obs;
  // var token = ''.obs;
  // void havetoken() async {
  //   loading.value = true;
  //   token.value = await getToken();

  //   try {
  //     var response = await http.get('Client/GetClient');
  //     profile = Profile.fromJson(response.data);
  //     // print(profile.id);
  //     update();
  //     loading.value = false;
  //   } catch (e) {
  //     loading.value = false;

  //     // // print(e.response.data);
  //     //errooor
  //     // print(e);
  //   }
  // }

  // void logout() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.remove("token");
  //   Get.offNamed('/sign-in');
  // }

  @override
  void onInit() {
    // homecontroller.token.value.toString() == null.toString() ||
    //         homecontroller.loading.value == true
    //     ? homecontroller.havetoken()
    //     : null;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  // @override
  // void onClose() {}
}
