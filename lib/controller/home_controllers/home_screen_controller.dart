import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/view/screen/cart/cart_view.dart';
import 'package:shop_savvy/view/screen/home/home_body.dart';
import 'package:shop_savvy/view/screen/settings/settings.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int index);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentPage = 0;
  List<Widget> pagesList = [
    const HomeBody(),
    const CartView(),
    Container(
      color: Colors.red,
      child: const Text("Profile"),
    ),
    const SettingsView(),
  ];
  List bottomAppBar = [
    {"title": "Home", "icon": Icons.home},
    {"title": "Cart", "icon": Icons.shopping_cart_outlined},
    {"title": "Profile", "icon": Icons.person_pin_outlined},
    {"title": "Settings", "icon": Icons.settings_outlined},
  ];

  @override
  changePage(int index) {
    currentPage = index;
    update();
  }
}
