import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/controller/home_controllers/home_screen_controller.dart';
import 'package:shop_savvy/core/constants/color.dart';
import 'package:shop_savvy/view/widget/home_widgets/home_bottom_appbar.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) => Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: CircleAvatar(
          radius: 35,
          backgroundColor: Colors.white,
          child: FloatingActionButton(
            backgroundColor: AppColors.primaryColor,
            onPressed: () {
              controller.goToCart();
            },
            child: const Icon(
              Icons.shopping_cart_outlined,
              size: 32,
            ),
          ),
        ),
        bottomNavigationBar: const CustomHomeBottomAppBar(),
        body: SafeArea(
            child: controller.pagesList.elementAt(controller.currentPage)),
      ),
    );
  }
}
