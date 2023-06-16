import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/core/constants/color.dart';

class CartCoupon extends StatelessWidget {
  const CartCoupon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 6),
          alignment: Alignment.centerLeft,
          child: const Text(
            "Have a coupon code? enter here",
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 14,
              color: AppColors.grey,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: Get.width / 14),
          padding:
              EdgeInsets.symmetric(horizontal: Get.width / 28, vertical: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: AppColors.grey,
            ),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
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
                      color: Color(0xFF3AC6A5),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  CircleAvatar(
                    radius: 14,
                    backgroundColor: Color(0xFF3AC6A5),
                    child: Icon(
                      Icons.done,
                      color: Colors.white,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
