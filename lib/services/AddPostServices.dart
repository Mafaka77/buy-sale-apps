import 'package:buy_sale_apps/BaseService.dart';
import 'package:buy_sale_apps/models/SubCategoryModel.dart';

import '../Routes.dart';
import '../models/CategoryModel.dart';

class AddPostServices extends BaseService {
  Future<List<CategoryModel>> getAllCategory() async {
    try {
      var response = await client.get(Routes.GET_ALL_CATEGORY);
      var data = response.data['data'];
      return CategoryModel.fromJsonList(data);
    } catch (ex) {
      return Future.error(ex);
    }
  }

  Future<List<SubCategoryModel>> getSubCategory(int catId) async {
    try {
      var response = await client.get(Routes.GET_SUB_CATEGORY(catId));
      var data = response.data['data'];
      return SubCategoryModel.fromJsonList(data);
    } catch (ex) {
      return Future.error(ex);
    }
  }
}
