import 'package:buy_sale_apps/models/CategoryModel.dart';
import 'package:buy_sale_apps/services/CategoryServices.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  CategoryServices services = Get.find(tag: 'categoryServices');
  var categoryList = <CategoryModel>[].obs;
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
}
