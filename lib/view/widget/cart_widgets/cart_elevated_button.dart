import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/controller/cart_controller.dart';
import 'package:shop_savvy/core/constants/color.dart';

class CartCustomButton extends GetView<CartController> {
  const CartCustomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        elevation: 10,
        minimumSize: Size(Get.width * 0.8, Get.height / 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: () {
       controller.goToCheckOutView();
      },
      child: const Text(
        "Continue to Checkout",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
