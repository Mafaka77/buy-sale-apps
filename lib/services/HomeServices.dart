import 'package:buy_sale_apps/BaseService.dart';
import 'package:buy_sale_apps/Routes.dart';
import 'package:buy_sale_apps/models/AdsModel.dart';
import 'package:buy_sale_apps/models/CategoryModel.dart';
import 'package:buy_sale_apps/models/SubCategoryModel.dart';

class HomeServices extends BaseService {
  Future<List<CategoryModel>> getcategory() async {
    try {
      var response = await client.get(Routes.GET_CATEGORIES);
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

  Future<List<AdsModel>> getAdsByCategory(int catId, int subCatId) async {
    try {
      var response =
          await client.get(Routes.GET_ADS_BY_CATEGORY, queryParameters: {
        'catId': catId,
        'subCatId': subCatId,
      });
      var data = response.data['data'];
      return AdsModel.fromJsonList(data);
    } catch (ex) {
      return Future.error(ex);
    }
  }
}
