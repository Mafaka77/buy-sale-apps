import 'package:buy_sale_apps/BaseService.dart';
import 'package:buy_sale_apps/Routes.dart';
import 'package:buy_sale_apps/models/CategoryModel.dart';

class CategoryServices extends BaseService {
  Future<List<CategoryModel>> getAllCategory() async {
    try {
      var response = await client.get(Routes.GET_ALL_CATEGORY);
      var data = response.data['data'];
      return CategoryModel.fromJsonList(data);
    } catch (ex) {
      return Future.error(ex);
    }
  }
}
