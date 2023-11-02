import 'package:buy_sale_apps/services/LoginServices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var mobileText = TextEditingController();
  var phoneNoText = TextEditingController().obs;
  var emailText = TextEditingController();
  var nameText = TextEditingController();
  LoginServices services = Get.find(tag: 'loginServices');
  var storage = const FlutterSecureStorage();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void getMobile() async {
    var mobile = await storage.read(key: 'mobile');
    phoneNoText.value.text = mobile.toString();
    update();
  }

  void sendOtp(Function onLoading, Function onSuccess, Function onError) async {
    onLoading();
    try {
      var response = await services.sendOtp(mobileText.text.toString());
      print(response);
      var userId = response['user_id'];
      onSuccess(userId);
    } catch (ex) {
      print(ex);
      onError();
    }
  }

  void verifyOtp(int id, int otp, Function onLoading, Function onSuccess,
      Function onError) async {
    onLoading();
    try {
      var response = await services.verifyOtp(id, otp);
      var userId = await storage.write(
          key: 'userId', value: response['user_id'].toString());
      var token = await storage.write(
          key: 'token', value: response['token'].toString());
      var mobile = await storage.write(
          key: 'mobile', value: response['mobile'].toString());
      getMobile();
      onSuccess(response['is_profile_completed']);
    } catch (ex) {
      print(ex);
      onError();
    }
  }

  void userDetails(
      Function onLoading, Function onSuccess, Function onError) async {
    onLoading();
    try {
      var userId = await storage.read(key: 'userId');
      var reponse = await services.userDetails(
          int.parse(userId.toString()), emailText.text, nameText.text);
      onSuccess();
    } catch (ex) {
      onError();
    }
  }
}
