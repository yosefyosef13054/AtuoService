// import 'package:autoservice/app/modules/home/controllers/car_model.dart';
// import 'package:autoservice/generated/time/time_format.dart';
// import 'package:autoservice/theme/variables.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import 'carInfo.dart';

// class CarBoxInformation extends StatelessWidget {
//   CarBoxInformation({this.carDetails});

//   CarInfoModel carDetails;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: AppTheme.primaryColor,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Padding(
//             padding: EdgeInsets.only(left: 10, right: 10, top: 10),
//             child: Wrap(
//               alignment: WrapAlignment.spaceBetween,
//               children: [
//                 CarInfo(
//                     title: 'countryOfManufacture',
//                     value: '${carDetails.regionName}'),
//                 CarInfo(title: 'carType', value: '${carDetails.carTypeName}'),
//                 CarInfo(title: 'carModal', value: '${carDetails.modelName}'),
//                 CarInfo(
//                     title: 'yearManufactured', value: '${carDetails.carYear}'),
//               ],
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.only(left: 15, right: 15, bottom: 10, top: 5),
//             child: Wrap(
//               alignment: WrapAlignment.spaceBetween,
//               children: [
//                 Text('orderNumber'.tr + ' : ' + '#${carDetails.id}',
//                     style: Theme.of(context)
//                         .textTheme
//                         .bodyText2
//                         .apply(color: Colors.white)),
//                 Text(
//                     'orderDate'.tr +
//                         ' : ' +
//                         '${TimeFormat.formatTime(carDetails.orderDate)}',
//                     style: Theme.of(context)
//                         .textTheme
//                         .bodyText2
//                         .apply(color: Colors.white)),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
