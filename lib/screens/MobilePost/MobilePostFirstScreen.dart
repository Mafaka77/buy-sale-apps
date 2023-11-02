import 'package:buy_sale_apps/MyColors.dart';
import 'package:buy_sale_apps/ReusableWidget.dart';
import 'package:buy_sale_apps/controllers/AddPostController.dart';
import 'package:buy_sale_apps/controllers/MobilePostController.dart';
import 'package:buy_sale_apps/screens/MobilePost/MobilePostSecondScreen.dart';
import 'package:buy_sale_apps/screens/PropertyPost/PropertyPostScreen.dart';
import 'package:buy_sale_apps/widgets/post/PostCarWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:get/get.dart';

class MobilePostFirstScreen extends StatelessWidget {
  MobilePostFirstScreen({Key? key}) : super(key: key);
  AddPostController postController = Get.find();
  ReusableWiget reusableWiget = ReusableWiget();
  var tags = Get.arguments[0];
  var catId = Get.arguments[2];
  var subCatId = Get.arguments[1];
  var subCatTags = Get.arguments[3];
  var subCatName = Get.arguments[4];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MobilePostController>(
        init: MobilePostController(),
        builder: (controller) {
          return Scaffold(
            floatingActionButton: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MaterialButton(
                    elevation: 0,
                    minWidth: Get.width * 0.4,
                    color: MyColors.lightGreen,
                    onPressed: () {
                      if (controller.formKey.currentState!.validate()) {
                        controller.getUserData(() {
                          reusableWiget.loader(context);
                        }, () {
                          Loader.hide();
                          Get.to(() => MobilePostSecondScreen(),
                              arguments: [catId, subCatId, tags]);
                        }, () {
                          Loader.hide();
                        });
                      }
                    },
                    child: const Text(
                      'NEXT',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            appBar: AppBar(
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
              ),
              title: Text(
                subCatName,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Details chhu lut rawh le'),
                      reusableWiget.twoLine(),
                      reusableWiget.itemSpace(),
                      reusableWiget.itemSpace(),
                      TextFormField(
                        controller: controller.title,
                        maxLength: 70,
                        validator: (value) {
                          if (value == '' || value!.isEmpty) {
                            return 'Required *';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          isDense: true,
                          label: const Text('Title *'),
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
                      tags == 'vehicle'
                          ? PostCar()
                          : subCatTags == 'rent'
                              ? PropertyPostScreen()
                              : Container(),
                      reusableWiget.itemSpace(),
                      TextFormField(
                        validator: (value) {
                          if (value == '' || value!.isEmpty) {
                            return 'Required *';
                          }
                          return null;
                        },
                        controller: controller.price,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.currency_rupee,
                          ),
                          isDense: true,
                          label: subCatTags == 'rent'
                              ? const Text('Rent/Month *')
                              : const Text('Price *'),
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
                        validator: (value) {
                          if (value == '' || value!.isEmpty) {
                            return 'Required *';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.multiline,
                        controller: controller.descriptions,
                        maxLength: 180,
                        maxLines: 8,
                        decoration: InputDecoration(
                          isDense: true,
                          label: const Text('Details'),
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
                ),
              ),
            ),
          );
        });
  }
}
