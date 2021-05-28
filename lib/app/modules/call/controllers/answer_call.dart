import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get/get.dart';

class AgoraAnswerCall {
  static answerAgoraCall({String channelName, RxBool startCall}) async {
    String url =
        "https://autoserviceapi.herokuapp.com/v1/mobile/answerAgoraCall";

    startCall(true);

    Map agoraData = {
      'channelName': '$channelName',
    };

    print("StartAgoraData $agoraData");

    http.Response response = await http.post(url, body: agoraData);

    if (response.statusCode == 200) {
      var responseDecoded = json.decode(response.body);
      print(responseDecoded);
      startCall(false);
    } else {
      startCall(false);
    }
  }
}
