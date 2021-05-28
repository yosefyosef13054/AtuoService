import 'package:get/get.dart';
import 'package:autoservice/app/services/helper.dart';
import 'package:autoservice/app/modules/drawer_menu/model.dart';
import '../../../services/httpService.dart';
import 'package:dio/dio.dart' as dio;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:autoservice/app/modules/HomeScreen/controllers/home_screen_controller.dart';

class CustomerServicesController extends GetxController {
  //TODO: Implement TermsConditionsController
  final http = Get.find<HttpService>();
  var pushtoken = ''.obs;
  Profile profile;
  var loading = false.obs;
  var homeLoading = false.obs;
  var response;

  void getTerms() async {
    loading.value = true;

    try {
      response = await http.get('DefaultLists/GetHelp');

      // // print(profile.id);
      update();
      loading.value = false;
    } catch (e) {
      getTerms();
      // if (token.value.toString() == null.toString()) {}
      // havetoken();
      // // print(e.response.data);
      //errooor
      // print(e);
    }
  }

  final count = 0.obs;
  @override
  void onInit() {
    getTerms();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }
}
