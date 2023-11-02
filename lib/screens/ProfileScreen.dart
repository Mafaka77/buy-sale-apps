import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: Stack(
          children: [
            Container(
              width: Get.width,
              height: Get.height,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFD8B5FF),
                    Color(0xFF1EAE98),
                  ],
                  begin: FractionalOffset(0.0, 0.1),
                  end: FractionalOffset(1.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp,
                ),
              ),
              child: const SafeArea(
                child: Text('asd'),
              ),
            ),
            Positioned(
              top: Get.height * 0.3,
              child: Container(
                width: Get.width,
                height: Get.height,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xfffaf7f7)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Card(
                        color: Colors.white,
                        elevation: 0,
                        child: ListTile(
                          onTap: () async {
                            var storage = const FlutterSecureStorage();
                            await storage.deleteAll();
                          },
                          dense: true,
                          title: const Text('LOGOUT'),
                          trailing: const Icon(Icons.logout),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
