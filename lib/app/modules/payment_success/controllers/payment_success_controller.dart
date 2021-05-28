import 'package:get/get.dart';
import '../../../services/httpService.dart';
import 'dart:io';

class PaymentSuccessController extends GetxController {
  final http = Get.find<HttpService>();

  //TODO: Implement PaymentSuccessController
  void submit() async {
    ///
    String id = Get.arguments['id'];
    String data = Get.arguments['data'];

    http.postUrl('ClientOrders/UpdatePayment?id=${id}&data=${data}', {}).then(
        (response) {
      // print(response.data);
      try {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => MyApp()),
        // );

        // Future.delayed(Duration(milliseconds: 600),
        //     () => Get.offAndToNamed('/address-payment'));
      } catch (e) {
        // print("Exepition with Login : ${e}");
      }
    }).catchError((onError) {});
  }

  final count = 0.obs;
  @override
  void onInit() {
    if (Get.arguments != null) {
      submit();
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
