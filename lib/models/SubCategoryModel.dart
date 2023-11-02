import 'package:buy_sale_apps/models/CategoryModel.dart';

class SubCategoryModel {
  int? id;
  String? name;
  String? tags;
  int? category_id;
  CategoryModel? category;
  SubCategoryModel(
      {this.id, this.name, this.tags, this.category_id, this.category});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'tags': tags,
      'category_id': category_id,
    };
  }

  factory SubCategoryModel.fromMap(Map<String, dynamic> map) {
    return SubCategoryModel(
        id: map['id']?.toInt(),
        name: map['name'],
        tags: map['tags'],
        category_id: map['category_id']?.toInt(),
        category: CategoryModel.fromMap(map['category'] ?? ''));
  }
  static List<SubCategoryModel> fromJsonList(List list) {
    return list.map((e) => SubCategoryModel.fromMap(e)).toList();
  }
}
