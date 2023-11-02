import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class BaseService extends GetConnect implements GetxService {
  late Dio client;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    client = Dio();
    client.interceptors.add(InterceptorsWrapper(
      onRequest: (request, handler) async {
        var token = await const FlutterSecureStorage().read(key: 'token');
        if (token != null && token != '') {
          request.headers['Authorization'] = 'Bearer $token';
        }
        return handler.next(request);
      },
    ));
  }
}
