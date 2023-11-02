import 'dart:io';
import 'package:buy_sale_apps/BaseService.dart';
import 'package:buy_sale_apps/Routes.dart';
import 'package:buy_sale_apps/models/MobilePostModel.dart';
import 'package:buy_sale_apps/models/RentHoustModel.dart';
import 'package:buy_sale_apps/models/UserModel.dart';
import 'package:buy_sale_apps/models/VehicleModel.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class MobilePostServices extends BaseService {
  Future<UserModel> getUserData(int id) async {
    try {
      var response = await client.get(Routes.GET_USER_DATA(id));
      var data = response.data['data'];
      return UserModel.fromMap(data);
    } catch (ex) {
      return Future.error(ex);
    }
  }

  Future submitAds(MobilePostModel model, List<XFile> images) async {
    try {
      FormData formData = FormData();
      for (XFile image in images) {
        formData.files.add(
          MapEntry(
            "images[]",
            await MultipartFile.fromFile(
              image.path,
              filename: image.name,
            ),
          ),
        );
      }
      var response = await client.post(
        Routes.SUBMIT_ADS,
        data: formData,
        queryParameters: {
          'data': model.toMap(),
        },
      );
    } catch (ex) {
      print(ex);
      return Future.error(ex);
    }
  }

  Future submitVehicleAds(MobilePostModel postModel, VehicleModel vehicleModel,
      List<XFile> images) async {
    try {
      FormData formData = FormData();
      for (XFile image in images) {
        formData.files.add(
          MapEntry(
            "images[]",
            await MultipartFile.fromFile(
              image.path,
              filename: image.name,
            ),
          ),
        );
      }
      var response = await client
          .post(Routes.SUBMIT_VEHICLE_ADS, data: formData, queryParameters: {
        'data': postModel.toMap(),
        'vehicles': vehicleModel.toMap(),
      });
    } catch (ex) {}
  }

  Future submitPropertyAds(MobilePostModel postModel,
      RentHouseModel rentHouseModel, List<XFile> images) async {
    try {
      FormData formData = FormData();
      for (XFile image in images) {
        formData.files.add(
          MapEntry(
            "images[]",
            await MultipartFile.fromFile(
              image.path,
              filename: image.name,
            ),
          ),
        );
      }
      var response = await client
          .post(Routes.SUBMIT_PROPERTY_ADS, data: formData, queryParameters: {
        'data': postModel.toMap(),
        'houses': rentHouseModel.toMap(),
      });
    } catch (ex) {}
  }
}
