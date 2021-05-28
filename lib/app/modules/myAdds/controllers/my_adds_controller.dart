import 'package:autoservice/app/modules/myAdds/model.dart';
import 'package:get/get.dart';
import '../../../services/httpService.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyAddsController extends GetxController {
  //TODO: Implement MyAddsController
  final http = Get.find<HttpService>();
  var loading = false.obs;
  var isAccessories = false.obs;
  var isscrapCars = false.obs;
  var isusedCars = false.obs;
  var itrucks = false.obs;
  //Car Items

  var scrapCarsList = List<Car>().obs;
  var accessoriesList = List<Accessory>().obs;
  var usedCarsList = List<Car>().obs;
  var trucksList = List<Truck>().obs;
  void getallAdds() async {
    loading.value = true;

    try {
      var response = await http.get('Client/GetMyAds');
      // allAdds = MyAdds.fromJson(response.data);

      //  await usedCarList.clear();
      var scrapCarsjson = response.data['scrapCars'];
      var accessoriesjson = response.data['accessories'];
      var usedCarsjson = response.data['usedCars'];
      var trucksjson = response.data['trucks'];
      // // print('init');
      // // // print(response.data['scrapCars'].toString());
      for (var json in scrapCarsjson) {
        List<ScrapCarImage> imagesModel = [];

        for (var item in json['images']) {
          // // print(item['id']);
          imagesModel.add(ScrapCarImage(
            id: item["id"],
            carId: item["carId"],
            carName: item["carName"],
            imageUrl: item["imageURL"],
            fileName: item["fileName"],
            isCover: item["isCover"],
          ));
          // // print(imagesModel.length);
        }

        scrapCarsList.contains(Car(
                    id: json["id"],
                    adType: json["adType"],
                    regionId: json["regionId"],
                    clientId: json["clientId"],
                    imageUrl: json["imageURL"],
                    clientName: json["clientName"],
                    regionName: json["regionName"],
                    carTypeId: json["carTypeId"],
                    carTypeName: json["carTypeName"],
                    carModelId: json["carModelId"],
                    carModelName: json["carModelName"],
                    carYearId: json["carYearId"],
                    carYearName: json["carYearName"],
                    partNameEn: json["partNameEn"],
                    partNameAr: json["partNameAr"],
                    kmCounter: json["kmCounter"],
                    descriptionEn: json["descriptionEn"] == null
                        ? ''
                        : json["descriptionEn"],
                    descriptionAr: json["descriptionAr"] == null
                        ? ''
                        : json["descriptionAr"],
                    description:
                        json["description"] == null ? '' : json["description"],
                    unitPrice: json["unitPrice"].toString(),
                    phone: json["phone"],
                    status: json["status"],
                    outsideStatusId: json["outsideStatusId"],
                    outsideStatusName: json["outsideStatusName"],
                    machineStatusId: json["machineStatusId"] == null
                        ? ''
                        : json["machineStatusId"],
                    machineStatusName: json["machineStatusName"] == null
                        ? ''
                        : json["machineStatusName"],
                    gearsStatusId: json["gearsStatusId"] == null
                        ? ''
                        : json["gearsStatusId"],
                    gearsStatusName: json["gearsStatusName"] == null
                        ? ''
                        : json["gearsStatusName"],
                    tiresStatusId: json["tiresStatusId"],
                    tiresStatusName: json["tiresStatusName"],
                    carTransferTypeId: json["carTransferTypeId"] == null
                        ? ''
                        : json["carTransferTypeId"],
                    carTransferTypeName: json["carTransferTypeName"] == null
                        ? ''
                        : json["carTransferTypeName"],
                    areaId: json["areaId"],
                    areaName: json["areaName"],
                    whatsApp: json["whatsApp"],
                    partName: json["partName"],
                    insideStatusId: json["insideStatusId"] == null
                        ? ''
                        : json["insideStatusId"],
                    insideStatusName: json["insideStatusName"] == null
                        ? ''
                        : json["insideStatusName"],
                    electricityStatusId: json["electricityStatusId"] == null
                        ? ''
                        : json["electricityStatusId"],
                    electricityStatusName: json["electricityStatusName"] == null
                        ? ''
                        : json["electricityStatusName"],
                    carCheckId:
                        json["carCheckId"] == null ? '' : json["carCheckId"],
                    carCheckName: json["carCheckName"] == null
                        ? ''
                        : json["carCheckName"],
                    carCheckComment: json["carCheckComment"],
                    images: imagesModel)) ==
                true
            ? null
            : scrapCarsList.add(
                Car(kmCounter: json["kmCounter"], adType: json["adType"], id: json["id"], regionId: json["regionId"], clientId: json["clientId"], imageUrl: json["imageURL"], clientName: json["clientName"], regionName: json["regionName"], carTypeId: json["carTypeId"], carTypeName: json["carTypeName"], carModelId: json["carModelId"], carModelName: json["carModelName"], carYearId: json["carYearId"], carYearName: json["carYearName"], partNameEn: json["partNameEn"], partNameAr: json["partNameAr"], descriptionEn: json["descriptionEn"] == null ? '' : json["descriptionEn"], descriptionAr: json["descriptionAr"] == null ? '' : json["descriptionAr"], description: json["description"] == null ? '' : json["description"], unitPrice: json["unitPrice"].toString(), phone: json["phone"], status: json["status"], outsideStatusId: json["outsideStatusId"], outsideStatusName: json["outsideStatusName"], machineStatusId: json["machineStatusId"] == null ? '' : json["machineStatusId"], machineStatusName: json["machineStatusName"] == null ? '' : json["machineStatusName"], gearsStatusId: json["gearsStatusId"] == null ? '' : json["gearsStatusId"], gearsStatusName: json["gearsStatusName"] == null ? '' : json["gearsStatusName"], tiresStatusId: json["tiresStatusId"], tiresStatusName: json["tiresStatusName"], carTransferTypeId: json["carTransferTypeId"] == null ? '' : json["carTransferTypeId"], carTransferTypeName: json["carTransferTypeName"] == null ? '' : json["carTransferTypeName"], areaId: json["areaId"], areaName: json["areaName"], whatsApp: json["whatsApp"], partName: json["partName"], insideStatusId: json["insideStatusId"] == null ? '' : json["insideStatusId"], insideStatusName: json["insideStatusName"] == null ? '' : json["insideStatusName"], electricityStatusId: json["electricityStatusId"] == null ? '' : json["electricityStatusId"], electricityStatusName: json["electricityStatusName"] == null ? '' : json["electricityStatusName"], carCheckId: json["carCheckId"] == null ? '' : json["carCheckId"], carCheckName: json["carCheckName"] == null ? '' : json["carCheckName"], carCheckComment: json["carCheckComment"], images: imagesModel));
      }

      for (var json in accessoriesjson) {
        List imagesModel = [];

        imagesModel.addAll(json['images']);

        accessoriesList.contains(Accessory(
                    adType: json["adType"],
                    id: json["id"],
                    regionId: json["regionId"],
                    imageUrl: json["imageURL"],
                    regionName: json["regionName"],
                    startYear:
                        json["startYear"] == null ? '' : json["startYear"],
                    endYear: json["endYear"] == null ? '' : json["endYear"],
                    clientId: json["clientId"],
                    clientName: json["clientName"],
                    carTypeId: json["carTypeId"],
                    carTypeName: json["carTypeName"],
                    carModelId: json["carModelId"],
                    carModelName: json["carModelName"],
                    carYearId:
                        json["carYearId"] == null ? '' : json["carYearId"],
                    carYearName:
                        json["carYearName"] == null ? '' : json["carYearName"],
                    partNameEn: json["partNameEn"],
                    partNameAr: json["partNameAr"],
                    partName: json["partName"],
                    descriptionEn: json["descriptionEn"],
                    descriptionAr: json["descriptionAr"],
                    description: json["description"],
                    unitPrice: json["unitPrice"].toString(),
                    phone: json["phone"],
                    status: json["status"],
                    areaId: json["areaId"],
                    areaName: json["areaName"],
                    whatsApp: json["whatsApp"],
                    images: imagesModel)) ==
                true
            ? null
            : accessoriesList.add(Accessory(
                adType: json["adType"],
                id: json["id"],
                regionId: json["regionId"],
                imageUrl: json["imageURL"],
                regionName: json["regionName"],
                startYear: json["startYear"] == null ? '' : json["startYear"],
                endYear: json["endYear"] == null ? '' : json["endYear"],
                clientId: json["clientId"],
                clientName: json["clientName"],
                carTypeId: json["carTypeId"],
                carTypeName: json["carTypeName"],
                carModelId: json["carModelId"],
                carModelName: json["carModelName"],
                carYearId: json["carYearId"] == null ? '' : json["carYearId"],
                carYearName:
                    json["carYearName"] == null ? '' : json["carYearName"],
                partNameEn: json["partNameEn"],
                partNameAr: json["partNameAr"],
                partName: json["partName"],
                descriptionEn: json["descriptionEn"],
                descriptionAr: json["descriptionAr"],
                description: json["description"],
                unitPrice: json["unitPrice"].toString(),
                phone: json["phone"],
                status: json["status"],
                areaId: json["areaId"],
                areaName: json["areaName"],
                whatsApp: json["whatsApp"],
                images: imagesModel));
      }

      for (var json in usedCarsjson) {
        List<ScrapCarImage> imagesModel = [];

        for (var item in json['images']) {
          // // print(item['id']);
          imagesModel.add(ScrapCarImage(
            id: item["id"],
            carId: item["carId"],
            carName: item["carName"],
            imageUrl: item["imageURL"],
            fileName: item["fileName"],
            isCover: item["isCover"],
          ));
          // // print(imagesModel.length);
        }

        usedCarsList.contains(Car(
                    kmCounter: json["kmCounter"],
                    carCheckName: json["carCheckName"] == null
                        ? ''
                        : json["carCheckName"],
                    adType: json["adType"],
                    id: json["id"].toString(),
                    regionId: json["regionId"].toString(),
                    clientId: json["clientId"].toString(),
                    imageUrl: json["imageURL"].toString(),
                    clientName: json["clientName"].toString(),
                    regionName: json["regionName"].toString(),
                    carTypeId: json["carTypeId"].toString(),
                    carTypeName: json["carTypeName"].toString(),
                    carModelId: json["carModelId"].toString(),
                    carModelName: json["carModelName"].toString(),
                    carYearId: json["carYearId"].toString(),
                    carYearName: json["carYearName"].toString(),
                    partNameEn: json["partNameEn"].toString(),
                    partNameAr: json["partNameAr"].toString(),
                    descriptionEn: json["descriptionEn"] == null
                        ? ''
                        : json["descriptionEn"].toString(),
                    descriptionAr: json["descriptionAr"] == null
                        ? ''
                        : json["descriptionAr"].toString(),
                    description: json["description"] == null
                        ? ''
                        : json["description"].toString(),
                    unitPrice: json["unitPrice"].toString(),
                    phone:
                        json["phone"] == null ? '' : json["phone"].toString(),
                    status: json["status"].toString(),
                    outsideStatusId: json["outsideStatusId"].toString(),
                    outsideStatusName: json["outsideStatusName"].toString(),
                    machineStatusId: json["machineStatusId"].toString(),
                    machineStatusName: json["machineStatusName"].toString(),
                    gearsStatusId: json["gearsStatusId"].toString(),
                    gearsStatusName: json["gearsStatusName"].toString(),
                    tiresStatusId: json["tiresStatusId"].toString(),
                    tiresStatusName: json["tiresStatusName"].toString(),
                    carTransferTypeId: json["carTransferTypeId"].toString(),
                    carTransferTypeName: json["carTransferTypeName"].toString(),
                    areaId:
                        json["areaId"] == null ? '' : json["areaId"].toString(),
                    areaName: json["areaName"] == null
                        ? ''
                        : json["areaName"].toString(),
                    whatsApp: json["whatsApp"] == null
                        ? ''
                        : json["whatsApp"].toString(),
                    images: imagesModel)) ==
                true
            ? null
            : usedCarsList.add(Car(
                kmCounter: json["kmCounter"],
                carCheckName:
                    json["carCheckName"] == null ? '' : json["carCheckName"],
                adType: json["adType"],
                id: json["id"].toString(),
                regionId: json["regionId"].toString(),
                clientId: json["clientId"].toString(),
                imageUrl: json["imageURL"].toString(),
                clientName: json["clientName"].toString(),
                regionName: json["regionName"].toString(),
                carTypeId: json["carTypeId"].toString(),
                carTypeName: json["carTypeName"].toString(),
                carModelId: json["carModelId"].toString(),
                carModelName: json["carModelName"].toString(),
                carYearId: json["carYearId"].toString(),
                carYearName: json["carYearName"].toString(),
                partNameEn: json["partNameEn"].toString(),
                partNameAr: json["partNameAr"].toString(),
                descriptionEn: json["descriptionEn"] == null
                    ? ''
                    : json["descriptionEn"].toString(),
                descriptionAr: json["descriptionAr"] == null
                    ? ''
                    : json["descriptionAr"].toString(),
                description: json["description"] == null
                    ? ''
                    : json["description"].toString(),
                unitPrice: json["unitPrice"].toString(),
                phone: json["phone"] == null ? '' : json["phone"].toString(),
                status: json["status"].toString(),
                outsideStatusId: json["outsideStatusId"].toString(),
                outsideStatusName: json["outsideStatusName"].toString(),
                machineStatusId: json["machineStatusId"].toString(),
                machineStatusName: json["machineStatusName"].toString(),
                gearsStatusId: json["gearsStatusId"].toString(),
                gearsStatusName: json["gearsStatusName"].toString(),
                tiresStatusId: json["tiresStatusId"].toString(),
                tiresStatusName: json["tiresStatusName"].toString(),
                carTransferTypeId: json["carTransferTypeId"].toString(),
                carTransferTypeName: json["carTransferTypeName"].toString(),
                areaId: json["areaId"] == null ? '' : json["areaId"].toString(),
                areaName:
                    json["areaName"] == null ? '' : json["areaName"].toString(),
                whatsApp:
                    json["whatsApp"] == null ? '' : json["whatsApp"].toString(),
                images: imagesModel));
      }

      for (var json in trucksjson) {
        List<TruckImage> imagesModel = [];

        for (var item in json['images']) {
          // // print(item['id']);
          imagesModel.add(TruckImage(
            id: item["id"],
            truckId: item["truckId"],
            truckName: item["truckName"],
            imageUrl: item["imageURL"],
            fileName: item["fileName"],
            isCover: item["isCover"],
          ));
          // // print(imagesModel.length);
        }

        trucksList.contains(Truck(
                    adType: json["adType"],
                    id: json["id"],
                    clientId: json["clientId"],
                    clientName: json["clientName"],
                    imageUrl: json["imageURL"],
                    carYearId: json["carYearId"],
                    carYearName: json["carYearName"],
                    partNameEn: json["partNameEn"],
                    partNameAr: json["partNameAr"],
                    descriptionEn: json["descriptionEn"],
                    partName: json["partName"],
                    description: json["description"],
                    descriptionAr: json["descriptionAr"],
                    unitPrice: json["unitPrice"],
                    phone: json["phone"],
                    status: json["status"],
                    areaId: json["areaId"],
                    areaName: json["areaName"],
                    whatsApp: json["whatsApp"],
                    images: imagesModel)) ==
                true
            ? null
            : trucksList.add(Truck(
                adType: json["adType"],
                id: json["id"],
                clientId: json["clientId"],
                clientName: json["clientName"],
                imageUrl: json["imageURL"],
                carYearId: json["carYearId"],
                carYearName: json["carYearName"],
                partNameEn: json["partNameEn"],
                partNameAr: json["partNameAr"],
                descriptionEn: json["descriptionEn"],
                partName: json["partName"],
                description: json["description"],
                descriptionAr: json["descriptionAr"],
                unitPrice: json["unitPrice"],
                phone: json["phone"],
                status: json["status"],
                areaId: json["areaId"],
                areaName: json["areaName"],
                whatsApp: json["whatsApp"],
                images: imagesModel));
      }
      // // print(scrapCarsList.length);
      // // print(accessoriesList.length);
      // // print(usedCarsList.length);
      // // print(trucksList.length);

      // if (usedCarList.isBlank) {}
      loading.value = false;
      // isusedCars.value = true;
    } catch (e) {
      // // // print(e.response.data);
      //errooor
      // // print(e);
      loading.value = false;
    }
    // await getcarYears(carModels[0].id);
    update();
    isscrapCars.value = true;
  }

//Car Items

//Remove Add
  showremoveAddsDialog(context, {id, type, index}) {
    Alert(
      context: context,
      type: AlertType.warning,
      title: "sure_Logout".tr,
      // desc:
      //     "sure_Logout".tr,
      buttons: [
        DialogButton(
          child: Text(
            'remove'.tr,
            textScaleFactor: 1,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () async {
            await removeAd(context, id: id, type: type);
            if (type == 'scrap') {
              scrapCarsList.remove(scrapCarsList[index]);
            } else if (type == 'sparepart') {
              //accessories
              accessoriesList.remove(accessoriesList[index]);
            } else if (type == 'used') {
              //usedcars
              usedCarsList.remove(usedCarsList[index]);
            } else if (type == 'truck') {
              trucksList.remove(trucksList[index]);
            }

            Navigator.of(context).pop();
          },
          color: Color.fromRGBO(0, 179, 134, 1.0),
        ),
        DialogButton(
          child: Text(
            'cancel'.tr,
            textScaleFactor: 1,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          color: Colors.red,
        ),
      ],
    ).show();
  }

  void removeAd(context, {id, type}) async {
    http.postUrl(
        'Client/RemoveAds?id=${id.toString()}&adType=${type.toString()}',
        {}).then((response) {
      try {
        Fluttertoast.showToast(
            msg: 'addressRemoved'.tr,
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 0,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
      } catch (e) {
        loading.value = false;
        // // print("Exepition with Login : ${e}");
      }
    }).catchError((onError) {
      loading.value = false;
      // // print(onError);
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

  @override
  void onInit() {
    super.onInit();
    getallAdds();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
