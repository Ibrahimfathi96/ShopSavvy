import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/controller/cart_controller.dart';
import 'package:shop_savvy/core/constants/color.dart';

class CartCoupon extends StatelessWidget {
  const CartCoupon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      builder: (controller) => controller.couponName == null
          ? Container(
              margin: EdgeInsets.symmetric(horizontal: Get.width / 22),
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
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 2,
                          child: TextField(
                            controller: controller.couponController,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(8),
                                isDense: true,
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: AppColors.grey),
                                    borderRadius: BorderRadius.circular(6)),
                                hintText: "Coupon Code"),
                          ),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Expanded(
                          flex: 1,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryColor,
                            ),
                            onPressed: () {
                              controller.checkCoupon();
                              controller.couponController.clear();
                            },
                            child: Text(
                              "Apply",
                              style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "#${controller.couponName!}",
                    style: TextStyle(
                      fontSize: 16,
                      color: const Color(0xFF3AC6A5).withOpacity(0.9),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Available",
                        style: TextStyle(
                          fontSize: 16,
                          color: const Color(0xFF3AC6A5).withOpacity(0.9),
                        ),
                      ),
                      Icon(
                        Icons.check_circle,
                        size: 24,
                        color: const Color(0xFF3AC6A5).withOpacity(0.9),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                ],
              ),
            ),
    );
  }
}
