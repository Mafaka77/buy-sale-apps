import 'package:buy_sale_apps/ReusableWidget.dart';
import 'package:buy_sale_apps/controllers/MobilePostController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../MyColors.dart';

class PostCar extends GetView<MobilePostController> {
  PostCar({Key? key}) : super(key: key);
  ReusableWiget reusableWiget = ReusableWiget();
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            controller: controller.carModel,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              isDense: true,
              label: const Text('Model/Year'),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: MyColors.lightGreen),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyColors.lightGreen),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyColors.lightGreen),
              ),
            ),
            style: reusableWiget.textBoxLabelStyle(),
          ),
          reusableWiget.itemSpace(),
          reusableWiget.itemSpace(),
          TextFormField(
            controller: controller.carKmDone,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              isDense: true,
              label: const Text('KM Done'),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: MyColors.lightGreen),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyColors.lightGreen),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyColors.lightGreen),
              ),
            ),
            style: reusableWiget.textBoxLabelStyle(),
          ),
        ],
      ),
    );
  }
}
