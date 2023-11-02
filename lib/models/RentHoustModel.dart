import 'dart:convert';

class RentHouseModel {
  int? id;
  String? totalArea;
  String? totalFloor;
  String? floorNo;
  int? post_id;
  RentHouseModel({
    this.id,
    this.totalArea,
    this.totalFloor,
    this.floorNo,
    this.post_id,
  });

  RentHouseModel copyWith({
    int? id,
    String? totalArea,
    String? totalFloor,
    String? floorNo,
    int? post_id,
  }) {
    return RentHouseModel(
      id: id ?? this.id,
      totalArea: totalArea ?? this.totalArea,
      totalFloor: totalFloor ?? this.totalFloor,
      floorNo: floorNo ?? this.floorNo,
      post_id: post_id ?? this.post_id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'totalArea': totalArea,
      'totalFloor': totalFloor,
      'floorNo': floorNo,
      'post_id': post_id,
    };
  }

  factory RentHouseModel.fromMap(Map<String, dynamic> map) {
    return RentHouseModel(
      id: map['id']?.toInt(),
      totalArea: map['totalArea'],
      totalFloor: map['totalFloor'],
      floorNo: map['floorNo'],
      post_id: map['post_id']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory RentHouseModel.fromJson(String source) =>
      RentHouseModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RentHouseModel(id: $id, totalArea: $totalArea, totalFloor: $totalFloor, floorNo: $floorNo, post_id: $post_id)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RentHouseModel &&
        other.id == id &&
        other.totalArea == totalArea &&
        other.totalFloor == totalFloor &&
        other.floorNo == floorNo &&
        other.post_id == post_id;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        totalArea.hashCode ^
        totalFloor.hashCode ^
        floorNo.hashCode ^
        post_id.hashCode;
  }
}
