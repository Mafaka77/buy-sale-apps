import 'dart:convert';

class CategoryModel {
  int? id;
  String? category_name;
  String? category_icon;
  String? tags;
  CategoryModel({
    this.id,
    this.category_name,
    this.category_icon,
    this.tags,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'category_name': category_name,
      'category_icon': category_icon,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id']?.toInt(),
      category_name: map['category_name'],
      category_icon: map['category_icon'],
      tags: map['tags'],
    );
  }
  static List<CategoryModel> fromJsonList(List list) {
    return list.map((e) => CategoryModel.fromMap(e)).toList();
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source));
}
