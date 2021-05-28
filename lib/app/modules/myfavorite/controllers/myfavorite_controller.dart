import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../../services/httpService.dart';
import 'package:flutter/cupertino.dart';

import 'package:autoservice/app/modules/accessories/model.dart';

class ChoosenList {
  ChoosenList({this.id, this.name, this.type
      // this.regionNameAr,
      // this.regionNameEn,
      });

  int id;
  String name;
  String type;

  // String regionNameAr;
  // String regionNameEn;
}

class MyfavoriteController extends GetxController {
  final http = Get.find<HttpService>();
  var pageNumber = 0.obs;
  var loading = false.obs;
  var emtyList = {
    "id": 0,
    "title": "empty",
    "titleAr": "empty",
    "titleEn": "empty",
    "type": "empty",
    "action": null
  };
  var paginate = false.obs;
  void addORremoveFav(id) async {
    try {
      var response =
          await http.get('ShopProduct/SetFavorite?id=${id.toString()}');
      print(response.data['message']);

      Fluttertoast.showToast(
          msg: 'removedToFav'.tr,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 0,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
    } catch (e) {}
  }

  ScrollController scrollController = new ScrollController();
  var accessoriesList = List<NewAccessory>().obs;

  void getRequestsListPagination({index}) async {
    loading.value = index == 0 ? true : false;
    paginate.value = index == 0 ? false : true;

    try {
      var response = await http
          .get('ShopProduct/GetFavorite?pageIndex=${index}&pageSize=20');
      print(response.data);
      for (var json in response.data) {
        List images = [];

        //   images.addAll(items['images']);

        accessoriesList.contains(NewAccessory(
                  id: json["id"],
                  categoryId: json["categoryId"],
                  categoryName: json["categoryName"],
                  productNameEn: json["productNameEn"],
                  productNameAr: json["productNameAr"],
                  productName: json["productName"],
                  descriptionEn: json["descriptionEn"],
                  descriptionAr: json["descriptionAr"],
                  description: json["description"],
                  unitPrice: json["unitPrice"].toDouble(),
                  deleted: json["deleted"],
                  isActive: json["isActive"],
                  shopCompanyId: json["shopCompanyId"],
                  imageId: json["imageId"],
                  imageUrl: json["imageURL"],
                  shopCompanyName: json["shopCompanyName"],
                  approvalStatus: json["approvalStatus"],
                  lastModifiedDate: DateTime.parse(json["lastModifiedDate"]),
                  models: json["models"],
                  // images: json["images"],
                )) ==
                true
            ? null
            : accessoriesList.add(NewAccessory(
                id: json["id"],
                categoryId: json["categoryId"],
                categoryName: json["categoryName"],
                productNameEn: json["productNameEn"],
                productNameAr: json["productNameAr"],
                productName: json["productName"],
                descriptionEn: json["descriptionEn"],
                descriptionAr: json["descriptionAr"],
                description: json["description"],
                unitPrice: json["unitPrice"].toDouble(),
                deleted: json["deleted"],
                isActive: json["isActive"],
                shopCompanyId: json["shopCompanyId"],
                imageId: json["imageId"],
                imageUrl: json["imageURL"],
                shopCompanyName: json["shopCompanyName"],
                approvalStatus: json["approvalStatus"],
                lastModifiedDate: DateTime.parse(json["lastModifiedDate"]),
                models: json["models"],
                // images: json["images"],
              ));
      }
      // print(response.data);

      // if (accessoriesList.isBlank) {}
      loading.value = index == 0 ? false : false;
      paginate.value = index == 0 ? false : false;
    } catch (e) {
      // // print(e.response.data);
      //errooor
      // print(e);
      loading.value = index == 0 ? false : false;
      paginate.value = index == 0 ? false : false;
    }
    // await getcarYears(carModels[0].id);
    update();
  }

//Car Items

  @override
  void onInit() {
    getRequestsListPagination(index: 0);
    Future.delayed(Duration.zero, () {
      scrollController.addListener(() async {
        if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) {
          pageNumber.value += 1;

          getRequestsListPagination(
            index: pageNumber.value,
          );
        }
      });
    });
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
