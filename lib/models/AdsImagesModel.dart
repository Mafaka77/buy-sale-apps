import 'dart:convert';

class AdsImageModel {
  int? id;
  String? image_url;
  int? post_id;
  AdsImageModel({
    this.id,
    this.image_url,
    this.post_id,
  });

  AdsImageModel copyWith({
    int? id,
    String? image_url,
    int? post_id,
  }) {
    return AdsImageModel(
      id: id ?? this.id,
      image_url: image_url ?? this.image_url,
      post_id: post_id ?? this.post_id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image_url': image_url,
      'post_id': post_id,
    };
  }

  factory AdsImageModel.fromMap(Map<String, dynamic> map) {
    return AdsImageModel(
      id: map['id']?.toInt(),
      image_url: map['image_url'],
      post_id: map['post_id']?.toInt(),
    );
  }

  static List<AdsImageModel> fromJsonList(List list) {
    return list.map((e) => AdsImageModel.fromMap(e)).toList();
  }
}
