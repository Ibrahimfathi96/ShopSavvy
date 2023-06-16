import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/core/constants/color.dart';

class CustomCartDivider extends StatelessWidget {
  const CustomCartDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 2,width:Get.width * 0.85,
      color: AppColors.grey,
    );
  }
}
