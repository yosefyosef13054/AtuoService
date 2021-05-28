import 'package:autoservice/app/modules/new_accessories_details/accesoriesDetailsModel.dart';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../services/httpService.dart';
import 'package:autoservice/app/modules/usedCars_add/models/model.dart';
import 'package:autoservice/app/modules/accessories/model.dart';
import 'package:autoservice/app/modules/new_accessories/model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:autoservice/app/modules/Cart/controllers/cart_controller.dart';

class NewAccessoriesDetailsController extends GetxController {
  //TODO: Implement NewAccessoriesDetailsController
  final CartController cartController = Get.put(CartController());
  var isbackFavoriteScreen = false.obs;
  var is_home_go_To_acc = false.obs;

  final http = Get.find<HttpService>();
  final count = 0.obs;
  var isfavorite = false.obs;
  var id = ''.obs;
  var startAnimate = true.obs;
  var animatePositioned = true.obs;
  var animateCart = true.obs;

  void addORremoveFav(id) async {
    print(http.apiToken);

    isfavorite.value = !isfavorite.value;
    try {
      var response =
          await http.get('ShopProduct/SetFavorite?id=${id.toString()}');
      print(response.data['message']);

      Fluttertoast.showToast(
          msg: isfavorite.value == true ? 'addedToFav'.tr : 'removedToFav'.tr,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 0,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
    } catch (e) {}
  }

  var loading = false.obs;
  AccessoriesDetailsModel accessoriesDetailsModel;
  void getProductDetails() async {
    loading.value = true;
    isbackFavoriteScreen.value = Get.arguments['back_to_favoriteScreen'];
    is_home_go_To_acc.value = Get.arguments['is_home_go_To_acc'];

    print('test im in function');
    id.value = Get.arguments['id'].toString();
    try {
      var response =
          await http.get('ShopProduct/GetProductDetails?Id=${id.value}');
      accessoriesDetailsModel =
          await AccessoriesDetailsModel.fromJson(response.data);
      isfavorite.value = accessoriesDetailsModel.isFavorite;

      loading.value = false;
    } catch (e) {}
  }

  @override
  void onInit() {
    getProductDetails();
    cartController.itemscount.value = 1;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    NewAccessoriesDetailsController().dispose();
  }

  void increment() => count.value++;
}
