import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/controller/product_details_controller.dart';
import 'package:shop_savvy/core/constants/color.dart';
import 'package:shop_savvy/view/widget/product_details_widgets/custom_color_container.dart';

class ProductColors extends GetView<ProductDetailsControllerImp> {
  const ProductColors({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Colors Available:",
          textAlign: TextAlign.start,
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(color: AppColors.primaryDark),
        ),
        const SizedBox(
          height: 6,
        ),
        Row(
          children: [
            ...List.generate(
              controller.subItems.length,
              (index) => CustomColorContainer(
                onTap: () {},
                containerColor: (controller.subItems[index]['active']) == "1"
                    ? controller.subItems[index]['color']
                    : Colors.white,
                borderColor: (controller.subItems[index]['active']) == "1"
                    ? controller.subItems[index]['color']
                    : AppColors.primaryDark,
                text: controller.subItems[index]['name'],
                textColor: (controller.subItems[index]['active']) == "1"
                    ? Colors.white
                    : AppColors.primaryDark,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
