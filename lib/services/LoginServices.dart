import 'package:buy_sale_apps/BaseService.dart';
import 'package:buy_sale_apps/Routes.dart';

class LoginServices extends BaseService {
  Future sendOtp(String mobile) async {
    try {
      var response = await client.get(Routes.SEND_OTP, data: {
        'mobile': mobile,
      });
      return response.data;
    } catch (ex) {
      return Future.error(ex);
    }
  }

  Future verifyOtp(int id, int otp) async {
    try {
      var response =
          await client.get(Routes.VERIFY_OTP(id), data: {'otp': otp});
      return response.data;
    } catch (ex) {
      return Future.error(ex);
    }
  }

  Future userDetails(int id, String email, String name) async {
    try {
      var response = await client.put(Routes.USER_DETAILS,
          data: {'id': id, 'name': name, 'email': email});
      return response.data;
    } catch (ex) {
      return Future.error(ex);
    }
  }
}
