import 'package:buy_sale_apps/models/CategoryModel.dart';
import 'package:buy_sale_apps/models/SubCategoryModel.dart';
import 'package:buy_sale_apps/services/AddPostServices.dart';
import 'package:get/get.dart';

class AddPostController extends GetxController {
  AddPostServices services = Get.find(tag: 'addPostServices');
  var categoryList = <CategoryModel>[].obs;
  var subCategoryList = <SubCategoryModel>[].obs;
  var isLoading = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllCaterory();
  }

  void getAllCaterory() async {
    isLoading.value = true;
    try {
      var response = await services.getAllCategory();
      categoryList.clear();
      categoryList.addAll(response);
      isLoading.value = false;
    } catch (ex) {
      isLoading.value = false;
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
}
