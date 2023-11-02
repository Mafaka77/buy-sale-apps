import 'package:buy_sale_apps/MyColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:get/get.dart';

class ReusableWiget {
  inputDecoration(String title) {
    return InputDecoration(
      counter: Container(),
      fillColor: Colors.white,
      isDense: true,
      label: Text(title),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: MyColors.lightGreen),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: MyColors.lightGreen),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: MyColors.lightGreen),
      ),
    );
  }

  textBoxLabelStyle() {
    return TextStyle(fontSize: 12, color: MyColors.lightGreen);
  }

  twoLine() {
    return Row(
      children: [
        Container(
          width: 30,
          height: 2,
          color: Colors.black,
        ),
        Container(
          width: 30,
          height: 2,
          color: MyColors.lightGreen,
        ),
      ],
    );
  }

  itemSpace() {
    return const SizedBox(
      height: 10,
    );
  }

  rawSnackBar(String message, Icon icon) {
    return Get.rawSnackbar(
      message: message,
      icon: icon,
      backgroundColor: Colors.black,
      snackPosition: SnackPosition.TOP,
      borderRadius: 10,
      snackStyle: SnackStyle.FLOATING,
      shouldIconPulse: true,
      barBlur: 20,
      margin: const EdgeInsets.only(
        top: 30,
        left: 40,
        right: 40,
      ),
      isDismissible: true,
      duration: const Duration(milliseconds: 3000),
    );
  }

  loader(BuildContext context) {
    Loader.show(context,
        // isSafeAreaOverlay: false,
        // isBottomBarOverlay: false,
        // overlayFromBottom: Get.height * 0.48,
        // overlayFromTop: Get.height * 0.48,
        overlayColor: Colors.transparent,
        progressIndicator: const CupertinoActivityIndicator(
          color: Colors.black,
          radius: 12,
        ),
        themeData: Theme.of(context).copyWith(
            colorScheme:
                ColorScheme.fromSwatch().copyWith(secondary: Colors.green)));
  }
}
