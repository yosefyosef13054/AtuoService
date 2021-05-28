import 'package:autoservice/app/modules/chat/controllers/work_with_orders/call.dart';
import 'package:flutter/cupertino.dart';

class OrderOptions {
  static callClient(
      {String callerName,
      String otherDeviceToken,
      String deviceToken,
      String userName,
      String clientId,
      String companyId,
      String orderId,
      BuildContext context}) {
    CallOption.getAgoraDataToCall(callerName, otherDeviceToken, deviceToken,
        userName, clientId, companyId, orderId, context);
  }
}
