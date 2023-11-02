import 'package:buy_sale_apps/ReusableWidget.dart';
import 'package:buy_sale_apps/controllers/CategoryController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllCategoryScreen extends StatelessWidget {
  AllCategoryScreen({Key? key}) : super(key: key);
  ReusableWiget reusableWiget = ReusableWiget();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryController>(
        init: CategoryController(),
        builder: (controller) {
          return Scaffold(
              appBar: AppBar(
                elevation: 0,
                leading: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.arrow_back_ios_new_rounded)),
              ),
              body: Obx(() {
                return controller.isLoading.isTrue
                    ? const Center(
                        child: CupertinoActivityIndicator(
                          color: Colors.black,
                        ),
                      )
                    : SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('All Categories'),
                              reusableWiget.itemSpace(),
                              reusableWiget.twoLine(),
                              reusableWiget.itemSpace(),
                              reusableWiget.itemSpace(),
                              Obx(
                                () => GridView.builder(
                                  padding: EdgeInsets.zero,
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4,
                                    crossAxisSpacing: 5.0,
                                    mainAxisSpacing: 5.0,
                                  ),
                                  itemCount: controller.categoryList.length,
                                  itemBuilder: (context, index) {
                                    var data = controller.categoryList[index];
                                    return Container(
                                      color: Colors.white,
                                      child: Column(
                                        children: [
                                          Image(
                                            height: 50,
                                            image: NetworkImage(
                                                data.category_icon!),
                                          ),
                                          reusableWiget.itemSpace(),
                                          Text(data.category_name!)
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
              }));
        });
  }
}
