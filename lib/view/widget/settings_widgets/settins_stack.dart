import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/core/constants/color.dart';
import 'package:shop_savvy/core/functions/changeLanguage.dart';
import 'package:shop_savvy/generated/assets.dart';

class SettingsStack extends StatelessWidget {
  const SettingsStack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        Container(
          height: Get.height / 4.5,
          width: Get.width,
          decoration: const BoxDecoration(color: AppColors.primaryColor),
        ),
        Positioned(
          top: Get.height / 6.3,
          child: const CircleAvatar(
            radius: 50,
            backgroundColor: AppColors.primaryColor,
            child: CircleAvatar(
              radius: 40,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage(Assets.imagesAvatar),
            ),
          ),
        ),
        Positioned(
          top:5,
          right: Get.width / 26,
          child: IconButton(
            onPressed: () {
              changeLanguage(context);
            },
            icon: Icon(
              Icons.language_outlined,
              size: 36,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
