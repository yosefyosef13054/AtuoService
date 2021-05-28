import 'package:autoservice/app/modules/webviewScreen/views/webview_screen_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../services/httpService.dart';
import 'package:autoservice/app/modules/cars_services/controllers/cars_services_controller.dart';
import 'package:autoservice/app/modules/address_payment/model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:autoservice/app/modules/service_time/controllers/service_time_controller.dart';
import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:autoservice/app/modules/Cart/controllers/cart_controller.dart';

class AddressPaymentController extends GetxController {
  CarsServicesController serviceController = Get.put(CarsServicesController());
  ServiceTimeController serviceTimeController =
      Get.put(ServiceTimeController());
  TextEditingController codeController = TextEditingController();
  final CartController cartController = Get.put(CartController());

  var addressSelected = false.obs;
  var paymentSelect = false.obs;
  var isShop = false.obs;
  //TODO: Implement AddressPaymentController
  final http = Get.find<HttpService>();
  var loading = false.obs;
  var emtyList = {
    "id": 0,
    "title": "empty",
    "titleAr": "empty",
    "titleEn": "empty",
    "type": "empty",
    "action": null
  };

//addresses
  var selectedAddress = '0'.obs;
  var addresses = List<Addresses>().obs;
  void getAddresses() async {
    loading.value = true;
    getpaymentMethods();
    try {
      var response = await http.get('ClientAddress/GetAll');
      // print(response.data);
      await addresses.clear();

      // addresses.add(ServiceTime(id: 0, areaName: 'select'.tr));

      for (var item in response.data) {
        addresses.contains(Addresses(
                  id: item["id"],
                  clientId: item["clientId"],
                  clientName: item["clientName"],
                  address: item["address"] == null ? null : item["address"],
                  areaId: item["areaId"],
                  areaName: item["areaName"],
                  section: item["section"],
                  subSection: item["subSection"],
                  street: item["street"],
                  building: item["building"],
                  floor: item["floor"],
                  apartment: item["apartment"],
                  addressName: item["addressName"],
                  deleted: item["deleted"],
                  deliveryCharge: item["deliveryCharge"],
                )) ==
                true
            ? null
            : addresses.add(Addresses(
                id: item["id"],
                clientId: item["clientId"],
                clientName: item["clientName"],
                address: item["address"] == null ? null : item["address"],
                areaId: item["areaId"],
                areaName: item["areaName"],
                section: item["section"],
                subSection: item["subSection"],
                street: item["street"],
                building: item["building"],
                floor: item["floor"],
                apartment: item["apartment"],
                addressName: item["addressName"],
                deleted: item["deleted"],
                deliveryCharge: item["deliveryCharge"],
              ));
      }
      // areaid.value = '1';
      // await getarea(addresses[0].id);
      // loading.value = false;
      loading.value = false;
    } catch (e) {
      loading.value = false;
      // // print(e.response.data);
      //errooor
      // print(e);
    }
    update();
  }
//addresses

//paymentTypes
  var selectedPayment = '0'.obs;
  var paymentMethods = List<PaymentTypes>().obs;
  void getpaymentMethods() async {
    loading.value = true;
    try {
      var response = await http.get('DefaultLists/GetPaymentTypes');
      // print(response.data);
      await paymentMethods.clear();

      // paymentMethods.add(ServiceTime(id: 0, areaName: 'select'.tr));

      for (var item in response.data) {
        paymentMethods.contains(PaymentTypes(
                  id: item["id"],
                  title: item["title"],
                  titleAr: item["titleAr"],
                  titleEn: item["titleEn"],
                  type: item["type"],
                  action: item["action"],
                )) ==
                true
            ? null
            : paymentMethods.add(PaymentTypes(
                id: item["id"],
                title: item["title"],
                titleAr: item["titleAr"],
                titleEn: item["titleEn"],
                type: item["type"],
                action: item["action"],
              ));
      }
      // areaid.value = '1';
      // await getarea(paymentMethods[0].id);
      // loading.value = false;
      loading.value = false;
    } catch (e) {
      loading.value = false;
      // // print(e.response.data);
      //errooor
      // print(e);
    }
    update();
  }

//paymentMethods
  showDialogLogOut(context, id) {
    Alert(
      context: context,
      type: AlertType.warning,
      title: "sure_Logout".tr,
      // desc:
      //     "sure_Logout".tr,
      buttons: [
        DialogButton(
          child: Text(
            'remove'.tr,
            textScaleFactor: 1,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () async {
            await removeAddress(context, id);

            Navigator.of(context).pop();
          },
          color: Color.fromRGBO(0, 179, 134, 1.0),
        ),
        DialogButton(
          child: Text(
            'cancel'.tr,
            textScaleFactor: 1,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          color: Colors.red,
        ),
      ],
    ).show();
  }

  void removeAddress(context, id) async {
    http.postUrl('ClientAddress/Delete?id=${id.toString()}',
        {'id': id.toString()}).then((response) {
      try {
        getAddresses();
        Fluttertoast.showToast(
            msg: 'addressRemoved'.tr,
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 0,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
      } catch (e) {
        loading.value = false;
        // print("Exepition with Login : ${e}");
      }
    }).catchError((onError) {
      loading.value = false;
      // print(onError);
      Fluttertoast.showToast(
          msg: onError.response.data.toString(),
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 0,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    });
  }

  ///Payment
  final RoundedLoadingButtonController btnController =
      new RoundedLoadingButtonController();
  List<String> addtionalItemsIDS = [];
//Create Add Request
  void submit(context) async {
    var format = DateFormat('yMd');

    if (isShop.value == false) {
      await addtionalItemsIDS.clear();

      serviceController.choosenAdditionalService.forEach((element) {
        addtionalItemsIDS.add(element.id.toString());
      });
      // print(addtionalItemsIDS);
      http.postUrl('ClientOrders/Add', {
        "addressId": selectedAddress.value,
        "paymentTypeId": selectedPayment.value,
        "companyId": serviceController.choosenService.value.companyId,
        "couponId": couponId.value == '0' ? 0 : couponId.value,
        "discount": totalDiscound,
        "timeId": serviceTimeController.time_id.value,
        "orderDate": format
            .format(DateTime.parse(
                serviceTimeController.date_time.value.toString()))
            .toString(),
        "orderDetailsIDs": serviceController.choosenService.value.id,
        "addonsIDs": addtionalItemsIDS.length == 0 ? [] : addtionalItemsIDS
      }).then((response) {
        // print(response.data);
        try {
          btnController.success();
          Future.delayed(
              Duration(milliseconds: 600), () => btnController.reset());
          // );
          if (selectedPayment.value.toString() == 3.toString()) {
            Get.offAllNamed('/payment-success');
          } else {
            Get.toNamed('/web-view-in-a-p-p',
                arguments: {'myFatoorahURL': response.data['myFatoorahURL']});
          }
          loading.value = false;
        } catch (e) {
          btnController.error();
          Future.delayed(
              Duration(milliseconds: 1200), () => btnController.reset());
          loading.value = false;
          // print("Exepition with Login : ${e}");
        }
      }).catchError((onError) {
        btnController.error();
        Future.delayed(
            Duration(milliseconds: 1200), () => btnController.reset());
        loading.value = false;
      });
    } else if (isShop.value == true) {
      List orderDetails = [];
      cartController.cartItemsList.forEach((element) {
        orderDetails.add({
          "productId": element.itemDate.id,
          "quantity": element.quntity,
          "unitPrice": element.itemDate.unitPrice
        });
      });
      print(orderDetails);
      http.postUrl('ShopClientOrders/Add', {
        "couponId": couponId.value == '0' ? 0 : couponId.value,
        "deliveryCharge": 0,
        "addressId": selectedAddress.value,
        "paymentTypeId": selectedPayment.value,
        "orderDetails": orderDetails
      }).then((response) {
        print(response.data);
        try {
          btnController.success();
          Future.delayed(
              Duration(milliseconds: 600), () => btnController.reset());
          // );
          if (selectedPayment.value.toString() == 3.toString()) {
            Get.offAllNamed('/payment-success');
          } else {
            Get.toNamed('/web-view-in-a-p-p',
                arguments: {'myFatoorahURL': response.data['myFatoorahURL']});
          }
          loading.value = false;
        } catch (e) {
          btnController.error();
          Future.delayed(
              Duration(milliseconds: 1200), () => btnController.reset());
          loading.value = false;
          // print("Exepition with Login : ${e}");
        }
      }).catchError((onError) {
        print(onError);
        btnController.error();
        Future.delayed(
            Duration(milliseconds: 1200), () => btnController.reset());
        loading.value = false;
      });
      // Fluttertoast.showToast(
      //     msg: 'This Request is under Testing',
      //     toastLength: Toast.LENGTH_LONG,
      //     gravity: ToastGravity.TOP,
      //     timeInSecForIosWeb: 0,
      //     backgroundColor: Colors.red,
      //     textColor: Colors.white,
      //     fontSize: 16.0);
    }
    //    List orderDetails = [];
    //   cartController.cartItemsList.forEach((element) {
    //     orderDetails.add({
    //       "productId": element.itemDate.id,
    //       "quantity": element.quntity,
    //       "unitPrice": element.itemDate.unitPrice
    //     });
    //   });
    // print({
    //     "couponId": couponId.value == '0' ? 'null' : couponId.value,
    //     "deliveryCharge": 0,
    //     "addressId": selectedAddress.value,
    //     "paymentTypeId": selectedPayment.value,
    //     "orderDetails": orderDetails
    //   });
  }

  var couponResponse;
  var discountPercent = '0'.obs;
  var couponId = '0'.obs;
  var totalDiscound = '0'.obs;

//Coupon
  final RoundedLoadingButtonController btnCouponController =
      new RoundedLoadingButtonController();
  void addPromoCode(context, coupon) async {
    var price;
    if (isShop.value == false) {
      price = serviceController.tootal.value == 0
          ? ' ${serviceController.choosenService.value.unitPrice}'
          : ' ${double.parse(serviceController.tootal.value.toString()) + double.parse(serviceController.choosenService.value.unitPrice.toString())}';
    } else {
      price = cartController.totalPrice.value.toString();
    }
    couponResponse = await http.postUrl(
        'ServiceCoupon/CheckCoupon?coupon=$coupon&companyId=${serviceController.choosenService.value.companyId.toString() == null.toString() ? 0 : serviceController.choosenService.value.companyId}&orderTotal=${price.toString()}',
        {}).then((response) {
      print(response.data);
      discountPercent.value = response.data['discountPercent'].toString();
      totalDiscound.value = response.data['totalDiscount'].toString();
      couponId.value = response.data['id'].toString();
      // print(discountPercent.value);
      // print(totalDiscound.value);
      try {
        btnCouponController.success();
        Future.delayed(
            Duration(milliseconds: 1200), () => btnCouponController.reset());
        Fluttertoast.showToast(
            msg: 'Coupon Activated',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 0,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
      } catch (e) {
        print(e.response);
        btnCouponController.error();
        Future.delayed(
            Duration(milliseconds: 1200), () => btnCouponController.reset());
        // print("Exepition with Login : ${e}");
        Fluttertoast.showToast(
            msg: e.response.data,
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 0,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }).catchError((onError) {
      btnCouponController.error();
      Future.delayed(
          Duration(milliseconds: 1200), () => btnCouponController.reset());
      loading.value = false;
      // print(onError);
      Fluttertoast.showToast(
          msg: onError.response.data.toString(),
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 0,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    });
  }

  final count = 0.obs;
  @override
  void onInit() {
    isShop.value = Get.arguments['isShop'];
    getAddresses();

    //To do i have to meke this appear incase there is a failed payment
    if (Get.arguments != null && Get.arguments['failed'] == true) {
      Fluttertoast.showToast(
          msg: 'faild'.tr,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 0,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }

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
