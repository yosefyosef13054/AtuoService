import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../services/httpService.dart';
import 'package:autoservice/app/modules/usedCars_add/models/model.dart';
import 'package:autoservice/app/modules/new_accessories/model.dart';

class ChoosenList {
  ChoosenList({this.id, this.name, this.type
      // this.regionNameAr,
      // this.regionNameEn,
      });

  int id;
  String name;
  String type;

  // String regionNameAr;
  // String regionNameEn;
}

class UsedAccessoriesController extends GetxController {
  //TODO: Implement NewAccessoriesController

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

//governorate
  var governorateid = '0'.obs;
  List<Governorate> listgovernorate = [];
  var governorateloading = false.obs;
  void getgovernorate() async {
    governorateloading.value = true;
    try {
      var response = await http.get('AddressArea/GetAllParent');
      // print(response.data);
      await listgovernorate.clear();
      // listgovernorate.add(Governorate(id: 0, areaName: 'select'.tr));
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
      // areaid.value = '1';
      // await getarea(listgovernorate[0].id);
      // governorateloading.value = false;
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

  //car Filtering

  var isregionList = true.obs;
  var istypeList = false.obs;
  var ismodelList = false.obs;
  var isyearList = false.obs;
  var noMoreFilters = false.obs;
  var choosenList = List<ChoosenList>().obs;

  void addChoosenFilter({id, name, type}) {
    choosenList.add(ChoosenList(id: id, name: name, type: type));
    update();
  }

  void removeChoosenFilter({ChoosenList item}) {
    if (item.type == 'isregionList') {
      choosenList.clear();
      getaccessoriesList(
          carTypeId: 0,
          modelId: 0,
          regionId: 0,
          yearId: 0,
          areaId: governorateid.value);
      madein.value = '0';
      cartypeId.value = '0';
      carmodelId.value = '0';
      carYear.value = '0';
    } else if (item.type == 'istypeList') {
      cartypeId.value = '0';
      carmodelId.value = '0';
      carYear.value = '0';
      choosenList.remove(item);
      choosenList.removeWhere((element) => element.type == 'ismodelList');
      choosenList.removeWhere((element) => element.type == 'isyearList');
      getaccessoriesList(
          carTypeId: 0,
          modelId: 0,
          regionId: madein.value,
          yearId: 0,
          areaId: governorateid.value);
    } else if (item.type == 'ismodelList') {
      carmodelId.value = '0';
      carYear.value = '0';
      choosenList.remove(item);
      choosenList.removeWhere((element) => element.type == 'isyearList');
      getaccessoriesList(
          carTypeId: cartypeId.value,
          modelId: 0,
          regionId: madein.value,
          yearId: 0,
          areaId: governorateid.value);
    } else if (item.type == 'isyearList') {
      carYear.value = '0';
      choosenList.remove(item);
      getaccessoriesList(
          carTypeId: cartypeId.value,
          modelId: carmodelId.value,
          regionId: madein.value,
          yearId: 0,
          areaId: governorateid.value);
    } else if (item.type == 'listgovernorate') {
      choosenList.clear();
      getaccessoriesList(
          carTypeId: cartypeId.value,
          modelId: carmodelId.value,
          regionId: madein.value,
          yearId: carYear.value,
          areaId: governorateid.value);
      madein.value = '0';
      cartypeId.value = '0';
      carmodelId.value = '0';
      carYear.value = '0';
      governorateloading.value = false;
    }
    //

    update();
  }

  void removeClick(index) {
    if (choosenList[index].type == 'isregionList') {
      isregionList.value = true;
      istypeList.value = false;
      ismodelList.value = false;
      isyearList.value = false;
      noMoreFilters.value = false;
      // print('isregionList');
      removeChoosenFilter(item: choosenList[index]);
    } else if (choosenList[index].type == 'istypeList') {
      istypeList.value = true;
      ismodelList.value = false;
      noMoreFilters.value = false;
      removeChoosenFilter(item: choosenList[index]);
      // print('istypeList');
    } else if (choosenList[index].type == 'ismodelList') {
      ismodelList.value = true;
      isyearList.value = false;
      noMoreFilters.value = false;
      removeChoosenFilter(item: choosenList[index]);
      // print('ismodelList');
    } else if (choosenList[index].type == 'isyearList') {
      isyearList.value = true;
      noMoreFilters.value = false;
      removeChoosenFilter(item: choosenList[index]);

      // print('isyearList');
    } else if (choosenList[index].type == 'listgovernorate') {
      isregionList.value = true;
      istypeList.value = false;
      ismodelList.value = false;
      isyearList.value = false;
      noMoreFilters.value = false;

      removeChoosenFilter(item: choosenList[index]);

      // print('isyearList');
    }
    update();
  }

  void filterClick(index) {
    if (isregionList.value == true) {
      // print('isregionList');
      madein.value = carRegions[index].id.toString();
      getcatTypes(carRegions[index].id);
      addChoosenFilter(
          id: carRegions[index].id,
          name: carRegions[index].name,
          type: 'isregionList');

      isregionList.value = false;
      istypeList.value = true;

      getaccessoriesList(
          regionId: madein.value,
          carTypeId: cartypeId.value,
          modelId: carmodelId.value,
          yearId: carYear.value,
          areaId: governorateid.value);
    } else if (istypeList.value == true) {
      // print('istypeList');
      cartypeId.value = carTypes[index].id.toString();
      getcarModels(carTypes[index].id);
      addChoosenFilter(
          id: carTypes[index].id,
          name: carTypes[index].title,
          type: 'istypeList');
      istypeList.value = false;
      ismodelList.value = true;
      getaccessoriesList(
          regionId: madein.value,
          carTypeId: cartypeId.value,
          modelId: carmodelId.value,
          yearId: carYear.value,
          areaId: governorateid.value);
    } else if (ismodelList.value == true) {
      // print('ismodelList');
      carmodelId.value = carModels[index].id.toString();
      getcarYears(carModels[index].id);
      addChoosenFilter(
          id: carModels[index].id,
          name: carModels[index].title,
          type: 'ismodelList');
      ismodelList.value = false;
      isyearList.value = true;
      getaccessoriesList(
          regionId: madein.value,
          carTypeId: cartypeId.value,
          modelId: carmodelId.value,
          yearId: carYear.value,
          areaId: governorateid.value);
    } else if (isyearList.value == true) {
      // print('isyearList');
      carYear.value = carYears[index].id.toString();
      loading.value = true;
      addChoosenFilter(
          id: carYears[index].id,
          name: carYears[index].title,
          type: 'isyearList');
      isyearList.value = false;
      noMoreFilters.value = true;
      loading.value = false;
      getaccessoriesList(
          regionId: madein.value,
          carTypeId: cartypeId.value,
          modelId: carmodelId.value,
          yearId: carYear.value,
          areaId: governorateid.value);
    }
    pageNumber.value = 0;
  }

  void addgovernate(index) {
    governorateid.value =
        index == null ? '0' : listgovernorate[index].id.toString();

    getaccessoriesList(
        areaId: governorateid.value,
        regionId: madein.value,
        carTypeId: cartypeId.value,
        modelId: carmodelId.value,
        yearId: carYear.value);

    pageNumber.value = 0;

    update();
  }
  //car Filtering

  //car Regions
  List<CarRegions> carRegions = [];
  var madein = '0'.obs;
  void setMadeINvalue(value) {
    madein.value = value.toString();
    update();
  }

  void getcarRegions() async {
    try {
      loading.value = true;
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
        // // print(carTypes.length);
        loading.value = false;
        update();
      }
    } catch (e) {
      // print(e.response.data);
    }
    // await getcatTypes(1);
    // await getcarModels(0);
    // await getcarYears(0);
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
    try {
      var response = await http
          .get('ServiceCarType/GetAll?regionId=${regionId.toString()}');
      // print(response.data);
      await carTypes.clear();
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
    } catch (e) {
      // print(e.response.data);
      getcatTypesloading.value = false;
    }
    // await getcarModels(carTypes[0].id);

    update();
  }
//Car Types

  //Car Models
  // List<CarModels> carModels = (<CarModels>[]).obs;
  List<CarModels> carModels = [];

  var getcatModelsloading = false.obs;
  var carmodelId = '0'.obs;

  void getcarModels(cartypeId) async {
    try {
      var response = await http
          .get('ServiceCarModel/GetAll?carTypeId=${cartypeId.toString()}');
      // print(response.data);
      await carModels.clear();
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
    } catch (e) {
      // // print(e.response.data);
      //errooor
      // print(e);
    }
    if (carModels.isBlank) {
      carModels.add(CarModels(id: emtyList['id'], title: emtyList['title']));
    }
    // await getcarYears(carModels[0].id);
    update();
  }

//Car Models

//Car Years
  // List<CarYears> carYears = (<CarYears>[]).obs;
  List<CarYears> carYears = [];

  var getcatYearsloading = false.obs;
  var carYear = '0'.obs;
  void changeCarYear(value) {
    carYear.value = value;
    update();
  }

  void getcarYears(carmoedelId) async {
    try {
      var response = await http
          .get('ServiceCarYear/GetAll?modelId=${carmoedelId.toString()}');
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
      if (carYears.isBlank) {
        //carYears.add(CarYears(id: emtyList['id'], title: emtyList['title']));
      }
    } catch (e) {
      // // print(e.response.data);
      //errooor
      // print(e);
      getcatYearsloading.value = false;
    }
    update();
  }
//Car Years

//Car Items
  var accessoriesList = List<Accessories>().obs;
  // List<Accessories> accessoriesList = [];

  void getaccessoriesList(
      {regionId, carTypeId, modelId, yearId, areaId}) async {
    if (choosenList.length == 0) {
      choosenList.add(ChoosenList(name: 'all'.tr, type: 'All', id: 0));
    }
    loading.value = true;
    await getcarRegions();

    try {
      // ServiceSparePart/Search?regionId=${regionId.toString()}&carTypeId=${cartypeId.toString()}&modelId=${modelId.toString()}&yearId=${yearId.toString()}&areaId=0&pageIndex=0&pageSize=20
      var response = await http.get(
          'ServiceSparePart/Search?regionId=${regionId.toString()}&carTypeId=${cartypeId.toString()}&modelId=${modelId.toString()}&yearId=${yearId.toString()}&areaId=${governorateid.value}&pageIndex=0&pageSize=20');
      // print(response.data);
      await accessoriesList.clear();

      for (var items in response.data) {
        List images = [];

        images.addAll(items['images']);

        accessoriesList.contains(Accessories(
                  id: items['id'],
                  carTypeId: items['carTypeId'],
                  imageUrl: items['imageURL'].toString(),
                  regionId: items['regionId'],
                  areaName: items['areaName'].toString(),
                  carModelId: items['carModelId'],
                  carYearId: items['carYearId'],
                  carYearName: items['carYearName'].toString(),
                  clientId: items['clientId'],
                  clientName: items['clientName'].toString(),
                  description: items['description'].toString(),
                  descriptionAr: items['descriptionAr'].toString(),
                  descriptionEn: items['descriptionEn'].toString(),
                  endYear: items['endYear'].toString(),
                  images: images,
                  partName: items['partName'].toString(),
                  partNameAr: items['partNameAr'].toString(),
                  partNameEn: items['partNameEn'].toString(),
                  phone: items['phone'].toString(),
                  startYear: items['startYear'].toString(),
                  status: items['status'],
                  unitPrice: items['unitPrice'],
                  whatsApp: items['whatsApp'].toString(),
                  areaId: items['areaId'],
                  carModelName: items['carModelName'],
                  carTypeName: items['carTypeName'],
                  regionName: items['regionName'],
                )) ==
                true
            ? null
            : accessoriesList.add(Accessories(
                id: items['id'],
                carTypeId: items['carTypeId'],
                imageUrl: items['imageURL'].toString(),
                regionId: items['regionId'],
                areaName: items['areaName'].toString(),
                carModelId: items['carModelId'],
                carYearId: items['carYearId'],
                carYearName: items['carYearName'].toString(),
                clientId: items['clientId'],
                clientName: items['clientName'].toString(),
                description: items['description'].toString(),
                descriptionAr: items['descriptionAr'].toString(),
                descriptionEn: items['descriptionEn'].toString(),
                endYear: items['endYear'].toString(),
                images: images,
                partName: items['partName'].toString(),
                partNameAr: items['partNameAr'].toString(),
                partNameEn: items['partNameEn'].toString(),
                phone: items['phone'].toString(),
                startYear: items['startYear'].toString(),
                status: items['status'],
                unitPrice: items['unitPrice'],
                whatsApp: items['whatsApp'].toString(),
                areaId: items['areaId'],
                carModelName: items['carModelName'],
                carTypeName: items['carTypeName'],
                regionName: items['regionName'],
              ));
      }
      // if (accessoriesList.isBlank) {}
      loading.value = false;
    } catch (e) {
      // // print(e.response.data);
      //errooor
      // print(e);
      loading.value = false;
    }
    await getcarYears(carmodelId);
    update();
  }

//Car Items

//Car Items

  // List<Accessories> accessoriesList = [];
  //paginate
  //pagenation

  var pageNumber = 0.obs;
  ScrollController scrollController = new ScrollController();
  var paginate = false.obs;
  void getaccessoriesListPagination(
      {regionId, carTypeId, modelId, yearId, index, area}) async {
    if (choosenList.length == 0) {
      choosenList.add(ChoosenList(name: 'all'.tr, type: 'All', id: 0));
    }
    //area != 0 ? loading.value = true :
    paginate.value = true;
    // await getcarRegions();
    try {
      // ServiceSparePart/Search?regionId=${regionId.toString()}&carTypeId=${cartypeId.toString()}&modelId=${modelId.toString()}&yearId=${yearId.toString()}&areaId=0&pageIndex=0&pageSize=20
      var response = await http.get(
          'ServiceSparePart/Search?regionId=${regionId.toString()}&carTypeId=${cartypeId.toString()}&modelId=${modelId.toString()}&yearId=${yearId.toString()}&areaId=${area.toString()}&pageIndex=${index.toString()}&pageSize=20');
      // area == 0 ? await accessoriesList.clear() : null;

      for (var items in response.data) {
        List images = [];

        images.addAll(items['images']);

        accessoriesList.contains(Accessories(
                  id: items['id'],
                  carTypeId: items['carTypeId'],
                  imageUrl: items['imageURL'].toString(),
                  regionId: items['regionId'],
                  areaName: items['areaName'].toString(),
                  carModelId: items['carModelId'],
                  carYearId: items['carYearId'],
                  carYearName: items['carYearName'].toString(),
                  clientId: items['clientId'],
                  clientName: items['clientName'].toString(),
                  description: items['description'].toString(),
                  descriptionAr: items['descriptionAr'].toString(),
                  descriptionEn: items['descriptionEn'].toString(),
                  endYear: items['endYear'].toString(),
                  images: images,
                  partName: items['partName'].toString(),
                  partNameAr: items['partNameAr'].toString(),
                  partNameEn: items['partNameEn'].toString(),
                  phone: items['phone'].toString(),
                  startYear: items['startYear'].toString(),
                  status: items['status'],
                  unitPrice: items['unitPrice'],
                  whatsApp: items['whatsApp'].toString(),
                  areaId: items['areaId'],
                  carModelName: items['carModelName'],
                  carTypeName: items['carTypeName'],
                  regionName: items['regionName'],
                )) ==
                true
            ? null
            : accessoriesList.add(Accessories(
                id: items['id'],
                carTypeId: items['carTypeId'],
                imageUrl: items['imageURL'].toString(),
                regionId: items['regionId'],
                areaName: items['areaName'].toString(),
                carModelId: items['carModelId'],
                carYearId: items['carYearId'],
                carYearName: items['carYearName'].toString(),
                clientId: items['clientId'],
                clientName: items['clientName'].toString(),
                description: items['description'].toString(),
                descriptionAr: items['descriptionAr'].toString(),
                descriptionEn: items['descriptionEn'].toString(),
                endYear: items['endYear'].toString(),
                images: images,
                partName: items['partName'].toString(),
                partNameAr: items['partNameAr'].toString(),
                partNameEn: items['partNameEn'].toString(),
                phone: items['phone'].toString(),
                startYear: items['startYear'].toString(),
                status: items['status'],
                unitPrice: items['unitPrice'],
                whatsApp: items['whatsApp'].toString(),
                areaId: items['areaId'],
                carModelName: items['carModelName'],
                carTypeName: items['carTypeName'],
                regionName: items['regionName'],
              ));
      }
      // if (accessoriesList.isBlank) {}
      paginate.value = false;
      //  area != 0 ? loading.value = false : paginate.value = false;
    } catch (e) {
      // // print(e.response.data);
      //errooor
      // print(e);
      area != 0 ? loading.value = false : paginate.value = false;
    }
    await getcarYears(carmodelId);
    update();
  }

//Car Items
  @override
  void onInit() {
    getgovernorate();
    getaccessoriesList(carTypeId: 0, modelId: 0, regionId: 0, yearId: 0);
    Future.delayed(Duration.zero, () {
      scrollController.addListener(() async {
        if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) {
          pageNumber.value += 1;

          getaccessoriesListPagination(
              carTypeId: cartypeId.value,
              index: pageNumber.value,
              modelId: carmodelId.value,
              regionId: madein.value,
              yearId: carYear.value,
              area: governorateid.value);
        }
      });
    });
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
