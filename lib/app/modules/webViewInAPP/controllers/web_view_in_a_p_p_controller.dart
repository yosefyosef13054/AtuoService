import 'package:get/get.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter/cupertino.dart';
import '../../../services/httpService.dart';
import 'package:autoservice/app/modules/address_payment/model.dart';
import 'package:fluttertoast/fluttertoast.dart';

class WebViewInAPPController extends GetxController {
  //TODO: Implement WebViewInAPPController
  // HeadlessInAppWebView headlessWebView;
  InAppWebViewController webView;
  final http = Get.find<HttpService>();

  double progress = 0;
  String url = Get.arguments['myFatoorahURL'];
  final count = 0.obs;

  void submit(context, {id, data}) async {
    Get.offAllNamed('/payment-success', arguments: {"id": id, "data": data});
    // await http
    //     .postUrl('ClientOrders/UpdatePayment', {"id": id, "data": data}).then(
    //         (response) {
    //   // print(response.data);
    //   try {
    //     // Navigator.push(
    //     //   context,
    //     //   MaterialPageRoute(builder: (context) => MyApp()),
    //     // );

    //     // Future.delayed(Duration(milliseconds: 600),
    //     //     () => Get.offAndToNamed('/address-payment'));
    //   } catch (e) {
    //     // print("Exepition with Login : ${e}");
    //   }
    // }).catchError((onError) {
    //   // Fluttertoast.showToast(
    //   //     msg: onError.response.data.toString(),
    //   //     toastLength: Toast.LENGTH_LONG,
    //   //     gravity: ToastGravity.TOP,
    //   //     timeInSecForIosWeb: 0,
    //   //     backgroundColor: Colors.red,
    //   //     textColor: Colors.white,
    //   //     fontSize: 16.0);
    // });
  }

  @override
  void onInit() {
    // );
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    // headlessWebView?.dispose();
  }

  void increment() => count.value++;
}
