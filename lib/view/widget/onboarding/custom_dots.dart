
import 'package:ecommerce_application/controller/onboarding_controller.dart';
import 'package:ecommerce_application/core/constants/color.dart';
import 'package:ecommerce_application/data/data_source/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingCustomDotsController extends StatelessWidget {
  const OnBoardingCustomDotsController({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
      builder: (controller) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
              onBoardingList.length,
                  (index) => AnimatedContainer(
                margin: const EdgeInsets.all(5),
                width: controller.currentPage == index? 20:5,
                height: 6,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                duration: const Duration(
                  milliseconds: 900,
                ),
              ),
            ),
          ],
        );
      }
    );
  }
}