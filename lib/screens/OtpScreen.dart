import 'package:buy_sale_apps/MyColors.dart';
import 'package:buy_sale_apps/ReusableWidget.dart';
import 'package:buy_sale_apps/controllers/LoginController.dart';
import 'package:buy_sale_apps/screens/NavbarScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:get/get.dart';
import 'package:otp_timer_button/otp_timer_button.dart';
import 'package:pinput/pinput.dart';

import 'UserDetailsScreen.dart';

class OtpScreen extends GetView<LoginController> {
  OtpScreen({Key? key}) : super(key: key);
  ReusableWiget reusableWiget = ReusableWiget();
  var userId = Get.arguments[0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.lightGreen,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              reusableWiget.itemSpace(),
              reusableWiget.itemSpace(),
              reusableWiget.itemSpace(),
              reusableWiget.itemSpace(),
              reusableWiget.itemSpace(),
              reusableWiget.itemSpace(),
              reusableWiget.itemSpace(),
              reusableWiget.itemSpace(),
              reusableWiget.itemSpace(),
              const Text(
                'Enter OTP send to 7308002120',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              reusableWiget.twoLine(),
              reusableWiget.itemSpace(),
              reusableWiget.itemSpace(),
              reusableWiget.itemSpace(),
              Pinput(
                autofocus: true,
                androidSmsAutofillMethod:
                    AndroidSmsAutofillMethod.smsRetrieverApi,
                keyboardType: TextInputType.number,
                defaultPinTheme: PinTheme(
                  width: 50,
                  height: 60,
                  textStyle: const TextStyle(
                      fontSize: 20,
                      color: Color.fromRGBO(8, 43, 74, 1),
                      fontWeight: FontWeight.w600),
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    border: Border.all(color: MyColors.lightGreen),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onCompleted: (val) async {
                  controller.verifyOtp(userId, int.parse(val), () {
                    reusableWiget.loader(context);
                  }, (int check) {
                    Loader.hide();
                    reusableWiget.rawSnackBar(
                      'OTP Verified',
                      const Icon(
                        Icons.check,
                        color: Colors.blue,
                      ),
                    );
                    check == 1
                        ? Get.offAll(() => NavbarScreen())
                        : Get.offAll(() => UserDetailsScreen());
                  }, () {
                    Loader.hide();
                    reusableWiget.rawSnackBar(
                      'Error Occured!!',
                      const Icon(
                        Icons.warning,
                        color: Colors.red,
                      ),
                    );
                  });
                },
              ),
              reusableWiget.itemSpace(),
              Row(
                children: [
                  SizedBox(
                    width: Get.width * 0.4,
                    child: IconButton(
                        splashRadius: 10,
                        onPressed: () {},
                        icon: Row(
                          children: [
                            Icon(
                              Icons.message,
                              size: 16,
                              color: MyColors.lightGreen,
                            ),
                            const Text('  Resend OTP?'),
                          ],
                        )),
                  ),
                  const Text('    |'),
                  SizedBox(
                    width: Get.width * 0.2,
                    child: OtpTimerButton(
                      buttonType: ButtonType.text_button,
                      backgroundColor: Colors.white,
                      onPressed: () {},
                      text: const Text(''),
                      duration: 120,
                      textColor: MyColors.lightGreen,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
