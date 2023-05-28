import 'package:shop_savvy/controller/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingSkipButton extends GetView<OnBoardingControllerImp> {
  const OnBoardingSkipButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.skipOnBoarding();
      },
      child: Text(
        "5".tr,
        style: const TextStyle(
          fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black
        ),
      ),
    );
  }
}
