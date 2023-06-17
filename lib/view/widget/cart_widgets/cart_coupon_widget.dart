import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/core/constants/color.dart';

class CartCoupon extends StatelessWidget {
  const CartCoupon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Get.width / 14),
      padding:
          EdgeInsets.symmetric(horizontal: Get.width / 28, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.grey,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            "Have a coupon code? enter here",
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 14,
              color: AppColors.grey,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "FD232D",
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.primaryDark,
                ),
              ),
              Row(
                children: [
                  Text(
                    "Available",
                    style: TextStyle(
                      color: const Color(0xFF3AC6A5).withOpacity(0.9),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Icon(
                    Icons.check_circle,size: 26,
                    color: const Color(0xFF3AC6A5).withOpacity(0.9),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
