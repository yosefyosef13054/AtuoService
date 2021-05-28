import 'dart:io';

import 'package:get/get.dart';
import '../../../services/httpService.dart';
import 'package:autoservice/app/modules/usedCars_add/models/model.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart' as dio;
import 'package:autoservice/app/widgets/MyAlertDialog.dart';
import 'package:autoservice/app/modules/HomeScreen/views/home_screen_view.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:autoservice/app/Colors.dart';

import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HeavyCarsAddController extends GetxController {
  //TODO: Implement HeavyCarsAddController
  final RoundedLoadingButtonController btnController =
      new RoundedLoadingButtonController();
  final http = Get.find<HttpService>();
  TextEditingController addAddressController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController kmController = TextEditingController();
  TextEditingController whatsNumberController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  var loading = false.obs;

//Car Years
  // List<CarYears> carYears = (<CarYears>[]).obs;
  List<CarYears> carYears = [];

  var getcatYearsloading = false.obs;
  var carYear = '0'.obs;
  void changeCarYear(value) {
    carYear.value = value;
    update();
  }

  var emtyList = {
    "id": 0,
    "title": "empty",
    "titleAr": "empty",
    "titleEn": "empty",
    "type": "empty",
    "action": null
  };
  void getcarYears() async {
    getcatYearsloading.value = true;
    try {
      var response = await http.get('DefaultLists/GetYears');
      // print(response.data);
      await carYears.clear();
      for (var item in response.data) {
        carYears.contains(CarYears(
                    id: item['id'],
                    carTypeId: item['carTypeId'],
                    carTypeName: item['carTypeName'],
                    modelName: item['modelName'],
                    name: item['name'],
                    regionId: item['regionId'],
                    regionName: item['regionName'],
                    titleAr: item['titleAr'],
                    titleEn: item['titleEn'],
                    title: item['title'])) ==
                true
            ? null
            : carYears.add(CarYears(
                id: item['id'],
                carTypeId: item['carTypeId'],
                carTypeName: item['carTypeName'],
                modelName: item['modelName'],
                name: item['name'],
                regionId: item['regionId'],
                regionName: item['regionName'],
                titleAr: item['titleAr'],
                titleEn: item['titleEn'],
                title: item['title']));
      }

      await governorate();
      getcatYearsloading.value = false;
    } catch (e) {
      // // print(e.response.data);
      //errooor
      // print(e);
      getcatYearsloading.value = false;
    }
    update();
  }

//Car Years
//governorate
  var governorateid = '0'.obs;
  var listgovernorate = List<Governorate>().obs;
  var governorateloading = false.obs;
  void governorate() async {
    governorateloading.value = true;
    try {
      var response = await http.get('AddressArea/GetAllParent');
      // print(response.data);
      await listgovernorate.clear();
      listgovernorate.add(Governorate(id: 0, areaName: 'select'.tr));
      for (var item in response.data) {
        listgovernorate.contains(Governorate(
                  id: item['id'],
                  areaName: item['areaName'],
                  areaNameAr: item['areaNameAr'],
                  areaNameEn: item['areaNameEn'],
                  deliveryCharge: item['deliveryCharge'],
                  parentId: item['parentId'],
                  parentName: item['parentName'],
                  status: item['carTystatuspeId'],
                  statusComment: item['statusComment'],
                  statusName: item['statusName'],
                )) ==
                true
            ? null
            : listgovernorate.add(Governorate(
                id: item['id'],
                areaName: item['areaName'],
                areaNameAr: item['areaNameAr'],
                areaNameEn: item['areaNameEn'],
                deliveryCharge: item['deliveryCharge'],
                parentId: item['parentId'],
                parentName: item['parentName'],
                status: item['carTystatuspeId'],
                statusComment: item['statusComment'],
                statusName: item['statusName'],
              ));
      }
      areaid.value = '0';
      await getarea(listgovernorate[0].id);
      governorateloading.value = false;
    } catch (e) {
      governorateloading.value = false;
      // // print(e.response.data);
      //errooor
      // print(e);
    }
    update();
  }
//governorate

//area
  var areaid = '0'.obs;
  var listarea = List<Governorate>().obs;
  void getarea(governateId) async {
    governorateloading.value = true;
    try {
      var response = await http
          .get('AddressArea/GetByParentId?parentId=${governateId.toString()}');
      // print(response.data);
      await listarea.clear();
      listarea.add(Governorate(id: 0, areaName: 'select'.tr));
      for (var item in response.data) {
        listarea.contains(Governorate(
                  id: item['id'],
                  areaName: item['areaName'],
                  areaNameAr: item['areaNameAr'],
                  areaNameEn: item['areaNameEn'],
                  deliveryCharge: item['deliveryCharge'],
                  parentId: item['parentId'],
                  parentName: item['parentName'],
                  status: item['carTystatuspeId'],
                  statusComment: item['statusComment'],
                  statusName: item['statusName'],
                )) ==
                true
            ? null
            : listarea.add(Governorate(
                id: item['id'],
                areaName: item['areaName'],
                areaNameAr: item['areaNameAr'],
                areaNameEn: item['areaNameEn'],
                deliveryCharge: item['deliveryCharge'],
                parentId: item['parentId'],
                parentName: item['parentName'],
                status: item['carTystatuspeId'],
                statusComment: item['statusComment'],
                statusName: item['statusName'],
              ));
      }
      // if (listarea.isBlank) {
      //   listarea
      //       .add(Governorate(id: emtyList['id'], areaName: emtyList['title']));
      // }
      governorateloading.value = false;
    } catch (e) {
      // // print(e.response.data);
      //errooor
      // print(e);
    }
    update();
  }

//area
//image Upload
  List<File> image = [];
  double uploading;
  var isuploading = false.obs;
  progressFn(int rec, int total) {
    uploading = (rec / total);
  }

  saveImages() async {
    try {
      // isuploading.value = true;

      String fileName1 = image.length >= 1 ? image[0].path.split('/').last : '';
      String fileName2 = image.length >= 2 ? image[1].path.split('/').last : '';
      String fileName3 = image.length >= 3 ? image[2].path.split('/').last : '';
      String fileName4 = image.length >= 4 ? image[3].path.split('/').last : '';
      String fileName5 = image.length >= 5 ? image[4].path.split('/').last : '';

      dio.FormData formData = dio.FormData.fromMap({
        'file1': image.length >= 1
            ? await dio.MultipartFile.fromFile(image[0].path,
                filename: fileName1)
            : '',
        'file2': image.length >= 2
            ? await dio.MultipartFile.fromFile(image[1].path,
                filename: fileName2)
            : '',
        'file3': image.length >= 3
            ? await dio.MultipartFile.fromFile(image[2].path,
                filename: fileName3)
            : '',
        'file4': image.length >= 4
            ? await dio.MultipartFile.fromFile(image[3].path,
                filename: fileName4)
            : '',
        'file5': image.length >= 5
            ? await dio.MultipartFile.fromFile(image[4].path,
                filename: fileName5)
            : '',
      });

      // // print(uploadList.map((key, value) => value));
      var save = await http.postUrlUpload('ServiceTruck/UploadFiles', formData,
          onSendProgress: progressFn, onRecieveProgress: progressFn);
      // print(save);
      image = [];
      // Navigator.pushReplacementNamed(context, ProfileViewScreen.routeName);
      // isuploading.value = false;
    } catch (e) {
      btnController.error();
      Future.delayed(Duration(milliseconds: 1200), () => btnController.reset());
      Fluttertoast.showToast(
          msg: 'timout'.tr,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 0,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      // isuploading.value = false;
      // print(e.response.data);
    }
    update();
  }

  var uploadedImage = false.obs;
  var photoAdded = 0.obs;
  Future getImage(ctx) async {
    var pickedimage = await ImagePicker.pickImage(
      source: ImageSource.gallery,
    );
    // if (pickedimage != null && image.length <= 2) {
    //   image.add(pickedimage);
    //   photoAdded++;
    //   uploadedImage.value = true;
    // } else if (image.length == 6) {
    //   Fluttertoast.showToast(
    //       msg: 'maxImages'.tr
    //       toastLength: Toast.LENGTH_LONG,
    //       gravity: ToastGravity.TOP,
    //       timeInSecForIosWeb: 0,
    //       backgroundColor: Colors.red,
    //       textColor: Colors.white,
    //       fontSize: 16.0);
    // }
    pickedimage != null && image.length <= 5 ? image.add(pickedimage) : null;
    pickedimage != null && image.length <= 5 ? photoAdded++ : null;
    pickedimage != null && image.length <= 5
        ? uploadedImage.value = true
        : null;
    image.length <= 5
        ? null
        : Fluttertoast.showToast(
            msg: 'maxImages'.tr,
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 0,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
    // // print('imaageeeeeeeeeeeeeee');
    // // print(image.path);
    // // print('imaageeeeeeeeeeeeeee');
    update();
    // saveImage(ctx);
  }

  void removeImage(index) {
    image.removeAt(index);
    photoAdded--;
    update();
  }
//image Upload

//Create Add Request
  void submit(context) async {
    // if (loading.value == true) {
    //   showDialog(
    //     context: context,
    //     builder: (context) => Center(
    //       child: SpinKitRing(
    //         color: AppColors.primaryColor,
    //         size: 50,
    //       ),
    //     ),
    //   );
    // }
    if (image.length < 1) {
      Future.delayed(Duration(milliseconds: 10), () {
        Fluttertoast.showToast(
            msg: 'minimum'.tr,
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 0,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      });
      btnController.error();
      Future.delayed(Duration(milliseconds: 1200), () => btnController.reset());
    } else if (carYear.value == '0') {
      Fluttertoast.showToast(
          msg: 'selectYear'.tr,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 0,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      btnController.error();
      Future.delayed(Duration(milliseconds: 1200), () => btnController.reset());
    } else if (governorateid.value == '0' || areaid.value == '0') {
      Fluttertoast.showToast(
          msg: 'chooseArea'.tr,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 0,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      btnController.error();
      Future.delayed(Duration(milliseconds: 1200), () => btnController.reset());
    } else {
      await saveImages();

      http.postUrl('ServiceTruck/Add', {
        'carYearId': carYear.value.toString(),
        'description': detailsController.text.toString(),
        'partName': addAddressController.text.toString(),
        'areaId': areaid.value.toString(),
        'whatsApp': whatsNumberController.text.toString(),
        'phone': mobileController.text.toString(),
        'unitPrice': priceController.text.toString(),
      }).then((response) {
        // print(response);

        // Get.back();
        try {
          Future.delayed(Duration(milliseconds: 10), () {
            Fluttertoast.showToast(
                msg: 'created_Add_Successfully'.tr,
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.TOP,
                timeInSecForIosWeb: 0,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.0);
          });

          btnController.success();
          Future.delayed(
              Duration(milliseconds: 600), () => btnController.reset());
          Future.delayed(Duration(milliseconds: 600), () => Get.back());
          loading.value = false;
        } catch (e) {
          btnController.error();
          Future.delayed(
              Duration(milliseconds: 1200), () => btnController.reset());
          loading.value = false;
          // print("Exepition with Login : ${e}");
        }
      }).catchError((onError) {
        loading.value = false;
        btnController.error();
        Future.delayed(
            Duration(milliseconds: 1200), () => btnController.reset());
        // print(onError);
        Fluttertoast.showToast(
            msg: onError.response.data.toString(),
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 0,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      });
    }
  }

  //Create Add Request
  @override
  void onInit() {
    getcarYears();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
