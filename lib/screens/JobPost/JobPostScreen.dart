import 'dart:io';
import 'package:buy_sale_apps/ReusableWidget.dart';
import 'package:buy_sale_apps/controllers/JobPostController.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../MyColors.dart';

class JobPostScreen extends StatelessWidget {
  JobPostScreen({Key? key}) : super(key: key);
  ReusableWiget reusableWiget = ReusableWiget();
  var name = Get.arguments[0];
  var subCatId = Get.arguments[1];
  var catId = Get.arguments[2];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<JobPostController>(
        init: JobPostController(),
        builder: (controller) {
          return Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: AppBar(
              title: Text(
                name,
                style: const TextStyle(fontSize: 16),
              ),
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                ),
              ),
            ),
            // bottomSheet: Padding(
            //   padding: const EdgeInsets.all(20.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.end,
            //     children: [
            //       MaterialButton(
            //         elevation: 0,
            //         minWidth: Get.width * 0.4,
            //         color: MyColors.lightGreen,
            //         onPressed: () {},
            //         child: const Text(
            //           'NEXT',
            //           style: TextStyle(
            //               color: Colors.white, fontWeight: FontWeight.bold),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        onTap: () {
                          uploadBannerImage(
                            context,
                            ImageSource.gallery,
                            controller,
                          );
                        },
                        readOnly: true,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          isDense: true,
                          label: const Text('Upload Banner Image'),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: MyColors.lightGreen),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: MyColors.lightGreen),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: MyColors.lightGreen),
                          ),
                          prefixIcon: const Icon(
                            Icons.camera_alt_outlined,
                          ),
                        ),
                        style: reusableWiget.textBoxLabelStyle(),
                      ),
                      reusableWiget.itemSpace(),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty || value == '') {
                            return 'Required';
                          }
                          return null;
                        },
                        controller: controller.title,
                        maxLength: 70,
                        decoration:
                            reusableWiget.inputDecoration('Job Title *'),
                        style: reusableWiget.textBoxLabelStyle(),
                      ),
                      reusableWiget.itemSpace(),
                      TextFormField(
                        controller: controller.salary,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.currency_rupee),
                          fillColor: Colors.white,
                          isDense: true,
                          label: const Text('Salary/Hlawh'),
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
                        controller: controller.qualification,
                        keyboardType: TextInputType.number,
                        decoration:
                            reusableWiget.inputDecoration('Qualification'),
                        style: reusableWiget.textBoxLabelStyle(),
                      ),
                      reusableWiget.itemSpace(),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty || value == '') {
                            return 'Required';
                          }
                          return null;
                        },
                        controller: controller.description,
                        maxLines: 5,
                        maxLength: 200,
                        decoration: reusableWiget.inputDecoration('Details *'),
                        style: reusableWiget.textBoxLabelStyle(),
                      ),
                      reusableWiget.itemSpace(),
                      TextFormField(
                        onTap: () {
                          // uploadDocument(context, controller);
                        },
                        readOnly: true,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          isDense: true,
                          label: const Text('Upload document'),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: MyColors.lightGreen),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: MyColors.lightGreen),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: MyColors.lightGreen),
                          ),
                          prefixIcon: const Icon(
                            Icons.attachment_rounded,
                          ),
                        ),
                        style: reusableWiget.textBoxLabelStyle(),
                      ),
                      reusableWiget.itemSpace(),
                      TextFormField(
                        controller: controller.phoneNo,
                        maxLength: 10,
                        keyboardType: TextInputType.phone,
                        decoration: reusableWiget.inputDecoration('Phone No *'),
                        style: reusableWiget.textBoxLabelStyle(),
                      ),
                      reusableWiget.itemSpace(),
                      TextFormField(
                        controller: controller.emailAddress,
                        keyboardType: TextInputType.emailAddress,
                        decoration:
                            reusableWiget.inputDecoration('Email Address'),
                        style: reusableWiget.textBoxLabelStyle(),
                      ),
                      reusableWiget.itemSpace(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: Get.width * 0.4,
                            color: MyColors.lightGreen,
                            child: Row(
                              children: [
                                IconButton(
                                  color: Colors.white,
                                  onPressed: () {},
                                  icon: const Icon(EvaIcons.cloudUpload),
                                ),
                                const Text(
                                  'POST JOB',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                )
                              ],
                            ),
                          )
                          // MaterialButton(
                          //   elevation: 0,
                          //   minWidth: Get.width * 0.4,
                          //   color: MyColors.lightGreen,
                          //   onPressed: () {},
                          //   child: const Text(
                          //     'SUBMIT',
                          //     style: TextStyle(
                          //         color: Colors.white,
                          //         fontWeight: FontWeight.bold),
                          //   ),
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  Future<void> uploadBannerImage(BuildContext context, ImageSource source,
      JobPostController controller) async {
    final ImagePicker picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: source,
      imageQuality: 25,
    );
    controller.bannerImage = pickedFile!;
    controller.update();
  }

  // Future<void> uploadDocument(
  //     BuildContext context, JobPostController controller) async {
  //   FilePickerResult? result = await FilePicker.platform.pickFiles(
  //     allowedExtensions: ['pdf', 'docs'],
  //     allowCompression: true,
  //     allowMultiple: false,
  //     type: FileType.custom,
  //   );
  //   if (result != null) {
  //     controller.document = File(result.files.first.path!);
  //     controller.update();
  //   }
  // }
}
