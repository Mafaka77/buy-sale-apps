import 'package:buy_sale_apps/models/AdsModel.dart';
import 'package:buy_sale_apps/models/CategoryModel.dart';
import 'package:buy_sale_apps/models/SubCategoryModel.dart';
import 'package:buy_sale_apps/services/HomeServices.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  HomeServices services = Get.find(tag: 'homeServices');
  var categoryList = <CategoryModel>[].obs;
  var subCategoryList = <SubCategoryModel>[].obs;
  var adsByCategoryList = <AdsModel>[].obs;
  var onLoading = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCategory();
  }

  void getCategory() async {
    onLoading.value = true;
    try {
      var response = await services.getcategory();
      categoryList.clear();
      categoryList.addAll(response);
      onLoading.value = false;
    } catch (ex) {
      onLoading.value = false;
    }
  }

  void getSubCategory(int catId, Function onLoading, Function onSuccess,
      Function onError) async {
    onLoading();
    try {
      var response = await services.getSubCategory(catId);
      subCategoryList.clear();
      subCategoryList.addAll(response);
      onSuccess();
    } catch (ex) {
      onError();
    }
  }

  void getAdsByCategory(int catId, int subCatId, Function onLoading,
      Function onSuccess, Function onError) async {
    onLoading();

    try {
      var response = await services.getAdsByCategory(catId, subCatId);
      adsByCategoryList.clear();
      adsByCategoryList.addAll(response);
      onSuccess();
    } catch (ex) {
      onError();
      print(ex);
    }
  }
}
