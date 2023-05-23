import 'package:ecommerce_application/controller/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingSkipButton extends GetView<OnBoardingControllerImp> {
  const OnBoardingSkipButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        controller.skipOnBoarding();
      },
      color: Colors.transparent,
      elevation: 0,
      textColor: Colors.black,
      child: const Text(
        "Skip",
        style: TextStyle(
          fontSize: 18,
        ),
      ),
    );
  }
}
