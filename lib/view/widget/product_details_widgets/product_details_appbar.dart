import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marquee/marquee.dart';
import 'package:shop_savvy/controller/product_details_controller.dart';
import 'package:shop_savvy/core/constants/color.dart';

class ProductDetailsAppBar extends GetView<ProductDetailsControllerImp> {
  const ProductDetailsAppBar({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 60,
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              controller.goBack();
            },
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.darkColor,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Marquee(
              text: "${controller.itemsMd.itemsName}               ",
              style:
              const TextStyle(color: AppColors.darkColor, fontSize: 18),
            ),
          )
        ],
      ),
    );
  }
}
