import 'package:buy_sale_apps/firebase_options.dart';
import 'package:buy_sale_apps/screens/LoginScreen.dart';
import 'package:buy_sale_apps/screens/NavbarScreen.dart';
import 'package:buy_sale_apps/services/AddPostServices.dart';
import 'package:buy_sale_apps/services/CategoryServices.dart';
import 'package:buy_sale_apps/services/HomeServices.dart';
import 'package:buy_sale_apps/services/JobPostServices.dart';
import 'package:buy_sale_apps/services/LoginServices.dart';
import 'package:buy_sale_apps/services/MobilePostServices.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

String? myStorage;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Get.put(LoginServices(), tag: 'loginServices');
  Get.put(HomeServices(), tag: 'homeServices');
  Get.put(CategoryServices(), tag: 'categoryServices');
  Get.put(AddPostServices(), tag: 'addPostServices');
  Get.put(MobilePostServices(), tag: 'mobilePostServices');
  Get.put(JobPostServices(), tag: 'jobPostServices');
  const storage = FlutterSecureStorage();
  myStorage = await storage.read(key: 'token');
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ZoAds',
      theme: ThemeData(
        fontFamily: 'Poppins',
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)
            .copyWith(background: const Color(0xfffaf7f7)),
      ),
      home: myStorage != null ? NavbarScreen() : LoginScreen(),
    );
  }
}
