import 'dart:convert';

class VehicleModel {
  int? id;
  String? model;
  String? km;
  int? post_id;
  VehicleModel({
    this.id,
    this.model,
    this.km,
    this.post_id,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'model': model,
      'km': km,
      'post_id': post_id,
    };
  }

  factory VehicleModel.fromMap(Map<String, dynamic> map) {
    return VehicleModel(
      id: map['id']?.toInt(),
      model: map['model'],
      km: map['km'],
      post_id: map['post_id']?.toInt(),
    );
  }
}
