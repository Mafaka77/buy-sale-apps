import 'package:buy_sale_apps/ReusableWidget.dart';
import 'package:buy_sale_apps/controllers/AddPostController.dart';
import 'package:buy_sale_apps/screens/SubCategoryScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class AddPostScreen extends StatelessWidget {
  AddPostScreen({Key? key}) : super(key: key);
  ReusableWiget reusableWiget = ReusableWiget();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddPostController>(
        init: AddPostController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: const Color(0xfffaf7f7),
            body: Obx(
              () => controller.isLoading.isTrue
                  ? const Center(
                      child: CupertinoActivityIndicator(),
                    )
                  : SafeArea(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('POST SIAM RAWH LE'),
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
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 5.0,
                                    mainAxisSpacing: 5.0,
                                  ),
                                  itemCount: controller.categoryList.length,
                                  itemBuilder: (context, index) {
                                    var data = controller.categoryList[index];
                                    return InkWell(
                                      onTap: () async {
                                        var permission =
                                            await Permission.location.status;
                                        if (!permission.isGranted) {
                                          await Permission.location.request();
                                        }
                                        controller.getSubCategory(data.id!, () {
                                          reusableWiget.loader(context);
                                        }, () {
                                          Loader.hide();
                                          Get.to(() => SubCategoryScreen(),
                                              arguments: [data.id]);
                                        }, () {
                                          Loader.hide();
                                          reusableWiget.rawSnackBar(
                                            'Error Occured!!',
                                            const Icon(
                                              Icons.warning,
                                              color: Colors.red,
                                            ),
                                          );
                                        });
                                      },
                                      child: Container(
                                        color: Colors.white,
                                        child: Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Image(
                                                height: 60,
                                                image: NetworkImage(
                                                    data.category_icon!),
                                              ),
                                              reusableWiget.itemSpace(),
                                              Text(data.category_name!)
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
            ),
          );
        });
  }
}
