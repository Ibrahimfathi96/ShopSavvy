import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/view/screen/notifications/notifications.dart';
import 'package:shop_savvy/view/screen/cart/cart_view.dart';
import 'package:shop_savvy/view/screen/home/home_body.dart';
import 'package:shop_savvy/view/screen/offers_view.dart';
import 'package:shop_savvy/view/screen/settings/settings.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int index);

  goToCart();
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentPage = 0;
  List<Widget> pagesList = [
    const HomeBody(),
    const NotificationsView(),
    const CartView(),
    const OffersView(),
    const SettingsView(),
  ];
  List bottomAppBar = [
    {"title": "Home", "icon": Icons.home_outlined},
    {"title": "Alerts", "icon": Icons.notifications_active_outlined},
    {"title": "Cart", "icon": Icons.shopping_cart_outlined},
    {"title": "Offers", "icon": Icons.local_offer_outlined},
    {"title": "Profile", "icon": Icons.person},
  ];

  @override
  changePage(int index) {
    currentPage = index;
    update();
  }

  @override
  goToCart() {
    Get.toNamed(CartView.routeName);
  }
}
