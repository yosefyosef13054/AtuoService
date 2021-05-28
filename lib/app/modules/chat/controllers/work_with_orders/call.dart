import 'package:autoservice/app/services/global.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';
import 'package:get/get.dart';
import 'package:toast/toast.dart';

class CallOption {
  static int uid = Random().nextInt(10000000);
  static RxBool callLoading = RxBool(false);

  static getAgoraDataToCall(callerName, otherDeviceToken, deviceToken, userName,
      clientId, companyId, orderId, context) async {
    callLoading(true);
    String url =
        "${GlobalService.baseURLWithoutToken}v1/mobile/prepareAgoraCall";

    Map agoraData = {
      'uid': uid.toString(),
      'callerName': '$callerName',
      'otherDeviceToken': '$otherDeviceToken',
      'deviceToken': '$deviceToken',
      'clientId': clientId,
      'companyId': companyId,
      'orderId': orderId,
    };

    http.Response response = await http.post(url, body: agoraData);

    if (response.statusCode == 200) {
      callLoading(false);
      var responseDecoded = json.decode(response.body);

      Get.toNamed('/call', arguments: [
        responseDecoded['channelToken'],
        responseDecoded['channelName'],
        userName,
        false,
        otherDeviceToken,
        responseDecoded['resourceId'],
        responseDecoded['sid'],
        responseDecoded['uId'].toString(),
        clientId,
        companyId,
        orderId
      ]);
    } else {
      callLoading(false);
      Toast.show("حدث خطأ! يرجي إعادة المحاولة لاحقاً", context);
    }
  }
}
