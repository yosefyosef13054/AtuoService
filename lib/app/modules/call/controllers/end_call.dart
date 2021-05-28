import 'package:autoservice/app/services/global.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get/get.dart';
import 'package:toast/toast.dart';

class AgoraCall {
  static endAgoraCall(
      {callerName,
      channelName,
        channelToken,
      otherDeviceToken,
      resourceId,
      sid,
      uId,
      clientId,
      orderId,
      companyId,
      RxBool endCall}) async {
    String url = "https://autoserviceapi.herokuapp.com/v1/mobile/endAgoraCall";
    endCall(true);

    print("chhhannneelll $channelToken");
    print("commmpany $companyId");


    Map agoraData = {
      'callerName': '$callerName',
      'channelName': '$channelName',
      'channelToken': '$channelToken',
      'otherDeviceToken': '$otherDeviceToken',
      'resourceId': resourceId,
      'sid': sid,
      'uId': uId,
      'clientId': clientId,
      'companyId': companyId,
      'orderId': orderId,
    };

    print("AgoraData $agoraData");

    http.Response response = await http.post(url, body: agoraData);

    if (response.statusCode == 200) {
      var responseDecoded = json.decode(response.body);
      print(responseDecoded);
      endCall(false);
    } else {
      endCall(false);
    }
  }
}
