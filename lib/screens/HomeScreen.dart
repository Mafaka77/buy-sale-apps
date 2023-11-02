import 'package:buy_sale_apps/ReusableWidget.dart';
import 'package:buy_sale_apps/controllers/HomeController.dart';
import 'package:buy_sale_apps/widgets/home/CategoryWidget.dart';
import 'package:buy_sale_apps/widgets/home/FeaturedWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  ReusableWiget reusableWiget = ReusableWiget();
  var storage = const FlutterSecureStorage();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: const Color(0xfffaf7f7),
            body: CustomScrollView(slivers: [
              SliverAppBar(
                backgroundColor: const Color(0xfffaf7f7),
                leadingWidth: 200,
                leading: Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    const Icon(
                      Icons.location_on,
                      size: 14,
                    ),
                    const Text(
                      'Mizoram',
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_drop_down_outlined),
                    ),
                  ],
                ),
                actions: const [
                  Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: Icon(Icons.search, size: 30),
                  ),
                  // Shohel Rana Shanto
                ],
                pinned: true,
                expandedHeight: 10,
                floating: true,
                snap: true,
              ),
              SliverList(
                  delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Obx(
                    () => controller.onLoading.isTrue
                        ? const Center(
                            child: CupertinoActivityIndicator(),
                          )
                        : Container(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                reusableWiget.itemSpace(),
                                Container(
                                  width: Get.width,
                                  height: 200,
                                  color: Colors.white,
                                  child: const Image(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        'https://indiater.com/wp-content/uploads/2020/12/football-player-creative-ads-banner-design-template-psd-990x700.jpg'),
                                  ),
                                ),
                                reusableWiget.itemSpace(),
                                CategoryWidget(),
                                reusableWiget.itemSpace(),
                                FeaturedWidget(),
                              ],
                            ),
                          ),
                  );
                },
                childCount: 1,
                addAutomaticKeepAlives: false,
              )),
            ]),
          );
        });
  }
}
