import 'package:get/get.dart';
import '../../../services/httpService.dart';
import 'package:autoservice/app/modules/accessories/model.dart';

class AccessoriesController extends GetxController {
  //TODO: Implement AccessoriesController
  final http = Get.find<HttpService>();
  final count = 0.obs;
  var loading = false.obs;
  List<TopSlider> topSlide;
  List<NewAccessory> newAccessories;
  List<UsedAccessory> usedAccessories;
  void getaccessoriesHome() async {
    loading.value = true;

    try {
      // ServiceSparePart/Search?regionId=${regionId.toString()}&carTypeId=${cartypeId.toString()}&modelId=${modelId.toString()}&yearId=${yearId.toString()}&areaId=0&pageIndex=0&pageSize=20
      var response = await http.get('Mobile/GetShopHome');
      print(response.data);
      AccessoriesHomeModel accessoriesHomeModel =
          AccessoriesHomeModel.fromJson(response.data);
      topSlide = accessoriesHomeModel.topSlider;
      newAccessories = accessoriesHomeModel.newAccessories;
      usedAccessories = accessoriesHomeModel.usedAccessories;

      loading.value = false;
    } catch (e) {
      // // print(e.response.data);
      //errooor
      // print(e);
      loading.value = false;
    }
    // await getcarYears(carModels[0].id);
    update();
  }

  @override
  void onInit() {
    getaccessoriesHome();
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
