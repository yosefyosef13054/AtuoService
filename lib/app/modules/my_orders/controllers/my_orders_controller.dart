import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../services/httpService.dart';
import 'package:autoservice/app/modules/my_orders/model.dart';

class MyOrdersController extends GetxController {
  //TODO: Implement MyOrdersController

  final http = Get.find<HttpService>();
  ScrollController scrollController = new ScrollController();

//Car Items
  var myoredersList = List<MyOrders>().obs;
  // List<MyOrders> myoredersList = [];
  var response;
  var loading = false.obs;
  var paginate = false.obs;

  void getmyOrders() async {
    loading.value = true;

    try {
      // ServiceSparePart/Search?regionId=${regionId.toString()}&carTypeId=${cartypeId.toString()}&modelId=${modelId.toString()}&yearId=${yearId.toString()}&areaId=0&pageIndex=0&pageSize=20
      response = await http.get('ClientOrders/GetByClientId');
      print(response.data);
      await myoredersList.clear();

      for (var json in response.data) {
        myoredersList.contains(MyOrders(
                  id: json["id"],
                  clientId: json["clientId"],
                  clientName: json["clientName"],
                  clientPhone: json["clientPhone"],
                  orderDate: DateTime.parse(json["orderDate"]),
                  paymentTypeId: json["paymentTypeId"],
                  paymentTypeName: json["paymentTypeName"],
                  paymentDate: json["paymentDate"],
                  startDate: DateTime.parse(json["startDate"]),
                  finishDate: DateTime.parse(json["finishDate"]),
                  createdDate: DateTime.parse(json["createdDate"]),
                  areaName: json["areaName"],
                  finished: json["finished"],
                  status: json["status"],
                  addressId: json["addressId"],
                  addressName: json["addressName"],
                  myFatoorahId: json["myFatoorahId"] == null
                      ? null
                      : json["myFatoorahId"],
                  apiInvoiceId: json["apiInvoiceId"],
                  apiPaymentDate: json["apiPaymentDate"] == null
                      ? null
                      : DateTime.parse(json["apiPaymentDate"]),
                  myFatoorahUrl: json["myFatoorahURL"] == null
                      ? null
                      : json["myFatoorahURL"],
                  companyId: json["companyId"],
                  companyName: json["companyName"],
                  acceptedByCompany: json["acceptedByCompany"],
                  couponCode: json["couponCode"],
                  acceptedDate: json["acceptedDate"],
                  finishedByCompany: json["finishedByCompany"],
                  finishedDate: json["finishedDate"],
                  timeId: json["timeId"],
                  timeName: json["timeName"],
                  orderDetails: List<Addon>.from(
                      json["orderDetails"].map((x) => Addon.fromJson(x))),
                  addons: List<Addon>.from(
                      json["addons"].map((x) => Addon.fromJson(x))),
                  orderDetailsIDs: json["orderDetailsIDs"],
                  addonsIDs: json["addonsIDs"],
                  balance: json["balance"],
                  discount: json["discount"],
                  totalCost: json["totalCost"],
                  couponId: json["couponId"] == null ? null : json["couponId"],
                )) ==
                true
            ? null
            : myoredersList.add(MyOrders(
                id: json["id"],
                clientId: json["clientId"],
                clientName: json["clientName"],
                clientPhone: json["clientPhone"],
                orderDate: DateTime.parse(json["orderDate"]),
                paymentTypeId: json["paymentTypeId"],
                paymentTypeName: json["paymentTypeName"],
                paymentDate: json["paymentDate"],
                startDate: DateTime.parse(json["startDate"]),
                finishDate: DateTime.parse(json["finishDate"]),
                createdDate: DateTime.parse(json["createdDate"]),
                areaName: json["areaName"],
                finished: json["finished"],
                status: json["status"],
                addressId: json["addressId"],
                addressName: json["addressName"],
                myFatoorahId:
                    json["myFatoorahId"] == null ? null : json["myFatoorahId"],
                apiInvoiceId: json["apiInvoiceId"],
                apiPaymentDate: json["apiPaymentDate"] == null
                    ? null
                    : DateTime.parse(json["apiPaymentDate"]),
                myFatoorahUrl: json["myFatoorahURL"] == null
                    ? null
                    : json["myFatoorahURL"],
                companyId: json["companyId"],
                companyName: json["companyName"],
                acceptedByCompany: json["acceptedByCompany"],
                couponCode: json["couponCode"],
                acceptedDate: json["acceptedDate"],
                finishedByCompany: json["finishedByCompany"],
                finishedDate: json["finishedDate"],
                timeId: json["timeId"],
                timeName: json["timeName"],
                orderDetails: List<Addon>.from(
                    json["orderDetails"].map((x) => Addon.fromJson(x))),
                addons: List<Addon>.from(
                    json["addons"].map((x) => Addon.fromJson(x))),
                orderDetailsIDs: json["orderDetailsIDs"],
                addonsIDs: json["addonsIDs"],
                balance: json["balance"],
                discount: json["discount"],
                totalCost: json["totalCost"],
                couponId: json["couponId"] == null ? null : json["couponId"],
              ));
        print(myoredersList.length);
      }
      loading.value = false;

      getmyCartOrders();
      // if (myoredersList.isBlank) {}
    } catch (e) {
      // // print(e.response.data);
      //errooor
      // print(e);
      loading.value = false;
    }

    update();
  }

  var myCartoredersList = List<CartOrder>().obs;
  var pageNumber = 0.obs;
  List ids = [];
  void getmyCartOrders() async {
    paginate.value = true;

    try {
      // ServiceSparePart/Search?regionId=${regionId.toString()}&carTypeId=${cartypeId.toString()}&modelId=${modelId.toString()}&yearId=${yearId.toString()}&areaId=0&pageIndex=0&pageSize=20
      response = await http
          .get('ShopClientOrders/GetByClientId?pageIndex=${pageNumber.value}');
      print('11111111111111111');
      print(response.data);
      print('11111111111111111');
      // await myCartoredersList.clear();

      for (var json in response.data) {
        ids.contains(json["id"]) == true
            ? print('doExist')
            : myCartoredersList.add(CartOrder(
                id: json["id"],
                clientId: json["clientId"],
                clientName: json["clientName"],
                phone: json["phone"],
                companyId: json["companyId"],
                companyName: json["companyName"],
                areaName: json["areaName"],
                paymentTypeId: json["paymentTypeId"],
                couponId: json["couponId"] == null ? null : json["couponId"],
                paymentTypeCode: json["paymentTypeCode"],
                paymentTypeName: json["paymentTypeName"],
                orderDate: DateTime.parse(json["orderDate"]),
                sendPayment: json["sendPayment"],
                payed: json["payed"],
                myFatoorahId: json["myFatoorahId"],
                myFatoorahUrl: json["myFatoorahURL"],
                apiInvoiceId: json["apiInvoiceId"],
                apiPaymentDate: json["apiPaymentDate"],
                canceled: json["canceled"],
                totalCost: json["totalCost"].toDouble(),
                payment: json["payment"],
                deliveryCharge: json["deliveryCharge"],
                balance: json["balance"].toDouble(),
                notes: json["notes"],
                discount: json["discount"] == null
                    ? null
                    : json["discount"].toDouble(),
                addressId: json["addressId"],
                addressName: json["addressName"],
                cancelComment: json["cancelComment"],
                orderDetails: List<OrderCartDetail>.from(json["orderDetails"]
                    .map((x) => OrderCartDetail.fromJson(x))),
              ));
        print(myCartoredersList.length);
        ids.add(json["id"]);
      }
      paginate.value = false;

      // if (myoredersList.isBlank) {}
    } catch (e) {
      // // print(e.response.data);
      //errooor
      print(e);
      paginate.value = false;
    }

    update();
  }

//Car Items
  final count = 0.obs;
  @override
  void onInit() {
    getmyOrders();
    Future.delayed(Duration.zero, () {
      scrollController.addListener(() async {
        if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) {
          pageNumber.value += 1;

          getmyCartOrders();
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
