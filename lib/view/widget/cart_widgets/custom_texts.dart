import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/core/constants/color.dart';

class CustomCartTexts extends StatelessWidget {
  final String text1;
  final String text2;
  const CustomCartTexts({super.key, required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.width / 9,vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text1,
            style: const TextStyle(
              fontSize: 17,
              color: AppColors.primaryDark,
            ),
          ),
          Text(
            text2,
            style: const TextStyle(
              fontSize: 17,
              color: AppColors.primaryDark,
            ),
          ),
        ],
      ),
    );
  }
}
