// import 'dart:convert';
// import 'dart:io';
// import 'package:dio/dio.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'helper.dart';

// String url = 'https://autoservice.wecoders.app/api';

// Dio dio = new Dio();

// Future<dynamic> post(link, data,
//     {bool useToken = true,
//     Function onSendProgress,
//     Function onRecieveProgress}) async {
//   String token = await getToken();
//   // print('$token');
//   if (token != null && useToken) data['token'] = token;
//   // print(data);

//   //  // print('$url/$link');
//   return dio
//       .post(
//     '$url/$link',
//     data: data,
//     options: Options(headers: {
//       HttpHeaders.acceptHeader: 'application/json',
//     }),
//     onReceiveProgress: onRecieveProgress,
//     onSendProgress: onSendProgress,
//   )
//       .then((response) {
//     // print(response);
//     //setUserToken(response.data);
//     // // print(token1);

//     //// print('${data['token']}');
//     // // print(response.data['token']);
//     return response.data;
//   });
// }

// Future<dynamic> mainPost(link, data,
//     {bool useToken = true,
//     Function onSendProgress,
//     Function onRecieveProgress}) async {
//   String token = await getToken();
//   // if (token != null && useToken) data['token'] = token;
//   // // print(token);
//   // print(data);

//   //  // print('$url/$link');
//   return dio
//       .post(
//     '$url/$link',
//     options: Options(headers: {
//       HttpHeaders.authorizationHeader: 'Bearer $token',
//     }),
//     data: data,
//     onReceiveProgress: onRecieveProgress,
//     onSendProgress: onSendProgress,
//   )
//       .then((response) {
//     // print(response);
//     return response.data;
//   });
// }

// Future<dynamic> post2(link,
//     {bool useToken = true,
//     Function onSendProgress,
//     Function onRecieveProgress}) async {
//   String token = await getToken();
//   //if (token != null && useToken) data['token'] = token;
//   // // print(data);
//   //  // print('$url/$link');

//   return dio
//       .post(
//     '$url/$link',
//     options: Options(headers: {
//       HttpHeaders.authorizationHeader: 'Bearer $token',
//     }),
//     data: {},
//     onReceiveProgress: onRecieveProgress,
//     onSendProgress: onSendProgress,
//   )
//       .then((response) {
//     // print(response);
//     return response.data;
//   });
// }

// // Future<dynamic> get(String link) async {
// //   String token = await getToken();
// //   if (token != null) if (link.contains('?'))
// //     link += '&api_key=$token';
// //   else
// //     link += '?api_key=$token';
// //   return dio.get('$url/$link',
// //  ).then((response) {
// //         // print(response);
// //     return response.data;
// //   });
// // }
// Future<dynamic> get(String link) async {
//   String token = await getToken();
//   if (token != null) if (link.contains('?'))
//     link += '&api_key=$token';
//   else
//     link += '?api_key=$token';

//   return dio
//       .get('$url/$link',
//           options: Options(headers: {
//             HttpHeaders.authorizationHeader: 'Bearer $token',
//           }))
//       .then((response) {
//     // print(response.data);
//     return response.data;
//   });
// }

// Future<dynamic> put(link, data) {
//   return dio.put('$url/$link', data: json.encode(data)).then((response) {
//     return response.data;
//   });
// }

// Future<dynamic> delete(link) {
//   return dio.delete('$url/$link').then((response) {
//     return response.data;
//   });
// }
