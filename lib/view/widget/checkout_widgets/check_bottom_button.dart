import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/controller/checkout_controller.dart';
import 'package:shop_savvy/core/constants/color.dart';

class CheckoutBottomButton extends GetView<CheckOutController> {
  const CheckoutBottomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32),
      child: MaterialButton(
        padding: EdgeInsets.symmetric(vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        color: AppColors.primaryDark,
        textColor: Colors.white,
        onPressed: () {
          controller.checkout();
        },
        child: Text(
          "Checkout",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
