import 'package:shop_savvy/controller/onboarding_controller.dart';
import 'package:shop_savvy/view/widget/onboarding/custom_button.dart';
import 'package:shop_savvy/view/widget/onboarding/custom_dots.dart';
import 'package:shop_savvy/view/widget/onboarding/custom_skip_button.dart';
import 'package:shop_savvy/view/widget/onboarding/custom_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoarding extends StatelessWidget {
  static const String routeName = "/onBoarding";
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: OnBoardingCustomSlider(),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children:  [
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

