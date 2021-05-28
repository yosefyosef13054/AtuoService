import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../services/httpService.dart';
import 'package:autoservice/app/modules/usedCars_add/models/model.dart';
import 'package:autoservice/app/modules/new_accessories/model.dart';
import 'package:autoservice/app/modules/cars_services/model.dart';
import 'package:autoservice/app/modules/cars_services/controllers/cars_services_controller.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ServiceTimeController extends GetxController {
  CarsServicesController serviceController = Get.put(CarsServicesController());

//  Fluttertoast.showToast(
//           msg: 'validationError'.tr,
//           toastLength: Toast.LENGTH_LONG,
//           gravity: ToastGravity.TOP,
//           timeInSecForIosWeb: 0,
//           backgroundColor: Colors.red,
//           textColor: Colors.white,
//           fontSize: 16.0);
  //TODO: Implement ServiceTimeController
  var selectedTime = false.obs;
  final http = Get.find<HttpService>();
  var loading = false.obs;
  var emtyList = {
    "id": 0,
    "title": "empty",
    "titleAr": "empty",
    "titleEn": "empty",
    "type": "empty",
    "action": null
  };

//date_time
  var date_time = '0'.obs;
  var time_id = '0'.obs;
  var listdate_time_ = List<ServiceTime>().obs;
  var choosenTime = List<Time>().obs;
  var date_time_loading = false.obs;
  void getdate_time_() async {
    date_time_loading.value = true;
    try {
      var response = await http.get(
          'ServiceComapnyTime/GetTime?companyId=${serviceController.choosenService.value.companyId}');
      // print(response.data);
      await listdate_time_.clear();

      // listdate_time_.add(ServiceTime(id: 0, areaName: 'select'.tr));

      for (var item in response.data) {
        var list_time = List<Time>().obs;

        for (var item in item['times']) {
          list_time.contains(Time(
                    // dayName: item['dayName'].toString(),
                    // companyId: item['companyId'].toString(),
                    // companyName: item['companyName'].toString(),
                    // dayNumber: item['dayNumber'].toString(),
                    // deleted: item['deleted'].toString(),
                    // finishDate: item['finishDate'].toString(),
                    // id: item['id'].toString(),
                    isActive: item['isActive'].toString(),
                    // startDate: item['startDate'].toString(),
                    // timeFinish: item['timeFinish'].toString(),
                    timeId: item['timeId'].toString(),
                    id: item['id'].toString(),
                    timeLable: item['timeLable'].toString(),
                    // timeStart: item['timeStart'].toString(),
                  )) ==
                  true
              ? null
              : list_time.add(Time(
                  // dayName: item['dayName'].toString(),
                  // companyId: item['companyId'].toString(),
                  // companyName: item['companyName'].toString(),
                  // dayNumber: item['dayNumber'].toString(),
                  // deleted: item['deleted'].toString(),
                  // finishDate: item['finishDate'].toString(),
                  // id: item['id'].toString(),
                  isActive: item['isActive'].toString(),
                  // startDate: item['startDate'].toString(),
                  // timeFinish: item['timeFinish'].toString(),
                  id: item['id'].toString(),
                  timeId: item['timeId'].toString(),
                  timeLable: item['timeLable'].toString(),
                  // timeStart: item['timeStart'].toString(),
                ));
        }
        listdate_time_.contains(ServiceTime(
                  dayName: item['dayName'].toString(),
                  dayOfMonth: item['dayOfMonth'].toString(),
                  itemDate: item['itemDate'].toString(),
                  month: item['month'].toString(),
                  monthName: item['monthName'].toString(),
                  times: list_time,
                )) ==
                true
            ? null
            : listdate_time_.add(ServiceTime(
                dayName: item['dayName'].toString(),
                dayOfMonth: item['dayOfMonth'].toString(),
                itemDate: item['itemDate'].toString(),
                month: item['month'].toString(),
                monthName: item['monthName'].toString(),
                times: list_time,
              ));
      }
      await choosenTime.addAll(listdate_time_[0].times);
      date_time.value = listdate_time_[0].itemDate;
      // areaid.value = '1';
      // await getarea(listdate_time_[0].id);
      // date_time_loading.value = false;
      date_time_loading.value = false;
    } catch (e) {
      date_time_loading.value = false;
      // // print(e.response.data);
      //errooor
      // print(e);
    }
    update();
  }

//governorate
  final count = 0.obs;
  @override
  void onInit() {
    getdate_time_();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
