import 'package:buy_sale_apps/MyColors.dart';
import 'package:buy_sale_apps/ReusableWidget.dart';
import 'package:buy_sale_apps/controllers/LoginController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:get/get.dart';

import 'OtpScreen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  ReusableWiget reusableWiget = ReusableWiget();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        init: LoginController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: Colors.white,
            resizeToAvoidBottomInset: false,
            body: SafeArea(
                child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Center(
                      child: Image(
                        height: Get.height * 0.35,
                        width: Get.width,
                        image: const AssetImage('images/login_.jpg'),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.zero,
                      child: const Text(
                        'Send OTP',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 10),
                      child: const Text(
                        'We will send you One Time Password\n'
                        'on the mobile number',
                        textAlign: TextAlign.center,
                        style: TextStyle(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: controller.mobileText,
                        maxLength: 10,
                        autofocus: true,
                        keyboardType: TextInputType.number,
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
                          label: Text('Enter Mobile Number',
                              style: reusableWiget.textBoxLabelStyle()),
                          prefix: const Text('+91  '),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: CircleAvatar(
                            maxRadius: 32,
                            backgroundColor: Colors.black,
                            child: IconButton(
                              iconSize: 30,
                              onPressed: () {
                                controller.sendOtp(() {
                                  reusableWiget.loader(context);
                                }, (int userId) {
                                  Loader.hide();
                                  reusableWiget.rawSnackBar(
                                    'OTP sent to you mobile number',
                                    const Icon(
                                      Icons.check,
                                      color: Colors.blue,
                                    ),
                                  );
                                  Get.to(
                                    () => OtpScreen(),
                                    arguments: [userId],
                                  );
                                }, () {
                                  Loader.hide();
                                  reusableWiget.rawSnackBar(
                                    'Error Occured!',
                                    const Icon(
                                      Icons.warning,
                                      color: Colors.red,
                                    ),
                                  );
                                });
                              },
                              icon: Icon(
                                Icons.send_outlined,
                                color: MyColors.lightGreen,
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                    // Padding(
                    //   padding: const EdgeInsets.all(10.0),
                    //   child: MaterialButton(
                    //     color: MyColors.lightGreen,
                    //     minWidth: Get.width,
                    //     elevation: 0,
                    //     onPressed: () {
                    //       Get.to(() => OtpScreen());
                    //     },
                    //     child: const Text(
                    //       'SEND OTP',
                    //       style: TextStyle(
                    //           color: Colors.white, fontWeight: FontWeight.bold),
                    //     ),
                    //   ),
                    // )
                  ],
                ),
              ),
            )),
          );
        });
  }
}
