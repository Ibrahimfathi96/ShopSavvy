
import 'package:ecommerce_application/controller/onboarding_controller.dart';
import 'package:ecommerce_application/core/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingCustomButton extends GetView<OnBoardingControllerImp> {
  const OnBoardingCustomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      height: 50,
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        onPressed: () {
          controller.nextPage();
        },
        color: AppColors.primaryColor,
        textColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 100),
        child: const Text(
          "Continue",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}