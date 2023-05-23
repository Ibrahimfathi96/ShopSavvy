import 'package:ecommerce_application/controller/onboarding_controller.dart';
import 'package:ecommerce_application/core/constants/color.dart';
import 'package:ecommerce_application/data/data_source/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingCustomSlider extends GetView<OnBoardingControllerImp> {
  const OnBoardingCustomSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (value) {
        controller.onPageChanged(value);
      },
      physics: const BouncingScrollPhysics(),
      itemCount: onBoardingList.length,
      itemBuilder: (context, index) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            onBoardingList[index].title!,
            style: Theme.of(context).textTheme.displayLarge,
          ),
          Image.asset(
            onBoardingList[index].image!,
            width: 200,
            height: 230,
            fit: BoxFit.fill,
          ),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              onBoardingList[index].body!,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }
}
