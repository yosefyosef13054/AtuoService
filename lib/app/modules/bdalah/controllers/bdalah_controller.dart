import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:autoservice/app/modules/scrap_orders/model.dart';

import '../../../services/httpService.dart';

class BdalahController extends GetxController {
  //TODO: Implement BdalahController

  final http = Get.find<HttpService>();

  //paginate
  //pagenation
  var response;

  var pageNumber = 0.obs;
  var loading = false.obs;

  var paginate = false.obs;
  void getbdalah() async {
    loading.value = true;

    try {
      response = await http.get('DefaultLists/GetWinches');
      print(response);
      // area == 0 ? await garages.clear() : null;

      loading.value = false;

      //  area != 0 ? loading.value = false : paginate.value = false;
    } catch (e) {
      // print(e.response.data);
      //errooor
      print(e);
      // getbdalah();
    }
    update();
  }

  final count = 0.obs;
  @override
  void onInit() {
    getbdalah();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
