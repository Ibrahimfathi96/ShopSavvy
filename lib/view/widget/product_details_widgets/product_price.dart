import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/controller/product_details_controller.dart';
import 'package:shop_savvy/core/constants/color.dart';

class ProductPrice extends GetView<ProductDetailsControllerImp> {
  final void Function() onAddTap;
  final void Function() onRemoveTap;
  final String count;
  final String price;

  const ProductPrice( {
    required this.count,
    required this.price,
    required this.onAddTap,
    required this.onRemoveTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Price:",
          textAlign: TextAlign.start,
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(color: AppColors.primaryDark, height: 1.5),
        ),
        Row(
          children: [
            InkWell(
              onTap: onRemoveTap,
              child: Container(
                margin: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.primaryDark,
                ),
                child: const Icon(
                  Icons.remove,
                  color: Colors.white,
                ),
              ),
            ),
            Text(
              count,
              style: const TextStyle(fontSize: 22, color: AppColors.primaryDark),
            ),
            InkWell(
              onTap: onAddTap,
              child: Container(
                margin: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.primaryDark,
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        Text(
          "$price EGP",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: AppColors.primaryDark, fontSize: 20, height: 1.5),
        ),
      ],
    );
  }
}
