import 'package:buy_sale_apps/ReusableWidget.dart';
import 'package:buy_sale_apps/controllers/HomeController.dart';
import 'package:buy_sale_apps/screens/AllCategoryScreen.dart';
import 'package:buy_sale_apps/screens/CategoryDetailsScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:get/get.dart';

class CategoryWidget extends GetView<HomeController> {
  CategoryWidget({Key? key}) : super(key: key);
  ReusableWiget reusableWiget = ReusableWiget();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Categories'),
              TextButton(
                onPressed: () {
                  Get.to(() => AllCategoryScreen());
                },
                child: const Text('View All'),
              ),
            ],
          ),
          reusableWiget.twoLine(),
          reusableWiget.itemSpace(),
          Obx(
            () => GridView.builder(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0,
              ),
              itemCount: controller.categoryList.length,
              itemBuilder: (context, index) {
                var data = controller.categoryList[index];
                return InkWell(
                  onTap: () {
                    controller.getSubCategory(data.id!, () {
                      reusableWiget.loader(context);
                    }, () {
                      Loader.hide();
                      Get.to(() => CategoryDetailScreen());
                    }, () {
                      Loader.hide();
                    });
                  },
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Image(
                          height: 50,
                          image: NetworkImage(data.category_icon!),
                        ),
                        reusableWiget.itemSpace(),
                        Text(data.category_name!)
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
