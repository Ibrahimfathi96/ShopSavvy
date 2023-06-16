import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/controller/cart_controller.dart';
import 'package:shop_savvy/core/constants/color.dart';

class CartUpperText extends GetView<CartController> {
  const CartUpperText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 6),
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 40),
      decoration: BoxDecoration(
        color: AppColors.purple,
        border: Border.all(color: AppColors.primaryDark),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        "${controller.countTotalItems} items added to your cart.",
        style: const TextStyle(color: Colors.white,fontSize: 16),
      ),
    );
  }
}
