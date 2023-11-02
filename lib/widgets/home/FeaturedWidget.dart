import 'package:buy_sale_apps/ReusableWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeaturedWidget extends StatelessWidget {
  FeaturedWidget({Key? key}) : super(key: key);
  ReusableWiget reusableWiget = ReusableWiget();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Featured',
        ),
        reusableWiget.itemSpace(),
        reusableWiget.twoLine(),
        reusableWiget.itemSpace(),
        GridView.builder(
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 5.0,
          ),
          itemCount: 8,
          itemBuilder: (context, index) {
            return Container(
              color: Colors.white,
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image(
                      fit: BoxFit.cover,
                      height: Get.height * 0.12,
                      width: Get.width * 0.3,
                      image: const NetworkImage(
                          'https://cdni.autocarindia.com/Utils/ImageResizer.ashx?n=https://cdni.autocarindia.com/ExtraImages/20220528030306_Venue%20colour%20corrected.jpg&w=700&q=90&c=1'),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Row(
                    children: [
                      Icon(
                        Icons.currency_rupee_rounded,
                        size: 15,
                      ),
                      Text('100000')
                    ],
                  ),
                  const Text('Iphone 14 '),
                  const Text('Aizawl')
                ],
              ),
            );
          },
        )
      ],
    );
  }
}
