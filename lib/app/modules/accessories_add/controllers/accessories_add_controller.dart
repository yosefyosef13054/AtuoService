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

class AccessoriesAddController extends GetxController {
  //TODO: Implement AccessoriesAddController
  final http = Get.find<HttpService>();
  final RoundedLoadingButtonController btnController =
      new RoundedLoadingButtonController();

  TextEditingController addAddressController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController kmController = TextEditingController();
  TextEditingController whatsNumberController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  var loading = false.obs;
  var emtyList = {
    "id": 0,
    "title": "empty",
    "titleAr": "empty",
    "titleEn": "empty",
    "type": "empty",
    "action": null
  };
//car Regions
  List<CarRegions> carRegions = [];
  var madein = '0'.obs;
  void setMadeINvalue(value) {
    madein.value = value.toString();
    update();
  }

  void getcarRegions() async {
    loading.value = true;
    try {
      var response = await http.get('Region/GetAll');
      await carRegions.clear();
      carRegions.add(CarRegions(id: 0, name: 'select'.tr));
      for (var item in response.data) {
        carRegions.add(CarRegions(
          id: item['id'],
          name: item['name'],
          regionName: item['regionName'],
          regionNameAr: item['regionNameAr'],
          regionNameEn: item['regionNameEn'],
        ));
        // // print(carTypes.length);

      }
    } catch (e) {
      // print(e.response.data);
      loading.value = false;
    }
    await getcatTypes(1);
    await getcarModels(0);
    await getcarYears(0);
    await governorate();
    loading.value = false;
    update();
  }
  //car Regions

  //Car Types

  // final carTypes = List<CarsType>().obs;

// List<CarsType>().obs;
  List<CarsType> carTypes = [];

  var getcatTypesloading = false.obs;
  var cartypeId = '0'.obs;

  void getcatTypes(regionId) async {
    // print(regionId);
    getcatTypesloading.value = true;
    try {
      var response = await http
          .get('ServiceCarType/GetAll?regionId=${regionId.toString()}');
      // print(response.data);
      await carTypes.clear();
      carTypes.add(CarsType(id: 0, title: 'select'.tr));
      for (var item in response.data) {
        carTypes.contains(CarsType(
                    id: item['id'],
                    arrange: item['arrange'],
                    passengers: item['passengers'],
                    refId: item['refId'],
                    services: item['services'],
                    title: item['title'])) ==
                true
            ? null
            : carTypes.add(CarsType(
                id: item['id'],
                arrange: item['arrange'],
                passengers: item['passengers'],
                refId: item['refId'],
                services: item['services'],
                title: item['title']));
        // // print(carTypes.length);

      }
      if (carTypes.isBlank) {
        carTypes.add(CarsType(
            id: emtyList['id'],
            arrange: emtyList['arrange'],
            passengers: emtyList['passengers'],
            refId: emtyList['refId'],
            services: emtyList['services'],
            title: emtyList['title']));
      }
      getcatTypesloading.value = false;
    } catch (e) {
      // print(e.response.data);
      getcatTypesloading.value = false;
    }
    await getcarModels(carTypes[0].id);

    update();
  }
//Car Types

//Car Models

  var carModels = List<CarModels>().obs;
  var getcatModelsloading = false.obs;
  var carmodelId = '0'.obs;

  void getcarModels(cartypeId) async {
    getcatModelsloading.value = true;
    try {
      var response = await http
          .get('ServiceCarModel/GetAll?carTypeId=${cartypeId.toString()}');
      // print(response.data);
      await carModels.clear();
      carModels.add(CarModels(id: 0, title: 'select'.tr));

      for (var item in response.data) {
        carModels.contains(CarModels(
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
            : carModels.add(CarModels(
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

        // // print(carModels.length);

      }
      if (carModels.isBlank) {
        carModels.add(CarModels(id: emtyList['id'], title: emtyList['title']));
      }
      getcatModelsloading.value = false;
    } catch (e) {
      // // print(e.response.data);
      //errooor
      // print(e);
      getcatModelsloading.value = false;
    }
    await getcarYears(carModels[0].id);
    update();
  }
//Car Models

//Car Years
  // List<CarYears> carYears = (<CarYears>[]).obs;

  var listcarYearstart = List<CarYears>().obs;
  var listcarYearsend = List<CarYears>().obs;
  var getcatYearsloading = false.obs;
  var carYearstart = '0'.obs;
  var carYearend = '0'.obs;
  void changeCarYear(value) {
    carYearstart.value = value;
    update();
  }

  void getcarYears(caryearId) async {
    getcatYearsloading.value = true;
    try {
      var response = await http
          .get('ServiceCarYear/GetAll?modelId=${caryearId.toString()}');
      // print(response.data);
      await listcarYearstart.clear();
      await listcarYearsend.clear();
      listcarYearstart.add(CarYears(id: 0, title: 'from'.tr));
      listcarYearsend.add(CarYears(id: 0, title: 'to'.tr));

      for (var item in response.data) {
        listcarYearstart.contains(CarYears(
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
            : listcarYearsend.add(CarYears(
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
        listcarYearsend.contains(CarYears(
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
            : listcarYearstart.add(CarYears(
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
      dio.FormData formData = await dio.FormData.fromMap({
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
      var save = await http.postUrlUpload(
          'ServiceSparePart/UploadFiles', formData,
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
    } else if (carmodelId.value == '0' || cartypeId.value == '0') {
      Fluttertoast.showToast(
          msg: 'choosCarType&Model'.tr,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 0,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      btnController.error();
      Future.delayed(Duration(milliseconds: 1200), () => btnController.reset());
    } else if (carYearend.value == '0' || carYearstart.value == '0') {
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
    } else {
      await saveImages();

      http.postUrl('ServiceSparePart/Add', {
        'regionId': 1.toString(),
        'carTypeId': cartypeId.value.toString(),
        'carModelId': carmodelId.value.toString(),
        'startYear': carYearstart.value.toString(),
        'endYear': carYearend.value.toString(),
        'description': detailsController.text.toString(),
        'phone': mobileController.text.toString(),
        'unitPrice': priceController.text.toString(),
        'areaId': areaid.value.toString(),
        'whatsApp': whatsNumberController.text.toString(),
        'partName': addAddressController.text.toString(),
      }).then((response) {
        // print(response.data);
        // Get.back();
        try {
          // Get.back();
          // // print(response.data.toString());
          // var token = response.data['access_token'];
          // print('');
          // updateUserData(result['token'], result['data'][0]);
          // http.setApiToken(token);

          //  Get.offNamed('/home');
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
        btnController.error();
        Future.delayed(
            Duration(milliseconds: 1200), () => btnController.reset());
        loading.value = false;
        // print(onError);
        Fluttertoast.showToast(
            msg: onError.response.data.toString(),
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 0,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);

        //Get.back();
// onError.response['error_description']
        // // print('Login error ${onError.response.data['error_description']}');
      });
    }
  }

  //Create Add Request
  final count = 0.obs;
  @override
  void onInit() {
    getcarRegions();

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
