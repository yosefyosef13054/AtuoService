import 'dart:convert';
import 'package:dio/dio.dart' as dioo;
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HttpService extends GetxService {
  static const urlBase = 'https://auto.wecoders.app/api/';
  String baseUrlForImages = 'https://auto.wecoders.app/';
  String apiToken = "";
  dioo.Dio dio = new dioo.Dio();

  Future<HttpService> init() async {
    dio.options.baseUrl = urlBase;
    dio.options.connectTimeout = 5000; //5s
    dio.options.receiveTimeout = 3000;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    apiToken = prefs.getString("token");

    dio.interceptors.add(dioo.InterceptorsWrapper(
        onRequest: (dioo.RequestOptions options) async {
      // Do something before request is sent
      return options; //continue
    }, onResponse: (dioo.Response response) async {
      // Do something with response data
      // print("statusCode ${response.statusCode}");
      return response; // continue
    }, onError: (dioo.DioError e) async {
      // Do something with response error
      return e; //continue
    }));
    // print('HTTP Service Intiated ...');

    return this;
  }

  setApiToken(token) async {
    await setUserToken(token);
    this.apiToken = token;
  }

  // getApiToken() async {
  //   var token = await getToken();
  //   return token;
  // }

  Future<dioo.Response> postUrl(endPoint, body, [isLogin = false]) async {
    // print('im in check login');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    apiToken = prefs.getString("token");
    //// print(apiToken);
    // print('URL ${urlBase + endPoint}');
    // print(body);
    if (apiToken == null && isLogin == false) {
      // print('no token GO Login');
      Get.offNamed('/sign-in');
    } else {
      // print('have Token or login request');

      return dio
          .post(urlBase + endPoint,
              data: body,
              options: dioo.Options(
                  contentType: dioo.Headers.formUrlEncodedContentType,
                  headers: {'Authorization': 'Bearer $apiToken'}))
          .timeout(Duration(seconds: 20), onTimeout: () {
        // time has run out, do what you wanted to do

        Fluttertoast.showToast(
            msg: 'timout'.tr,
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 0,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        return null;
      });
    }
  }

  Future<dioo.Response> postUrlUpload(endPoint, body,
      {Function onSendProgress, Function onRecieveProgress}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    apiToken = prefs.getString("token");
    // print(apiToken);
    // print('URL ${urlBase + endPoint}');
    // print(body);
    return dio.post(urlBase + endPoint,
        data: body,
        options: dioo.Options(
            contentType: dioo.Headers.formUrlEncodedContentType,
            headers: {'Authorization': 'Bearer $apiToken'}));
  }

  Future<dioo.Response> pos(endPoint, body) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    apiToken = prefs.getString("token");
    // print('URL ${urlBase + endPoint}');
    // print(body);
    return dio
        .post(urlBase + endPoint,
            data: body,
            options:
                dioo.Options(headers: {'Authorization': 'Bearer $apiToken'}))
        .timeout(Duration(seconds: 20), onTimeout: () {
      // time has run out, do what you wanted to do

      Fluttertoast.showToast(
          msg: 'timout'.tr,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 0,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      return null;
    });
  }

  Future<dioo.Response> get(endPoint) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    apiToken = prefs.getString("token");
    print('$apiToken');
    print('URL ${urlBase + endPoint}');
    return dio.get(urlBase + endPoint,
        // queryParameters: body,
        options: dioo.Options(headers: {'Authorization': 'Bearer $apiToken'}));
  }
}
