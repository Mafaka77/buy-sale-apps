import 'dart:io';

import 'package:buy_sale_apps/services/JobPostServices.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class JobPostController extends GetxController {
  JobPostServices services = Get.find(tag: 'jobPostServices');
  final formKey = GlobalKey<FormState>();
  var title = TextEditingController();
  var salary = TextEditingController();
  var description = TextEditingController();
  var phoneNo = TextEditingController();
  var emailAddress = TextEditingController();
  var qualification = TextEditingController();
  late XFile bannerImage;
  File? document;
}
