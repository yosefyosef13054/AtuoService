import 'dart:convert';
import 'api.dart';
import 'package:shared_preferences/shared_preferences.dart';

String code;
String get helperLocal => code == null ? 'en' : code;

getToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('token').toString();
}

getUserData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.getStringList('user') != null) {
    return prefs.getStringList('user');
  } else
    return null;
}

setUserData(data) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setStringList('user', data);
}

setUserToken(token) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setString('token', token);
}

setPushToken(data) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setString('push_token', data['push_token']);
}

getpushToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('push_token');
}
