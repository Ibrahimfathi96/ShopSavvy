import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/controller/product_details_controller.dart';
import 'package:shop_savvy/core/constants/color.dart';

class ProductDescription extends GetView<ProductDetailsControllerImp> {
  const ProductDescription({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Product Description:",
          textAlign: TextAlign.start,
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(color: AppColors.primaryDark),
        ),
        const SizedBox(height: 6,),
        Text(
          "${controller.itemsMd.itemsDesc}",
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: AppColors.grey, height: 1.5),
        ),
      ],
    );
  }
}
