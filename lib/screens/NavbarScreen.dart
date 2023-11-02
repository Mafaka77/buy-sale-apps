import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:buy_sale_apps/MyColors.dart';
import 'package:buy_sale_apps/ReusableWidget.dart';
import 'package:buy_sale_apps/controllers/NavbarController.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavbarScreen extends StatelessWidget {
  NavbarScreen({Key? key}) : super(key: key);
  ReusableWiget reusableWiget = ReusableWiget();
  final iconList = <IconData>[
    EvaIcons.home,
    EvaIcons.person,
  ];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavbarController>(
        init: NavbarController(),
        builder: (controller) {
          return Scaffold(
            body: Center(
                child: controller.widgetOptions
                    .elementAt(controller.selectedIndex)),
            floatingActionButton: FloatingActionButton(
              backgroundColor: MyColors.lightGreen,
              elevation: 0,
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide.none,
              ),
              onPressed: () {
                controller.selectedIndex = 2;
                controller.update();
              },
              child: const Icon(EvaIcons.plus),
              //params
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: AnimatedBottomNavigationBar(
                icons: iconList,
                activeIndex: controller.selectedIndex,
                gapLocation: GapLocation.center,
                notchSmoothness: NotchSmoothness.verySmoothEdge,
                activeColor: MyColors.lightGreen,
                blurEffect: true,
                // leftCornerRadius: 32,
                // rightCornerRadius: 32,
                onTap: ((val) {
                  controller.selectedIndex = val;
                  controller.update();
                })
                //other params
                ),
          );
          // return Scaffold(
          //   bottomNavigationBar: FloatingNavbar(
          //       backgroundColor: MyColors.lightGreen,
          //       unselectedItemColor: Colors.grey[300],
          //       items: [
          //         FloatingNavbarItem(icon: EvaIcons.home),
          //         FloatingNavbarItem(icon: EvaIcons.fileAdd),
          //         FloatingNavbarItem(icon: EvaIcons.person),
          //       ],
          //       currentIndex: controller.selectedIndex,
          //       onTap: ((val) {
          //         controller.selectedIndex = val;
          //         controller.update();
          //       })),
          //   body: Center(
          //       child: controller.widgetOptions
          //           .elementAt(controller.selectedIndex)),
          // );
        });
  }
}
