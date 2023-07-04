import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/controller/settings_controller.dart';
import 'package:shop_savvy/core/constants/color.dart';
import 'package:shop_savvy/generated/assets.dart';

class SettingsTopRow extends GetView<SettingsController> {
  const SettingsTopRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: CircleAvatar(
            radius: 50,
            backgroundColor: AppColors.primaryColor,
            backgroundImage: AssetImage(Assets.imagesAvatar),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              controller.userName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.primaryDark,
                fontSize: 20,
              ),
            ),
            Text(
              controller.email,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: AppColors.grey,
                fontSize: 16,
              ),
            ),
          ],
        )
      ],
    );
  }
}
