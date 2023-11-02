import 'dart:convert';

import 'package:buy_sale_apps/models/AdsImagesModel.dart';

class AdsModel {
  int? id;
  String? title;
  String? price;
  String? description;
  String? latitude;
  String? longitude;
  String? full_address;
  int? category_id;
  int? sub_category_id;
  int? user_id;
  List<AdsImageModel>? images;
  AdsModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.latitude,
    this.longitude,
    this.full_address,
    this.category_id,
    this.sub_category_id,
    this.user_id,
    this.images,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'latitude': latitude,
      'longitude': longitude,
      'full_address': full_address,
      'category_id': category_id,
      'sub_category_id': sub_category_id,
      'user_id': user_id,
    };
  }

  factory AdsModel.fromMap(Map<String, dynamic> map) {
    return AdsModel(
        id: map['id']?.toInt(),
        title: map['title'],
        price: map['price'],
        description: map['description'],
        latitude: map['latitude'],
        longitude: map['longitude'],
        full_address: map['full_address'],
        category_id: map['category_id'],
        sub_category_id: map['sub_category_id'],
        user_id: map['user_id'],
        images: AdsImageModel.fromJsonList(map['post_image'] ?? []));
  }

  static List<AdsModel> fromJsonList(List list) {
    return list.map((e) => AdsModel.fromMap(e)).toList();
  }
}
