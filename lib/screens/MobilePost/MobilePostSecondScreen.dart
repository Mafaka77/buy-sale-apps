import 'dart:io';

import 'package:buy_sale_apps/ReusableWidget.dart';
import 'package:buy_sale_apps/controllers/MobilePostController.dart';
import 'package:buy_sale_apps/screens/NavbarScreen.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../MyColors.dart';

class MobilePostSecondScreen extends GetView<MobilePostController> {
  MobilePostSecondScreen({Key? key}) : super(key: key);
  ReusableWiget reusableWiget = ReusableWiget();
  var catId = Get.arguments[0];
  var subCatId = Get.arguments[1];
  var tags = Get.arguments[2];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomSheet: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            MaterialButton(
              elevation: 0,
              minWidth: Get.width * 0.4,
              color: MyColors.lightGreen,
              onPressed: () {
                switch (tags) {
                  case 'vehicle':
                    submitVehicle(context);
                    break;
                  case 'property':
                    submitProperty(context);
                  default:
                    submitPost(context);
                    break;
                }
              },
              child: const Text(
                'SUBMIT',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
            )),
      ),
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: controller.secondKey,
            child: Column(
              children: [
                reusableWiget.itemSpace(),
                TextFormField(
                  onTap: () {
                    openGallery(context, ImageSource.gallery, controller);
                  },
                  readOnly: true,
                  decoration: InputDecoration(
                    isDense: true,
                    label: const Text('Upload Image'),
                    prefixIcon: const Icon(
                      EvaIcons.image2,
                    ),
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
                Obx(
                  () => GridView.builder(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 2.0,
                      mainAxisSpacing: 10.0,
                    ),
                    itemCount: controller.selectedImages.length,
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: FileImage(
                                  File(controller.selectedImages[index].path),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            child: IconButton(
                                onPressed: () {
                                  controller.selectedImages
                                      .remove(controller.selectedImages[index]);
                                },
                                icon: const Icon(
                                  Icons.clear,
                                  color: Colors.red,
                                )),
                          )
                        ],
                      );
                    },
                  ),
                ),
                reusableWiget.itemSpace(),
                TextFormField(
                  validator: (value) {
                    if (value == '' || value!.isEmpty) {
                      return 'Required *';
                    }
                    return null;
                  },
                  controller: controller.fullAddress,
                  decoration: InputDecoration(
                    isDense: true,
                    label: const Text('Address'),
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
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Obx(
                      () => Container(
                        margin: EdgeInsets.only(bottom: Get.height * 0.11),
                        color: Colors.white,
                        height: Get.height * 0.1,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: ListTile(
                            dense: true,
                            leading: const CircleAvatar(
                              child: Image(
                                  image: NetworkImage(
                                      'https://res.cloudinary.com/djyhb9cf6/image/upload/v1694225478/user_1_sk3gdt.png')),
                            ),
                            title: Text(controller.userData.first.name!),
                            subtitle: Text(controller.userData.first.mobile!),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> openCamera(
    BuildContext context,
    ImageSource source,
  ) async {
    final ImagePicker picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: source,
      imageQuality: 25,
    );
  }

  Future<void> openGallery(BuildContext context, ImageSource source,
      MobilePostController controller) async {
    final ImagePicker picker = ImagePicker();
    final pickedFile = await picker.pickMultiImage(
      imageQuality: 25,
    );
    if (pickedFile.isEmpty || pickedFile.length < 5) {
      controller.selectedImages.addAll(pickedFile);
      controller.update();
    } else {
      reusableWiget.rawSnackBar(
        'Please select upto 4 images',
        const Icon(
          Icons.warning,
          color: Colors.red,
        ),
      );
    }
  }

  void submitPost(BuildContext context) {
    if (controller.selectedImages.isEmpty) {
      reusableWiget.rawSnackBar(
          'Please select image',
          const Icon(
            Icons.warning,
            color: Colors.red,
          ));
    } else {
      controller.submitAds(catId, subCatId, () {
        reusableWiget.loader(context);
      }, () {
        Loader.hide();
        reusableWiget.rawSnackBar(
          'Ads posted successfully',
          const Icon(
            Icons.check,
            color: Colors.blue,
          ),
        );
        Get.offAll(() => NavbarScreen());
      }, () {
        Loader.hide();
        reusableWiget.rawSnackBar(
          'Error Occured!!Try again',
          const Icon(
            Icons.warning,
            color: Colors.red,
          ),
        );
      });
    }
  }

  void submitVehicle(BuildContext context) {
    if (controller.selectedImages.isEmpty) {
      reusableWiget.rawSnackBar(
          'Please select image',
          const Icon(
            Icons.warning,
            color: Colors.red,
          ));
    } else {
      controller.submitVehicleAds(catId, subCatId, () {
        reusableWiget.loader(context);
      }, () {
        Loader.hide();
        reusableWiget.rawSnackBar(
          'Ads posted successfully',
          const Icon(
            Icons.check,
            color: Colors.blue,
          ),
        );
        Get.offAll(() => NavbarScreen());
      }, () {
        Loader.hide();
        reusableWiget.rawSnackBar(
          'Error Occured!!Try again',
          const Icon(
            Icons.warning,
            color: Colors.red,
          ),
        );
      });
    }
  }

  void submitProperty(BuildContext context) {
    // controller.submitPropertyAds(catId, subCatId, () {}, () {}, () {});
    if (controller.selectedImages.isEmpty) {
      reusableWiget.rawSnackBar(
          'Please select image',
          const Icon(
            Icons.warning,
            color: Colors.red,
          ));
    } else {
      controller.submitPropertyAds(catId, subCatId, () {
        reusableWiget.loader(context);
      }, () {
        Loader.hide();
        reusableWiget.rawSnackBar(
          'Ads posted successfully',
          const Icon(
            Icons.check,
            color: Colors.blue,
          ),
        );
        Get.delete<MobilePostController>();
        Get.off(() => NavbarScreen());
      }, () {
        Loader.hide();
        reusableWiget.rawSnackBar(
          'Error Occured!!Try again',
          const Icon(
            Icons.warning,
            color: Colors.red,
          ),
        );
      });
    }
  }
}
