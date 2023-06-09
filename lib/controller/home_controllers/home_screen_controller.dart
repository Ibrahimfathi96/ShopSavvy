import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:shop_savvy/core/constants/color.dart';
import 'package:shop_savvy/view/screen/home_view/home_body.dart';
abstract class HomeScreenController extends GetxController {}

class HomeScreenControllerImp extends HomeScreenController {
  PersistentTabController persistentTabController = PersistentTabController();

  List<Widget> buildScreens() {
    return [
      const HomeBody(),
      Container(
        color: Colors.red,
      ),
      Container(
        color: Colors.blueAccent,
      ),
      Container(
        color: Colors.greenAccent,
      ),
      Container(
        color: Colors.deepOrange,
      ),
    ];
  }

  List<PersistentBottomNavBarItem> navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(
          Icons.home_outlined,
          size: 30,
        ),
        title: "Home",
        textStyle: const TextStyle(fontSize: 18),
        activeColorPrimary: AppColors.primaryColor,
        inactiveColorPrimary: Colors.grey[700],
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          Icons.favorite_border,
          size: 30,
        ),
        title: "Favorite",
        textStyle: const TextStyle(fontSize: 18),
        activeColorPrimary: AppColors.primaryColor,
        inactiveColorPrimary: Colors.grey[700],
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          Icons.shopping_bag_outlined,
          size: 30,
        ),
        title: "Cart",
        textStyle: const TextStyle(fontSize: 18),
        activeColorPrimary: AppColors.primaryColor,
        inactiveColorPrimary: Colors.grey[700],
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          Icons.person_pin_outlined,
          size: 30,
        ),
        title: "Profile",
        textStyle: const TextStyle(fontSize: 18),
        activeColorPrimary: AppColors.primaryColor,
        inactiveColorPrimary: Colors.grey[700],
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          Icons.settings_outlined,
          size: 30,
        ),
        title: "Settings",
        textStyle: const TextStyle(fontSize: 18),
        activeColorPrimary: AppColors.primaryColor,
        inactiveColorPrimary: Colors.grey[700],
      ),
    ];
  }
}
