// import 'api.dart';
// import 'dart:io';
// import 'httpService.dart';

// login(mobile, password, countryCode) {
//   // print('mobile : ${mobile}');
//   // print('password: ${password.text}');
//   // print('countryCode:  ${countryCode}');
//   return post(
//     '/token',
//     {
//       'countryCode': countryCode,
//       'userName': mobile,
//       'grant_type': 'password',
//       'password': password.text,
//       'uid': 'client',
//       // 'device_type':
//       //     Platform.isIOS ? 'ios' : Platform.isAndroid ? 'android' : 'android'
//     },
//   );
// }
// // loginFacebook(facebookId,name,email,token) {
// //   return post('customer/signInFacebook', {
// //     'facebook_id': facebookId,
// //     'name': name,
// //     'email':email,
// //     'push_token' : token
// //     },
// //     );
// // }

// signupUser(mobile, password, name) {
//   return post('signUp', {
//     'mobile': mobile,
//     'password': password,
//     'name': name,
//     'device_type': 'android'
//   });
// }
