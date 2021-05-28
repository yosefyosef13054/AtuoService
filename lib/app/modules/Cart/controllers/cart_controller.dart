import 'package:autoservice/app/modules/new_accessories_details/accesoriesDetailsModel.dart';
import 'package:get/get.dart';
import '../../../services/httpService.dart';
import 'package:flutter/material.dart';
import 'package:autoservice/app/modules/accessories/model.dart';

class OrderItems {
  OrderItems({
    this.itemDate,
    this.quntity,
  });

  AccessoriesDetailsModel itemDate;
  int quntity;
}

class CartController extends GetxController {
  //TODO: Implement CartController
//CartController
  final http = Get.find<HttpService>();
  // var listNewAccessoriesCart = List<NewAccessory>().obs;
  var cartItemsList = List<OrderItems>().obs;
  var totalPrice = 0.0.obs;
  final itemscount = 1.obs;

  addtoCart(AccessoriesDetailsModel item) {
    // itemscount.value == 0
    //     ? null
    //     :
    print(cartItemsList.where((e) => e.itemDate.id == item.id).isBlank);

    cartItemsList.where((e) => e.itemDate.id == item.id).isBlank == false
        ? cartItemsList.where((e) => e.itemDate.id == item.id).first.quntity +=
            itemscount.value
        : cartItemsList
            .add(OrderItems(itemDate: item, quntity: itemscount.value));
    itemscount.value = 1;
  }

// init(){
//   for
//   totalPrice.value = cartItemsList.forEach((element) {
//       totalPrice.value += double.parse(element.itemDate.unitPrice.toString());
//     });
// }
//
// total Cost

  void calculatetotalAmount() {
    print('im in');
    totalPrice.value = 0;
    cartItemsList.forEach((product) {
      print('im in foreach');

      totalPrice.value += double.parse(product.itemDate.unitPrice.toString()) *
          double.parse(product.quntity.toString());
      print(totalPrice.value);
    });
  }

  @override
  void onInit() {
    calculatetotalAmount();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
