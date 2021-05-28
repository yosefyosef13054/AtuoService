import 'dart:io';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
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
import 'package:record/record.dart';
import 'package:path_provider/path_provider.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:permission_handler/permission_handler.dart';

class ScrapRequestController extends GetxController {
  final http = Get.find<HttpService>();
  //TODO: Implement ScrapRequestController
  final RoundedLoadingButtonController btnController =
      new RoundedLoadingButtonController();
  TextEditingController detailsController = TextEditingController();

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

      for (var item in response.data) {
        carRegions.add(CarRegions(
          id: item['id'],
          name: item['name'],
          regionName: item['regionName'],
          regionNameAr: item['regionNameAr'],
          regionNameEn: item['regionNameEn'],
        ));
      }
    } catch (e) {
      // print(e.response.data);
      loading.value = false;
      btnController.error();
      Future.delayed(Duration(milliseconds: 1200), () => btnController.reset());
    }
    await getcatTypes(1);
    await getcarModels(0);
    await getcarYears(0);
    await governorate();
    await getcarSpacialty();
    await getcarLocation();
    // await getcarConditionLists();
    // await governorate();

    loading.value = false;
    update();
  }
  //car Regions

  //Car Types

  // final carTypes = List<CarsType>().obs;

// List<CarsType>().obs;
  var carTypes = List<CarsType>().obs;

  var loading = false.obs;

  var getcatTypesloading = false.obs;
  var cartypeId = '0'.obs;

  void getcatTypes(regionId) async {
    // print(regionId);
    getcatTypesloading.value = true;
    try {
      var response =
          await http.get('ScrapCarType/GetAll?regionId=${regionId.toString()}');
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
      // if (carTypes.isBlank) {
      //   carTypes.add(CarsType(
      //       id: emtyList['id'],
      //       arrange: emtyList['arrange'],
      //       passengers: emtyList['passengers'],
      //       refId: emtyList['refId'],
      //       services: emtyList['services'],
      //       title: emtyList['title']));
      // }
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
          .get('ScrapCarModel/GetAll?carTypeId=${cartypeId.toString()}');
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
  var carYears = List<CarYears>().obs;
  var getcatYearsloading = false.obs;
  var carYear = '0'.obs;
  void changeCarYear(value) {
    carYear.value = value;
    update();
  }

  void getcarYears(caryearId) async {
    getcatYearsloading.value = true;
    try {
      var response = await http
          .get('ServiceCarYear/GetAll?modelId=${caryearId.toString()}');
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

//Car Location
  // List<CarLocation> carLocation = (<CarLocation>[]).obs;
  var carLocation = List<ScrapLocation>().obs;
  var getcatLocationloading = false.obs;
  var locationId = '0'.obs;
  void changelocationId(value) {
    locationId.value = value;
    update();
  }

  void getcarLocation() async {
    getcatLocationloading.value = true;
    try {
      var response = await http.get('ScrapLocation/GetAll');
      // print(response.data);
      await carLocation.clear();
      carLocation.add(ScrapLocation(id: 0, title: 'all'.tr));
      for (var json in response.data) {
        carLocation.contains(ScrapLocation(
                  id: json["id"],
                  title: json["title"],
                  name: json["name"],
                  titleAr: json["titleAr"],
                  titleEn: json["titleEn"],
                )) ==
                true
            ? null
            : carLocation.add(ScrapLocation(
                id: json["id"],
                title: json["title"],
                name: json["name"],
                titleAr: json["titleAr"],
                titleEn: json["titleEn"],
              ));
      }

      getcatLocationloading.value = false;
    } catch (e) {
      // // print(e.response.data);
      //errooor
      // print(e);
      getcatLocationloading.value = false;
    }
    update();
  }

//Car Location

//Car Spaciality
  // List<CarLocation> carLocation = (<CarLocation>[]).obs;
  var carSpacialty = List<ScrapLocation>().obs;
  var spaciaityId = '0'.obs;
  void changespaciaityId(value) {
    spaciaityId.value = value;
    update();
  }

  void getcarSpacialty() async {
    try {
      var response = await http.get('ScrapSpecialty/GetAll');
      // print(response.data);
      await carSpacialty.clear();
      carSpacialty.add(ScrapLocation(id: 0, title: 'all'.tr));
      for (var json in response.data) {
        carSpacialty.contains(ScrapLocation(
                  id: json["id"],
                  title: json["title"],
                  name: json["name"],
                  titleAr: json["titleAr"],
                  titleEn: json["titleEn"],
                )) ==
                true
            ? null
            : carSpacialty.add(ScrapLocation(
                id: json["id"],
                title: json["title"],
                name: json["name"],
                titleAr: json["titleAr"],
                titleEn: json["titleEn"],
              ));
      }
    } catch (e) {
      // // print(e.response.data);
      //errooor
      // print(e);
    }
    update();
  }

//Car Spaciality
//image Upload
  List image = [];
  List listFiles = [];

  double uploading;
  var isuploading = false.obs;
  progressFn(int rec, int total) {
    uploading = (rec / total);
  }

  saveFiles() async {
    try {
      // isuploading.value = true;

      String fileName1 =
          listFiles.length >= 1 ? listFiles[0].path.split('/').last : '';
      String fileName2 =
          listFiles.length >= 2 ? listFiles[1].path.split('/').last : '';
      String fileName3 =
          listFiles.length >= 3 ? listFiles[2].path.split('/').last : '';
      String fileName4 =
          listFiles.length >= 4 ? listFiles[3].path.split('/').last : '';
      String fileName5 =
          listFiles.length >= 5 ? listFiles[4].path.split('/').last : '';
      String fileName6 =
          listFiles.length >= 6 ? listFiles[5].path.split('/').last : '';
      String fileName7 =
          listFiles.length >= 7 ? listFiles[6].path.split('/').last : '';

      dio.FormData formData = dio.FormData.fromMap({
        'file1': listFiles.length >= 1
            ? await dio.MultipartFile.fromFile(listFiles[0].path,
                filename: fileName1)
            : '',
        'file2': listFiles.length >= 2
            ? await dio.MultipartFile.fromFile(listFiles[1].path,
                filename: fileName2)
            : '',
        'file3': listFiles.length >= 3
            ? await dio.MultipartFile.fromFile(listFiles[2].path,
                filename: fileName3)
            : '',
        'file4': listFiles.length >= 4
            ? await dio.MultipartFile.fromFile(listFiles[3].path,
                filename: fileName4)
            : '',
        'file5': listFiles.length >= 5
            ? await dio.MultipartFile.fromFile(listFiles[4].path,
                filename: fileName5)
            : '',
        'file6': await dio.MultipartFile.fromFile(recordFilePath.value,
            filename: recordFilePath.split('/').last),
        'file7': listFiles.length >= 7
            ? await dio.MultipartFile.fromFile(listFiles[6].path,
                filename: fileName7)
            : '',
      });

      // // print(uploadList.map((key, value) => value));
      var save = await http.postUrlUpload('ScrapOrders/UploadFiles', formData,
          onSendProgress: progressFn, onRecieveProgress: progressFn);
      print(save);
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
      print(e.response);
      print(e.response.data);
    }
    update();
  }

  var uploadedImage = false.obs;
  var photoAdded = 0.obs;
  Future getImage(ctx) async {
    final picker = ImagePicker();
    var pickedimage = await picker.getImage(
      source: ImageSource.gallery,
    );
    if (pickedimage != null && image.length <= 5) {
      listFiles.add(File(pickedimage.path));
      image.add(File(pickedimage.path));
      photoAdded++;
      uploadedImage.value = true;
    } else if (image.length == 6) {
      Fluttertoast.showToast(
          msg: 'maxImages'.tr,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 0,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }

    // // print('allfiles');
    // // print(listFiles.length);
    // // print('allfiles');

    // // print('imagees');
    // // print(image.length);
    // // print('imagees');

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

  void removeImage(index, {item}) {
    image.removeAt(index);
    listFiles.removeWhere((element) => element.toString() == item.toString());
    photoAdded--;
    update();
  }

//image Upload
  final count = 0.obs;

  static RxInt recordNum = RxInt(0);
  static RxString recordTime = RxString("");
  final StopWatchTimer stopWatchTimer = StopWatchTimer();

  static Future<bool> checkPermission() async {
    if (!await Permission.microphone.isGranted) {
      PermissionStatus status = await Permission.microphone.request();
      if (status != PermissionStatus.granted) {
        return false;
      }
    }
    return true;
  }

  var recordFilePath = ''.obs;
  var isRecording = false.obs;
  var avaToPlayRecord = false.obs;
  static Future<String> getFilePath() async {
    Directory storageDirectory = await getApplicationDocumentsDirectory();
    String sdPath = storageDirectory.path + "/record";
    var d = Directory(sdPath);
    if (!d.existsSync()) {
      d.createSync(recursive: true);
    }
    return sdPath + "/auto_serv_${recordNum.value++}.mp3";
  }

  //start
  startRecord() async {
    bool hasPermission = await checkPermission();
    if (hasPermission) {
      recordFilePath.value = "";
      avaToPlayRecord(false);
      stopWatchTimer.onExecute.add(StopWatchExecute.start);
      recordFilePath.value = await getFilePath();
      // print("This is Path: ${recordFilePath.value}");
      await Record.start(
        path: recordFilePath.value, // required
        encoder: AudioEncoder.AAC, // by default
        bitRate: 128000,
      );
      isRecording.value = true;
    } else {
      // print("No microphone permission");
    }
  }

  //stop
  // var locationIds = List<CarYears>().obs;
  var assetsAudioPlayer = AssetsAudioPlayer().obs;

  stopRecord() async {
    Record.stop();
    stopWatchTimer.onExecute.add(StopWatchExecute.reset);
    // recording(false);
    // assetsAudioPlayer.value.open(
    //   Audio.file(recordFilePath.value),
    // );
    isRecording.value = false;
    avaToPlayRecord.value = true;
  }
  //record
  // String path;
  //isRecording.value = await Record.isRecording();
  //  void record() async {
  //    final dir = await getApplicationDocumentsDirectory();
  //    path = dir.path +
  //        '/' +
  //        DateTime.now().millisecondsSinceEpoch.toString() +
  //        '.mp3';

  //    bool result = await Record.hasPermission();

  //    if (isRecording.value == true) {
  //      await Record.stop();
  //      listFiles.add(File(path));
  //      isRecording.value = await Record.isRecording();

  //    } else {
  //      if (result) {
  //        await Record.start(
  //          path: path,  required
  //        );
  //        isRecording.value = await Record.isRecording();
  //      }
  //    }
  //    // print(isRecording.value);
  //  }

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

  //Create Add Request
  void submit(context) async {
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
    } else if (madein.value == '0') {
      Fluttertoast.showToast(
          msg: 'carRegionSelect'.tr,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 0,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      btnController.error();
      Future.delayed(Duration(milliseconds: 1200), () => btnController.reset());
    }
    //  else if (locationId.value == '0') {
    //   Fluttertoast.showToast(
    //       msg: 'chooseArea'.tr,
    //       toastLength: Toast.LENGTH_LONG,
    //       gravity: ToastGravity.TOP,
    //       timeInSecForIosWeb: 0,
    //       backgroundColor: Colors.red,
    //       textColor: Colors.white,
    //       fontSize: 16.0);
    //   btnController.error();
    //   Future.delayed(Duration(milliseconds: 1200), () => btnController.reset());
    // }
    else if (carmodelId.value == '0' || cartypeId.value == '0') {
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
    } else if (recordFilePath.value == '') {
      Fluttertoast.showToast(
          msg: 'recordValidation'.tr,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 0,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      btnController.error();
      Future.delayed(Duration(milliseconds: 1200), () => btnController.reset());
    } else {
      await saveFiles();

      http.postUrl('ScrapOrders/Add', {
        'description': detailsController.text.toString(),
        'regionId': madein.value.toString(),
        'carTypeId': cartypeId.value.toString(),
        'modelId': carmodelId.value.toString(),
        'carYear': carYear.value.toString(),
        'locationId': locationId.value == '0' ? null : locationId.value,
        'specialtyId': spaciaityId.value == '0' ? null : spaciaityId.value,
      }).then((response) {
        print(response);
        try {
          Future.delayed(Duration(milliseconds: 10), () {
            Fluttertoast.showToast(
                msg: 'created_Request_Successfully'.tr,
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.TOP,
                timeInSecForIosWeb: 0,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.0);
          });
          // /used-cars-add
          btnController.success();
          Future.delayed(
              Duration(milliseconds: 600), () => btnController.reset());
          Future.delayed(Duration(milliseconds: 600),
              () => Get.offAndToNamed('/scrap-orders'));
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
        // // print('eroooooooor');
        // // print(onError.response);
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

// To parse this JSON data, do
//
//     final scrapLocation = scrapLocationFromJson(jsonString);

List<ScrapLocation> scrapLocationFromJson(String str) =>
    List<ScrapLocation>.from(
        json.decode(str).map((x) => ScrapLocation.fromJson(x)));

String scrapLocationToJson(List<ScrapLocation> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ScrapLocation {
  ScrapLocation({
    this.id,
    this.title,
    this.name,
    this.titleAr,
    this.titleEn,
  });

  int id;
  String title;
  String name;
  String titleAr;
  String titleEn;

  factory ScrapLocation.fromJson(Map<String, dynamic> json) => ScrapLocation(
        id: json["id"],
        title: json["title"],
        name: json["name"],
        titleAr: json["titleAr"],
        titleEn: json["titleEn"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "name": name,
        "titleAr": titleAr,
        "titleEn": titleEn,
      };
}
