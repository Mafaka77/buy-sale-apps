import 'package:buy_sale_apps/MyColors.dart';
import 'package:buy_sale_apps/ReusableWidget.dart';
import 'package:buy_sale_apps/controllers/MobilePostController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PropertyPostScreen extends GetView<MobilePostController> {
  PropertyPostScreen({Key? key}) : super(key: key);
  ReusableWiget reusableWiget = ReusableWiget();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TextFormField(
            controller: controller.totalArea,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              isDense: true,
              label: const Text('Total Area (in sq ft)'),
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
          TextFormField(
            controller: controller.totalFloor,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              isDense: true,
              label: const Text('Total Floor'),
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
          TextFormField(
            controller: controller.floorNo,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              isDense: true,
              label: const Text('Floor No '),
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
