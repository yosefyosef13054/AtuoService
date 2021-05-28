import 'package:get_storage/get_storage.dart';

class APIToken {
  static var storage = GetStorage();
  static String apiToken;
  static saveApiToken(token) {
    storage.write('token', token);
    apiToken = token;
    // print(token);
  }

  static String gatApiToken() {
    String token = storage.read('token');
    // print("Token Api is:$token");
    apiToken = token;
    return token;
  }
}
