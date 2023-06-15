import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/controller/home_controllers/home_screen_controller.dart';
import 'package:shop_savvy/core/constants/color.dart';
import 'package:shop_savvy/view/widget/home_widgets/home_bottom_nav_bar.dart';

class CustomHomeBottomAppBar extends StatelessWidget {
  const CustomHomeBottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: BottomAppBar(
            color: AppColors.primaryDark,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ...List.generate(
                  controller.pagesList.length,
                  (index) {
                    return CustomHomeBottomNavBar(
                            onPressed: () {
                              controller.changePage(index);
                            },
                            isActive:
                                controller.currentPage == index ? true : false,
                            buttonText: controller.bottomAppBar[index]['title'],
                            icon: controller.bottomAppBar[index]['icon'],
                          );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
