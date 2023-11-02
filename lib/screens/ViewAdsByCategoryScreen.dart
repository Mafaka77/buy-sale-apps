import 'package:buy_sale_apps/ReusableWidget.dart';
import 'package:buy_sale_apps/Routes.dart';
import 'package:buy_sale_apps/controllers/HomeController.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewAdsByCategoryScreen extends GetView<HomeController> {
  ViewAdsByCategoryScreen({Key? key}) : super(key: key);
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
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Obx(
                () => GridView.builder(
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: MediaQuery.of(context).size.width /
                        (MediaQuery.of(context).size.height / 1.7),
                    crossAxisCount: 2,
                    crossAxisSpacing: 5.0,
                    mainAxisSpacing: 5.0,
                  ),
                  itemCount: controller.adsByCategoryList.length,
                  itemBuilder: (context, index) {
                    var ads = controller.adsByCategoryList[index];
                    var image = Routes.STORAGE_URL + ads.images![0].image_url!;
                    return InkWell(
                      splashColor: Colors.white54,
                      radius: 10,
                      onTap: () {
                        print(ads.full_address);
                      },
                      child: Ink(
                        color: Colors.white,
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Center(
                            //   child: CachedNetworkImage(
                            //     imageUrl: image,
                            //     placeholder: (context, url) => const Image(
                            //       height: 100,
                            //       image: AssetImage('images/upload.png'),
                            //     ),
                            //     errorWidget: (context, url, error) => const Image(
                            //       height: 100,
                            //       image: AssetImage('images/upload.png'),
                            //     ),
                            //   ),
                            // ),
                            Center(
                              child: Image(
                                fit: BoxFit.cover,
                                height: Get.height * 0.14,
                                width: Get.width * 0.4,
                                image: NetworkImage(Routes.STORAGE_URL +
                                    ads.images![0].image_url.toString()),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              title: Row(
                                children: [
                                  const Icon(
                                    Icons.currency_rupee_rounded,
                                    size: 15,
                                  ),
                                  Text(ads.price.toString())
                                ],
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    ads.title.toString(),
                                    style: const TextStyle(
                                      fontSize: 13,
                                    ),
                                  ),
                                  Text(
                                    ads.full_address.toString(),
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                              dense: true,
                            )
                          ],
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
    );
  }
}
