import 'package:ecommerce_application/controller/onboarding_controller.dart';
import 'package:ecommerce_application/view/widget/onboarding/custom_button.dart';
import 'package:ecommerce_application/view/widget/onboarding/custom_dots.dart';
import 'package:ecommerce_application/view/widget/onboarding/custom_skip_button.dart';
import 'package:ecommerce_application/view/widget/onboarding/custom_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const Expanded(
              flex: 3,
              child: OnBoardingCustomSlider(),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children:  const [
                  OnBoardingCustomDotsController(),
                  Spacer(
                    flex: 2,
                  ),
                  OnBoardingCustomButton(),
                  OnBoardingSkipButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

