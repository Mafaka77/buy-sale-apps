import 'package:buy_sale_apps/ReusableWidget.dart';
import 'package:buy_sale_apps/controllers/HomeController.dart';
import 'package:buy_sale_apps/screens/ViewAdsByCategoryScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:get/get.dart';

class CategoryDetailScreen extends GetView<HomeController> {
  CategoryDetailScreen({Key? key}) : super(key: key);
  ReusableWiget reusableWiget = ReusableWiget();
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
                            controller.getAdsByCategory(
                                data.category_id!, data.id!, () {
                              reusableWiget.loader(context);
                            }, () {
                              Loader.hide();
                              Get.to(() => ViewAdsByCategoryScreen());
                            }, () {
                              Loader.hide();
                            });
                            // switch (cat) {
                            //   case 'jobs':
                            //     Get.to(() => JobPostScreen(),
                            //         arguments: [data.name]);
                            //     break;

                            //   default:
                            //     Get.to(() => MobilePostFirstScreen(),
                            //         arguments: [
                            //           cat,
                            //           data.id,
                            //           catId,
                            //           data.tags,
                            //           data.name,
                            //         ]);
                            //     break;
                            // }
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
