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
        margin: const EdgeInsets.symmetric(horizontal: 6),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: BottomAppBar(
            color: AppColors.primaryDark,
            child: Row(
              children: [
                ...List.generate(
                  controller.pagesList.length + 1,
                  (index) {
                    int i = index > 2 ? index - 1 : index;
                    return index == 2
                        ? const Spacer()
                        : CustomHomeBottomNavBar(
                            onPressed: () {
                              controller.changePage(i);
                            },
                            isActive:
                                controller.currentPage == i ? true : false,
                            buttonText: controller.bottomAppBar[i]['title'],
                            icon: controller.bottomAppBar[i]['icon'],
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
