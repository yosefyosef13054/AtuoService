import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../services/httpService.dart';
import 'package:autoservice/app/modules/usedCars_add/models/model.dart';
import 'package:autoservice/app/modules/new_accessories/model.dart';
import 'package:autoservice/app/modules/cars_services/model.dart';

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

class CarsServicesController extends GetxController {
  //TODO: Implement CarsServicesController

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

  void addgovernate(index) {
    governorateid.value =
        index == null ? '0' : listgovernorate[index].id.toString();

    getservicesList(
      areaId: governorateid.value,
      serviceCategoryId: serviceCategoryid.value,
      carTypeId: carTypeid.value,
      serviceTypeId: serviceCategorytypeid.value,
    );

    pageNumber.value = 0;

    update();
  }

//governorate
//remove Filter
  // 'ServiceCategoryType'
  //ServiceCategory
  // carType
  var serviceCategory = true.obs;
  var serviceCategoryType = false.obs;
  var serviceCarType = false.obs;

  void removeChoosenFilter({ChoosenList item}) {
    if (item.type == 'ServiceCategory') {
      choosenList.clear();
      carTypeid.value = '0';
      serviceCategoryid.value = '0';
      serviceCategorytypeid.value = '0';
      serviceCategory.value = true;
      serviceCategoryType.value = false;
      serviceCarType.value = false;
      getservicesList(
          areaId: governorateid.value,
          carTypeId: carTypeid.value,
          serviceCategoryId: serviceCategoryid.value,
          serviceTypeId: serviceCategorytypeid.value);
      choosenList.removeWhere((element) => element.type == 'ServiceCategory');
      choosenList.removeWhere((element) => element.type == 'carType');
      choosenList
          .removeWhere((element) => element.type == 'ServiceCategoryType');
    } else if (item.type == 'carType') {
      carTypeid.value = '0';
      serviceCategorytypeid.value = '0';
      serviceCategory.value = false;
      serviceCarType.value = true;
      serviceCategoryType.value = false;
      getservicesList(
          areaId: governorateid.value,
          carTypeId: carTypeid.value,
          serviceCategoryId: serviceCategoryid.value,
          serviceTypeId: serviceCategorytypeid.value);
      choosenList.removeWhere((element) => element.type == 'carType');
      choosenList
          .removeWhere((element) => element.type == 'ServiceCategoryType');
    } else if (item.type == 'ServiceCategoryType') {
      choosenList.remove(item);
      serviceCategorytypeid.value = '0';
      serviceCategory.value = false;
      serviceCarType.value = false;
      serviceCategoryType.value = true;
      getservicesList(
          areaId: governorateid.value,
          carTypeId: carTypeid.value,
          serviceCategoryId: serviceCategoryid.value,
          serviceTypeId: serviceCategorytypeid.value);
    }
    choosenList.removeWhere((element) => element.type == 'ServiceCategoryType');
  }

//remove Filter
//serviceCategory

  var serviceCategoryid = '0'.obs;
  List<ServiceCategory> listserviceCategory = [];
  var serviceCategoryloading = false.obs;
  void getserviceCategory() async {
    serviceCategoryloading.value = true;
    try {
      var response = await http.get('ServiceType/GetServices');
      // print(response.data);
      await listserviceCategory.clear();
      // listserviceCategory.add(ServiceCategory(id: 0, areaName: 'select'.tr));
      for (var item in response.data) {
        listserviceCategory.contains(ServiceCategory(
                  id: item['id'],
                  // parentId: item['parentId'],
                  // status: item['status'],
                  // adsImageUrl: item['adsImageUrl'],
                  // allowArea: item['allowArea'],
                  // chiledServiceTypes: item['chiledServiceTypes'],
                  // companyId: item['companyId'],
                  // imageUrl: item['imageUrl'],
                  // lastModifiedDate: item['lastModifiedDate'],
                  // prices: item['prices'],
                  // serviceType: item['serviceType'],
                  serviceTypeAr: item['serviceTypeAr'],
                  serviceTypeEn: item['serviceTypeEn'],
                  // serviceTypeParent: item['serviceTypeParent'],
                )) ==
                true
            ? null
            : listserviceCategory.add(ServiceCategory(
                id: item['id'],
                // parentId: item['parentId'],
                // status: item['status'],
                // adsImageUrl: item['adsImageUrl'],
                // allowArea: item['allowArea'],
                // chiledServiceTypes: item['chiledServiceTypes'],
                // companyId: item['companyId'],
                // imageUrl: item['imageUrl'],
                // lastModifiedDate: item['lastModifiedDate'],
                // prices: item['prices'],
                // serviceType: item['serviceType'],
                serviceTypeAr: item['serviceTypeAr'],
                serviceTypeEn: item['serviceTypeEn'],
                // serviceTypeParent: item['serviceTypeParent'],
              ));
      }
      // areaid.value = '1';
      // await getarea(listserviceCategory[0].id);
      // serviceCategoryloading.value = false;
      serviceCategoryloading.value = false;
    } catch (e) {
      serviceCategoryloading.value = false;
      // // print(e.response.data);
      //errooor
      // print(e);
    }
    update();
  }

  void addserviceCategory(index) {
    carTypeid.value = '0';
    serviceCategoryid.value =
        index == null ? '0' : listserviceCategory[index].id.toString();

    getcarType();
    getservicesList(
      areaId: governorateid.value,
      serviceCategoryId: serviceCategoryid.value,
      carTypeId: carTypeid.value,
      serviceTypeId: serviceCategorytypeid.value,
    );

    pageNumber.value = 0;

    update();
  }
//serviceCategory

//serviceCategorytype
  var serviceCategorytypeid = '0'.obs;
  List<ServiceTypes> listserviceCategorytype = [];
  var serviceCategorytypeloading = false.obs;
  void getserviceCategorytype() async {
    serviceCategorytypeloading.value = true;
    try {
      var response = await http.get('ServiceTag/GetAll');
      // print(response.data);
      await listserviceCategorytype.clear();
      // listserviceCategorytype.add(ServiceCategory(id: 0, areaName: 'select'.tr));
      for (var item in response.data) {
        listserviceCategorytype.contains(ServiceTypes(
                  id: item['id'],
                  title: item['title'],
                  titleAr: item['titleAr'],
                  titleEn: item['titleEn'],
                )) ==
                true
            ? null
            : listserviceCategorytype.add(ServiceTypes(
                id: item['id'],
                title: item['title'],
                titleAr: item['titleAr'],
                titleEn: item['titleEn'],
              ));
      }
      // areaid.value = '1';
      // await getarea(listserviceCategorytype[0].id);
      // serviceCategorytypeloading.value = false;
      serviceCategorytypeloading.value = false;
    } catch (e) {
      serviceCategorytypeloading.value = false;
      // // print(e.response.data);
      //errooor
      // print(e);
    }
    update();
  }

  void addserviceCategorytype(index) {
    serviceCategorytypeid.value =
        index == null ? '0' : listserviceCategorytype[index].id.toString();
    addChoosenFilter(
        id: listserviceCategorytype[index].id,
        name: listserviceCategorytype[index].title,
        type: 'ServiceCategoryType');
    getservicesList(
      areaId: governorateid.value,
      serviceCategoryId: serviceCategoryid.value,
      carTypeId: carTypeid.value,
      serviceTypeId: serviceCategorytypeid.value,
    );

    pageNumber.value = 0;

    update();
  }
//serviceCategorytype

//carType
  var carTypeid = '0'.obs;
  var listcarType = List<CarTypes>().obs;

  var carTypeloading = false.obs;
  void getcarType() async {
    // print(serviceCategoryid.value);
    carTypeloading.value = true;
    try {
      var response = await http
          .get('ServiceType/GetByParentId?parentId=${serviceCategoryid.value}');
      // print(response.data);
      await listcarType.clear();
      // listcarType.add(ServiceCategory(id: 0, areaName: 'select'.tr));
      for (var item in response.data) {
        listcarType.contains(CarTypes(
                    id: item['id'],
                    serviceType: item['serviceType'],
                    serviceTypeAr: item['serviceTypeAr'],
                    serviceTypeEn: item['serviceTypeEn'])) ==
                true
            ? null
            : listcarType.add(CarTypes(
                id: item['id'],
                serviceType: item['serviceType'],
                serviceTypeAr: item['serviceTypeAr'],
                serviceTypeEn: item['serviceTypeEn'],
              ));
      }
      // areaid.value = '1';
      // await getarea(listcarType[0].id);
      // carTypeloading.value = false;
      carTypeloading.value = false;
    } catch (e) {
      carTypeloading.value = false;
      // // print(e.response.data);
      //errooor
      // print(e);
    }
    update();
  }

  void addcarType(index) {
    carTypeid.value = index == null ? '0' : listcarType[index].id.toString();
    serviceCategoryType.value = true;
    serviceCarType.value = false;
    addChoosenFilter(
        id: listcarType[index].id,
        name: listcarType[index].serviceTypeAr,
        type: 'carType');
    getservicesList(
      areaId: governorateid.value,
      serviceCategoryId: serviceCategoryid.value,
      carTypeId: carTypeid.value,
      serviceTypeId: serviceCategorytypeid.value,
    );

    pageNumber.value = 0;

    update();
  }
//carType

  var choosenList = List<ChoosenList>().obs;
  void addChoosenFilter({id, name, type}) {
    choosenList.add(ChoosenList(id: id, name: name, type: type));
    update();
  }

//Car Items
  var servicesList = List<Services>().obs;
  // List<Accessories> servicesList = [];

  void getservicesList(
      {serviceCategoryId, carTypeId, serviceTypeId, areaId}) async {
    if (choosenList.length == 0) {
      choosenList.add(ChoosenList(name: 'all'.tr, type: 'All', id: 0));
    }
    loading.value = true;
    //await getcarRegions();

    try {
      var response = await http.get(
          'ServiceCompanyPrice/GetServiceSearch?serviceCategoryId=${serviceCategoryId.toString()}&carTypeId=${carTypeId.toString()}&serviceTypeId=${serviceTypeId.toString()}&areaId=${areaId.toString()}&pageIndex=0&pageSize=20');
      // print(response.data);
      await servicesList.clear();

      for (var items in response.data) {
        List images = [];

        servicesList.contains(Services(
                  companyLogoUrl: items['companyLogoURL'].toString(),
                  id: items['id'],
                  imageUrl: items['imageURL'].toString(),
                  status: items['status'],
                  unitPrice: items['unitPrice'],
                  allowArea: items['allowArea'],
                  companyId: items['companyId'],
                  companyName: items['companyName'],
                  companyServiceId: items['companyServiceId'],
                  createdDate: items['createdDate'],
                  duration: items['duration'],
                  isActive: items['isActive'],
                  isPackage: items['isPackage'],
                  serviceDescription: items['serviceDescription'],
                  serviceDescriptionAr: items['serviceDescriptionAr'],
                  serviceDescriptionEn: items['serviceDescriptionEn'],
                  serviceName: items['serviceName'],
                  serviceNameAr: items['serviceNameAr'],
                  serviceNameEn: items['serviceNameEn'],
                  serviceTypeId: items['serviceTypeId'],
                  serviceTypeName: items['serviceTypeName'],
                )) ==
                true
            ? null
            : servicesList.add(Services(
                companyLogoUrl: items['companyLogoURL'].toString(),
                id: items['id'],
                imageUrl: items['imageURL'].toString(),
                status: items['status'],
                unitPrice: items['unitPrice'],
                allowArea: items['allowArea'],
                companyId: items['companyId'],
                companyName: items['companyName'],
                companyServiceId: items['companyServiceId'],
                createdDate: items['createdDate'],
                duration: items['duration'],
                isActive: items['isActive'],
                isPackage: items['isPackage'],
                serviceDescription: items['serviceDescription'],
                serviceDescriptionAr: items['serviceDescriptionAr'],
                serviceDescriptionEn: items['serviceDescriptionEn'],
                serviceName: items['serviceName'],
                serviceNameAr: items['serviceNameAr'],
                serviceNameEn: items['serviceNameEn'],
                serviceTypeId: items['serviceTypeId'],
                serviceTypeName: items['serviceTypeName'],
              ));
      }
      // if (servicesList.isBlank) {}
      loading.value = false;
    } catch (e) {
      // // print(e.response.data);
      //errooor
      // print(e);
      loading.value = false;
    }
    //   await getcarYears(carmodelId);
    update();
  }

//Car Items

//paginate
  //pagenation

  var pageNumber = 0.obs;
  ScrollController scrollController = new ScrollController();
  var paginate = false.obs;
  void getServicesPaginate(
      {serviceCategoryId, carTypeId, serviceTypeId, areaId, index}) async {
    if (choosenList.length == 0) {
      choosenList.add(ChoosenList(name: 'all'.tr, type: 'All', id: 0));
    }
    //area != 0 ? loading.value = true :
    paginate.value = true;
    // await getcarRegions();
    try {
      var response = await http.get(
          'ServiceCompanyPrice/GetServiceSearch?serviceCategoryId=${serviceCategoryId.toString()}&carTypeId=${carTypeId.toString()}&serviceTypeId=${serviceTypeId.toString()}&areaId=${areaId.toString()}&pageIndex=${index.toString()}&pageSize=20');
      // area == 0 ? await accessoriesList.clear() : null;

      for (var items in response.data) {
        List images = [];

        servicesList.contains(Services(
                  companyLogoUrl: items['companyLogoURL'].toString(),
                  id: items['id'],
                  imageUrl: items['imageURL'].toString(),
                  status: items['status'],
                  unitPrice: items['unitPrice'],
                  allowArea: items['allowArea'],
                  companyId: items['companyId'],
                  companyName: items['companyName'],
                  companyServiceId: items['companyServiceId'],
                  createdDate: items['createdDate'],
                  duration: items['duration'],
                  isActive: items['isActive'],
                  isPackage: items['isPackage'],
                  serviceDescription: items['serviceDescription'],
                  serviceDescriptionAr: items['serviceDescriptionAr'],
                  serviceDescriptionEn: items['serviceDescriptionEn'],
                  serviceName: items['serviceName'],
                  serviceNameAr: items['serviceNameAr'],
                  serviceNameEn: items['serviceNameEn'],
                  serviceTypeId: items['serviceTypeId'],
                  serviceTypeName: items['serviceTypeName'],
                )) ==
                true
            ? null
            : servicesList.add(Services(
                companyLogoUrl: items['companyLogoURL'].toString(),
                id: items['id'],
                imageUrl: items['imageURL'].toString(),
                status: items['status'],
                unitPrice: items['unitPrice'],
                allowArea: items['allowArea'],
                companyId: items['companyId'],
                companyName: items['companyName'],
                companyServiceId: items['companyServiceId'],
                createdDate: items['createdDate'],
                duration: items['duration'],
                isActive: items['isActive'],
                isPackage: items['isPackage'],
                serviceDescription: items['serviceDescription'],
                serviceDescriptionAr: items['serviceDescriptionAr'],
                serviceDescriptionEn: items['serviceDescriptionEn'],
                serviceName: items['serviceName'],
                serviceNameAr: items['serviceNameAr'],
                serviceNameEn: items['serviceNameEn'],
                serviceTypeId: items['serviceTypeId'],
                serviceTypeName: items['serviceTypeName'],
              ));
      }
      // if (accessoriesList.isBlank) {}
      paginate.value = false;
      //  area != 0 ? loading.value = false : paginate.value = false;
    } catch (e) {
      // // print(e.response.data);
      //errooor
      // print(e);
    }
    update();
  }
  //paginate

  //addetional Service of Compenies
  var choosenService = Services().obs;
  var addtionalServices = List<Services>().obs;
  var choosenAdditionalService = List<Services>().obs;
  RxDouble tootal = 0.0.obs;

  void getAdditionalService({compenyID}) async {
    loading.value = true;
    //await getcarRegions();
    choosenAdditionalService = List<Services>().obs;
    // ${compenyID.toString()}
    tootal.value = 0.0;
    try {
      var response = await http.get(
          'ServiceCompanyAddionalService/GetAll?companyId=${compenyID.toString()}');
      // print(response.data);

      await addtionalServices.clear();

      for (var items in response.data) {
        List images = [];

        addtionalServices.contains(Services(
                  id: items['id'],
                  unitPrice: items['unitPrice'],
                  allowArea: items['allowArea'],
                  companyName: items['companyName'],
                  duration: items['duration'],
                  isActive: items['isActive'],
                  isPackage: items['isPackage'],
                  serviceName: items['serviceName'],
                  serviceNameAr: items['serviceNameAr'],
                  serviceNameEn: items['serviceNameEn'],
                )) ==
                true
            ? null
            : addtionalServices.add(Services(
                id: items['id'],
                unitPrice: items['unitPrice'],
                allowArea: items['allowArea'],
                companyName: items['companyName'],
                duration: items['duration'],
                isActive: items['isActive'],
                isPackage: items['isPackage'],
                serviceName: items['serviceName'],
                serviceNameAr: items['serviceNameAr'],
                serviceNameEn: items['serviceNameEn'],
              ));
      }
      // if (servicesList.isBlank) {}
      loading.value = false;
    } catch (e) {
      // // print(e.response.data);
      //errooor
      // print(e);
      loading.value = false;
    }
    //   await getcarYears(carmodelId);
    update();
  }

//addetional Service of Compenies

  final count = 0.obs;
  @override
  void onInit() {
    getservicesList(
      carTypeId: carTypeid.value,
      areaId: governorateid.value,
      serviceCategoryId: serviceCategoryid.value,
      serviceTypeId: serviceCategorytypeid.value,
    );
    getserviceCategorytype();
    getgovernorate();
    getserviceCategory();

    Future.delayed(Duration.zero, () {
      scrollController.addListener(() async {
        if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) {
          pageNumber.value += 1;

          getServicesPaginate(
            areaId: governorateid.value,
            carTypeId: carTypeid.value,
            index: pageNumber.value,
            serviceCategoryId: serviceCategoryid.value,
            serviceTypeId: serviceCategorytypeid.value,
          );
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
  void increment() => count.value++;
}
