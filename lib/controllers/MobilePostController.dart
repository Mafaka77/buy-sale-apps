import 'package:buy_sale_apps/models/MobilePostModel.dart';
import 'package:buy_sale_apps/models/RentHoustModel.dart';
import 'package:buy_sale_apps/models/UserModel.dart';
import 'package:buy_sale_apps/models/VehicleModel.dart';
import 'package:buy_sale_apps/services/MobilePostServices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:geolocator/geolocator.dart';

class MobilePostController extends GetxController {
  var storage = const FlutterSecureStorage();
  MobilePostServices services = Get.find(tag: 'mobilePostServices');
  final GeolocatorPlatform geolocator = GeolocatorPlatform.instance;
  final formKey = GlobalKey<FormState>();
  final secondKey = GlobalKey<FormState>();
  List<XFile>? images;
  var selectedImages = <XFile>[].obs;
  var title = TextEditingController();
  var price = TextEditingController();
  var descriptions = TextEditingController();
  var carModel = TextEditingController();
  var carKmDone = TextEditingController();
  var fullAddress = TextEditingController();
  var userData = <UserModel>{}.obs;
  var latitude = ''.obs;
  var longitude = ''.obs;
  Position? currentPosition;

  //PROPERTY
  var totalArea = TextEditingController();
  var totalFloor = TextEditingController();
  var floorNo = TextEditingController();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCurrentLocation();
  }

  void getUserData(
      Function onLoading, Function onSuccess, Function onError) async {
    var userId = await storage.read(key: 'userId');
    onLoading();
    try {
      var response = await services.getUserData(int.parse(userId.toString()));
      userData.clear();
      userData.add(response);
      print(response);
      onSuccess();
    } catch (ex) {
      onError();
    }
  }

  getCurrentLocation() {
    geolocator.getCurrentPosition().then((Position position) {
      latitude.value = 'Lat:${position.latitude}';
      longitude.value = 'Long:${position.longitude}';
      currentPosition = position;
      getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }

  getAddressFromLatLng() async {
    try {
      List<Placemark> p = await placemarkFromCoordinates(
          currentPosition!.latitude, currentPosition!.longitude);
      Placemark place = p[0];
      fullAddress.text =
          "${place.subLocality},${place.locality},${place.country}";

//  “${place.subLocality},${place.locality}, ${place.country}”;
    } catch (e) {
      print(e);
    }
  }

  submitAds(int catId, int subCatId, Function onLoading, Function onSuccess,
      Function onError) async {
    var userId = await storage.read(key: 'userId');
    onLoading();
    try {
      var model = MobilePostModel();
      model.title = title.text;
      model.price = price.text;
      model.description = descriptions.text;
      model.category_id = catId;
      model.sub_category_id = subCatId;
      model.latitude = latitude.value;
      model.longitude = longitude.value;
      model.full_address = fullAddress.text;
      model.user_id = int.parse(userId.toString());
      var response = await services.submitAds(model, selectedImages);
      onSuccess();
    } catch (ex) {
      onError();
      print(ex);
    }
  }

  submitVehicleAds(int catId, int subCatId, Function onLoading,
      Function onSuccess, Function onError) async {
    var userId = await storage.read(key: 'userId');
    onLoading();
    try {
      var model = MobilePostModel();
      model.title = title.text;
      model.price = price.text;
      model.description = descriptions.text;
      model.category_id = catId;
      model.sub_category_id = subCatId;
      model.latitude = latitude.value;
      model.longitude = longitude.value;
      model.full_address = fullAddress.text;
      model.user_id = int.parse(userId.toString());
      var vehicle = VehicleModel();
      vehicle.model = carModel.text;
      vehicle.km = carKmDone.text;
      var response =
          await services.submitVehicleAds(model, vehicle, selectedImages);
      onSuccess();
    } catch (ex) {
      onError();
    }
  }

  submitPropertyAds(int catId, int subCatId, Function onLoading,
      Function onSuccess, Function onError) async {
    var userId = await storage.read(key: 'userId');
    onLoading();
    try {
      var model = MobilePostModel();
      model.title = title.text;
      model.price = price.text;
      model.description = descriptions.text;
      model.category_id = catId;
      model.sub_category_id = subCatId;
      model.latitude = latitude.value;
      model.longitude = longitude.value;
      model.full_address = fullAddress.text;
      model.user_id = int.parse(userId.toString());
      var rentHouse = RentHouseModel();
      rentHouse.totalArea = totalArea.text;
      rentHouse.totalFloor = totalFloor.text;
      rentHouse.floorNo = floorNo.text;
      var response =
          await services.submitPropertyAds(model, rentHouse, selectedImages);
      onSuccess();
    } catch (ex) {
      onError();
    }
  }
}
