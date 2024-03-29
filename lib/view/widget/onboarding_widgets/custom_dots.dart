import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/controller/onboarding_controller.dart';
import 'package:shop_savvy/data/data_source/static/static.dart';

class OnBoardingCustomDotsController extends StatelessWidget {
  const OnBoardingCustomDotsController({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(builder: (controller) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(
            onBoardingList.length,
            (index) => AnimatedContainer(
              margin: const EdgeInsets.all(5),
              width: controller.currentPage == index ? 20 : 6,
              height: 6,
              decoration: BoxDecoration(
                color: controller.currentPage == index
                    ? Colors.deepOrangeAccent
                    : Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
              duration: const Duration(
                milliseconds: 200,
              ),
            ),
          ),
        ],
      );
    });
  }
}
