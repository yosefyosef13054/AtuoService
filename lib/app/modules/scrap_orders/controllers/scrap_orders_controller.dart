import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:autoservice/app/modules/scrap_orders/model.dart';

import '../../../services/httpService.dart';
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:dio/dio.dart' as dio;
// import 'package:autoservice/app/widgets/MyAlertDialog.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:autoservice/app/Colors.dart';
// import 'package:rounded_loading_button/rounded_loading_button.dart';
// import 'package:fluttertoast/fluttertoast.dart';

class ScrapOrdersController extends GetxController {
  //TODO: Implement ScrapOrdersController

  final http = Get.find<HttpService>();

  //paginate
  //pagenation
  var myRequestsList = List<MyScrapRequests>().obs;

  var pageNumber = 0.obs;
  var loading = false.obs;
  ScrollController scrollController = new ScrollController();
  var paginate = false.obs;
  void getRequestsListPagination({index}) async {
    loading.value = pageNumber.value == 0 ? true : false;
    paginate.value = true;

    try {
      var response = await http.get(
          'ScrapOrders/GetByClientId?pageIndex=${index.toString()}&pageSize=10');
      // area == 0 ? await myRequestsList.clear() : null;
      print(response);
      for (var json in response.data) {
        myRequestsList.contains(MyScrapRequests(
                  id: json["id"],
                  clientId: json["clientId"],
                  clientName: json["clientName"],
                  scrapCompanyId: json["scrapCompanyId"],
                  scrapCompanyName: json["scrapCompanyName"],
                  regionId: json["regionId"] == null ? null : json["regionId"],
                  regionName:
                      json["regionName"] == null ? null : json["regionName"],
                  locationId:
                      json["locationId"] == null ? null : json["locationId"],
                  locationName: json["locationName"] == null
                      ? null
                      : json["locationName"],
                  carTypeId:
                      json["carTypeId"] == null ? null : json["carTypeId"],
                  carTypeName:
                      json["carTypeName"] == null ? null : json["carTypeName"],
                  modelId: json["modelId"] == null ? null : json["modelId"],
                  modelName:
                      json["modelName"] == null ? null : json["modelName"],
                  carYear: json["carYear"] == null ? null : json["carYear"],
                  orderDate: DateTime.parse(json["orderDate"]),
                  accepted: json["accepted"],
                  isFavorite: json["isFavorite"],
                  acceptedDate: json["acceptedDate"],
                  pendingDelivery: json["pendingDelivery"],
                  pendingDeliveryDate: json["pendingDeliveryDate"],
                  delivered: json["delivered"],
                  deliveredDate: json["deliveredDate"],
                  canceled: json["canceled"],
                  canceledDate: json["canceledDate"],
                  moneyReceived: json["moneyReceived"],
                  totalPrice: json["totalPrice"],
                  autoServicePercent: json["autoServicePercent"],
                  autoServiceTotal: json["autoServiceTotal"],
                  companies: json["companies"],
                  attachments: json["attachments"],
                  description:
                      json["description"] == null ? null : json["description"],
                  acceptedComment: json["acceptedComment"],
                  clientUniqueId: json["clientUniqueId"],
                  companyUniqueId: json["companyUniqueId"],
                )) ==
                true
            ? null
            : myRequestsList.add(MyScrapRequests(
                id: json["id"],
                clientId: json["clientId"],
                clientName: json["clientName"],
                scrapCompanyId: json["scrapCompanyId"],
                scrapCompanyName: json["scrapCompanyName"],
                regionId: json["regionId"] == null ? null : json["regionId"],
                regionName:
                    json["regionName"] == null ? null : json["regionName"],
                locationId:
                    json["locationId"] == null ? null : json["locationId"],
                locationName:
                    json["locationName"] == null ? null : json["locationName"],
                carTypeId: json["carTypeId"] == null ? null : json["carTypeId"],
                carTypeName:
                    json["carTypeName"] == null ? null : json["carTypeName"],
                modelId: json["modelId"] == null ? null : json["modelId"],
                modelName: json["modelName"] == null ? null : json["modelName"],
                carYear: json["carYear"] == null ? null : json["carYear"],
                orderDate: DateTime.parse(json["orderDate"]),
                accepted: json["accepted"],
                isFavorite: json["isFavorite"],
                acceptedDate: json["acceptedDate"],
                pendingDelivery: json["pendingDelivery"],
                pendingDeliveryDate: json["pendingDeliveryDate"],
                delivered: json["delivered"],
                deliveredDate: json["deliveredDate"],
                canceled: json["canceled"],
                canceledDate: json["canceledDate"],
                moneyReceived: json["moneyReceived"],
                totalPrice: json["totalPrice"],
                autoServicePercent: json["autoServicePercent"],
                autoServiceTotal: json["autoServiceTotal"],
                companies: json["companies"],
                attachments: json["attachments"],
                description:
                    json["description"] == null ? null : json["description"],
                acceptedComment: json["acceptedComment"],
                clientUniqueId: json["clientUniqueId"],
                companyUniqueId: json["companyUniqueId"],
              ));
      }
      // if (myRequestsList.isBlank) {}
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
  void increment() => count.value++;
}
