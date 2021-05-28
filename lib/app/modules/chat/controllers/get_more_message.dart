import 'package:autoservice/app/modules/chat/controllers/message_model.dart';
import 'package:autoservice/app/services/global.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MoreMessage {
  static getMoreMessage(
      {String userId,
      String chatId,
      int page,
      List<MessageModal> messageList}) async {
    String url =
        "${GlobalService.baseURLWithoutToken}v1/mobile/getMorechatMessages";

    Map getMoreMessageBody = {
      'userId': userId,
      'chatId': chatId,
      'reverse': 0.toString(),
      'page': page.toString(),
    };

    http.Response response = await http.post(url, body: getMoreMessageBody);

    var responseDecoded = json.decode(response.body);

    if (response.statusCode == 200) {
      List list = responseDecoded['data'];

      if (list != null) {
        for (var messages in responseDecoded['data']) {
          messageList.insert(0, messages);
        }
      }
    } else {
      // print("Error in fetching data");
    }
  }
}
