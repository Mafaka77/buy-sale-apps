import 'package:buy_sale_apps/ReusableWidget.dart';
import 'package:buy_sale_apps/controllers/AddPostController.dart';
import 'package:buy_sale_apps/screens/JobPost/JobPostScreen.dart';
import 'package:buy_sale_apps/screens/MobilePost/MobilePostFirstScreen.dart';
import 'package:buy_sale_apps/screens/PropertyPost/PropertyPostScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubCategoryScreen extends GetView<AddPostController> {
  SubCategoryScreen({Key? key}) : super(key: key);
  ReusableWiget reusableWiget = ReusableWiget();
  var catId = Get.arguments[0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Obx(() => ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.subCategoryList.length,
                    itemBuilder: (context, index) {
                      var data = controller.subCategoryList[index];
                      return Card(
                        color: Colors.white,
                        elevation: 0,
                        child: ListTile(
                          dense: true,
                          onTap: () {
                            var cat = data.category!.tags;
                            // Get.to(() => MobilePostFirstScreen(),
                            //     arguments: [cat]);

                            switch (cat) {
                              case 'jobs':
                                Get.to(() => JobPostScreen(), arguments: [
                                  data.name,
                                  data.id,
                                  catId,
                                ]);
                                break;

                              default:
                                Get.to(() => MobilePostFirstScreen(),
                                    arguments: [
                                      cat,
                                      data.id,
                                      catId,
                                      data.tags,
                                      data.name,
                                    ]);
                                break;
                            }
                          },
                          title: Text(data.name!),
                          trailing: const Icon(
                            size: 17,
                            Icons.arrow_forward_ios,
                            color: Colors.black,
                          ),
                        ),
                      );
                    },
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
