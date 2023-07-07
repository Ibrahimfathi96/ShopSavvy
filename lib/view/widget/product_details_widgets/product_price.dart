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
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14,horizontal: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "$price EGP",
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: AppColors.purple, fontSize: 20, height: 1.5),
          ),
          Row(
            children: [
              InkWell(
                onTap: onRemoveTap,
                child: const Icon(
                  Icons.remove_circle_outline,
                  color: AppColors.primaryDark,size: 30,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 6),
                child: Text(
                  count,
                  style: const TextStyle(fontSize: 24, color: AppColors.primaryDark),
                ),
              ),
              InkWell(
                onTap: onAddTap,
                child: const Icon(
                  Icons.add_circle_outline,
                  color: AppColors.primaryDark,size: 30,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
