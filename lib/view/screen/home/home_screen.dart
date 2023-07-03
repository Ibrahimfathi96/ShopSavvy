import 'dart:io';

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
        bottomNavigationBar: const CustomHomeBottomAppBar(),
        body: SafeArea(
          child: WillPopScope(
            onWillPop: () {
              Get.defaultDialog(
                title: "Alert!",
                titleStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: AppColors.secondaryColor,
                ),
                middleText: "Do you want to exit the application?",
                middleTextStyle: TextStyle(
                  fontSize: 16,
                  color: AppColors.primaryDark,
                ),
                onConfirm: () => exit(0),
                buttonColor: AppColors.secondaryColor,
                confirmTextColor: Colors.white,
                cancelTextColor: AppColors.primaryDark,
                onCancel: () {},
              );
              return Future.value(false);
            },
            child: controller.pagesList[controller.currentPage],
          ),
        ),
      ),
    );
  }
}
