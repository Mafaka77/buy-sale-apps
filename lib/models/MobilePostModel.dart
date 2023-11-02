class MobilePostModel {
  int? id;
  String? title;
  String? price;
  String? description;
  int? category_id;
  int? sub_category_id;
  int? user_id;
  String? latitude;
  String? longitude;
  String? full_address;
  MobilePostModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category_id,
    this.sub_category_id,
    this.user_id,
    this.latitude,
    this.longitude,
    this.full_address,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'category_id': category_id,
      'sub_category_id': sub_category_id,
      'user_id': user_id,
      'latitude': latitude,
      'longitude': longitude,
      'full_address': full_address
    };
  }

  factory MobilePostModel.fromMap(Map<String, dynamic> map) {
    return MobilePostModel(
      id: map['id']?.toInt(),
      title: map['title'],
      price: map['price'],
      description: map['description'],
      category_id: map['category_id']?.toInt(),
      sub_category_id: map['sub_category_id']?.toInt(),
      user_id: map['user_id']?.toInt(),
      latitude: map['latitude'] ?? '',
      longitude: map['longitude'] ?? '',
      full_address: map['full_address'] ?? '',
    );
  }
  static List<MobilePostModel> fromJsonList(List list) {
    return list.map((e) => MobilePostModel.fromMap(e)).toList();
  }
}
