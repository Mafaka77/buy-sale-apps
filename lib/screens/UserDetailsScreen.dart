import 'package:buy_sale_apps/MyColors.dart';
import 'package:buy_sale_apps/ReusableWidget.dart';
import 'package:buy_sale_apps/controllers/LoginController.dart';
import 'package:buy_sale_apps/screens/NavbarScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class UserDetailsScreen extends StatelessWidget {
  UserDetailsScreen({Key? key}) : super(key: key);
  ReusableWiget reusableWiget = ReusableWiget();
  var storage = const FlutterSecureStorage();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        init: LoginController(),
        builder: (controller) {
          return Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: Colors.white,
            body: SafeArea(
              child: SingleChildScrollView(
                reverse: true,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                        child: CircleAvatar(
                          radius: 100,
                          foregroundImage: AssetImage('images/profile.jpg'),
                        ),
                      ),
                      const Text(
                        'Enter Your Details',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      reusableWiget.twoLine(),
                      reusableWiget.itemSpace(),
                      reusableWiget.itemSpace(),
                      TextFormField(
                        controller: controller.nameText,
                        autofocus: true,
                        decoration: InputDecoration(
                          counterText: '',
                          isDense: true,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: MyColors.lightGreen),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: MyColors.lightGreen),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: MyColors.lightGreen),
                          ),
                          label: Text('User Name',
                              style: reusableWiget.textBoxLabelStyle()),
                        ),
                      ),
                      reusableWiget.itemSpace(),
                      TextFormField(
                        controller: controller.emailText,
                        decoration: InputDecoration(
                          counterText: '',
                          isDense: true,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: MyColors.lightGreen),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: MyColors.lightGreen),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: MyColors.lightGreen),
                          ),
                          label: Text('Email Address',
                              style: reusableWiget.textBoxLabelStyle()),
                        ),
                      ),
                      reusableWiget.itemSpace(),
                      Obx(
                        () => TextFormField(
                          readOnly: true,
                          controller: controller.phoneNoText.value,
                          decoration: InputDecoration(
                            counterText: '',
                            isDense: true,
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: MyColors.lightGreen),
                            ),
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: MyColors.lightGreen),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: MyColors.lightGreen),
                            ),
                            label: Text('Mobile No',
                                style: reusableWiget.textBoxLabelStyle()),
                          ),
                        ),
                      ),
                      reusableWiget.itemSpace(),
                      MaterialButton(
                        elevation: 0,
                        minWidth: Get.width,
                        color: MyColors.lightGreen,
                        onPressed: () {
                          controller.userDetails(() {
                            reusableWiget.loader(context);
                          }, () {
                            Loader.hide();
                            reusableWiget.rawSnackBar(
                                'Welcome !!',
                                const Icon(
                                  Icons.check,
                                  color: Colors.blue,
                                ));
                            Get.offAll(() => NavbarScreen());
                          }, () {
                            Loader.hide();
                            reusableWiget.rawSnackBar(
                                'Error!!',
                                const Icon(
                                  Icons.warning,
                                  color: Colors.red,
                                ));
                          });
                        },
                        child: const Text(
                          'Save User',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
