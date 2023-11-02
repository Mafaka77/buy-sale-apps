import 'package:buy_sale_apps/screens/AddPostScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/HomeScreen.dart';
import '../screens/ProfileScreen.dart';

class NavbarController extends GetxController {
  int selectedIndex = 0;
  final List<Widget> widgetOptions = <Widget>[
    HomeScreen(),
    // AddPostScreen(),
    // SubmitComplaintScreen(),
    const ProfileScreen(),
    AddPostScreen(),
  ];
}
