import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:autoservice/app/modules/scrap_orders/model.dart';

import '../../../services/httpService.dart';

class ScrapGaragesController extends GetxController {
  //TODO: Implement ScrapGaragesController

  final http = Get.find<HttpService>();

  //paginate
  //pagenation
  var garages = List<Company>().obs;
  var response;
  var id = ''.obs;
  var pageNumber = 0.obs;
  var loading = false.obs;
  ScrollController scrollController = new ScrollController();
  var paginate = false.obs;
  void getRequestsListPagination({index}) async {
    loading.value = pageNumber.value == 0 ? true : false;
    paginate.value = true;
    var id = Get.arguments['id'];
    try {
      response = await http.get('ScrapOrders/GetById?id=${id.toString()}');

      // print(response);
      // area == 0 ? await garages.clear() : null;
      print(response);
      for (var json in response.data['companies']) {
        garages.contains(Company(
                  id: json["id"].toString(),
                  scrapLocationId: json["scrapLocationId"].toString(),
                  orderId: json["orderId"].toString(),
                  companyUniqueId: json["companyUniqueId"].toString(),
                  companyFcmToken: json["companyFCMToken"].toString(),
                  scrapLocationName: json["scrapLocationName"].toString(),
                  userId: json["userId"].toString(),
                  lastModifiedDate: DateTime.parse(json["lastModifiedDate"]),
                  userName: json["userName"].toString(),
                  companyNameEn: json["companyNameEn"].toString(),
                  companyNameAr: json["companyNameAr"].toString(),
                  companyName: json["companyName"].toString(),
                  arrange: json["arrange"].toString(),
                  commotionPercent: json["commotionPercent"].toString(),
                  smsPhone: json["smsPhone"].toString(),
                  phone: json["phone"].toString(),
                  status: json["status"].toString(),
                  imageUrl: json["imageURL"].toString(),
                  createdDate: DateTime.parse(json["createdDate"]),
                  userAccount: json["userAccount"].toString(),
                  specialties: json["specialties"].toString(),
                  models: json["models"].toString(),
                )) ==
                true
            ? null
            : garages.add(Company(
                id: json["id"].toString(),
                scrapLocationId: json["scrapLocationId"].toString(),
                orderId: json["orderId"].toString(),
                companyUniqueId: json["companyUniqueId"].toString(),
                companyFcmToken: json["companyFCMToken"].toString(),
                scrapLocationName: json["scrapLocationName"].toString(),
                userId: json["userId"].toString(),
                lastModifiedDate: DateTime.parse(json["lastModifiedDate"]),
                userName: json["userName"].toString(),
                companyNameEn: json["companyNameEn"].toString(),
                companyNameAr: json["companyNameAr"].toString(),
                companyName: json["companyName"].toString(),
                arrange: json["arrange"].toString(),
                commotionPercent: json["commotionPercent"].toString(),
                smsPhone: json["smsPhone"].toString(),
                phone: json["phone"].toString(),
                status: json["status"].toString(),
                imageUrl: json["imageURL"].toString(),
                createdDate: DateTime.parse(json["createdDate"]),
                userAccount: json["userAccount"].toString(),
                specialties: json["specialties"].toString(),
                models: json["models"].toString(),
              ));
      }
      if (garages.isBlank) {}
      loading.value = false;

      paginate.value = false;
      //  area != 0 ? loading.value = false : paginate.value = false;
    } catch (e) {
      // // print(e.response.data);
      //errooor
      // print(e);
      paginate.value = false;
    }
    update();
  }

//paginate
  final count = 0.obs;
  @override
  void onInit() {
    id.value = Get.arguments['id'];
    getRequestsListPagination(index: 0);
    Future.delayed(Duration.zero, () {
      scrollController.addListener(() async {
        if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) {
          // pageNumber.value += 1;

          // getRequestsListPagination(
          //   index: pageNumber.value,
          // );
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
  void increment() => count.value++;
}
