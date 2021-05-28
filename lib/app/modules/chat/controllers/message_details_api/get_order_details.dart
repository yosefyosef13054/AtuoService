import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import '../message_model.dart';
import 'package:autoservice/app/modules/scrap_orders/model.dart';

class OrderDetails {
  static getOrderDetails(
      {String orderId,
      RxList<MessageModal> messages,
      Rx<MyScrapRequests> carInfoModel,
      RxString fcmToken,
      RxString garageName,
      RxString garageId,
      RxString garageImg}) async {
    String url =
        "https://auto.wecoders.app/api/ScrapOrders/GetById?id=$orderId";

    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      var responseDecoded = json.decode(response.body);
      print(responseDecoded['attachments']);

      carInfoModel.value = MyScrapRequests.fromJson(responseDecoded);
      String otherName = Get.arguments['otherName'];

      List<Company> companyList = [];

      for (var company in carInfoModel.value.companies) {
        companyList.add(Company.fromJson(company));
      }

      companyList.forEach((element) {
        if (element.userName == otherName) {
          print("here");
          fcmToken.value = element.companyFcmToken;
          garageName.value = element.userName;
          garageImg.value = element.imageUrl;
          garageId.value = element.userId.toString();
        }
      });

      for (var message in responseDecoded['attachments']) {
        messages.add(MessageModal.fromJson(message,
            orderTime: DateTime.now().toString()));
      }
    } else {
      print('error get order details');
    }
  }
}
