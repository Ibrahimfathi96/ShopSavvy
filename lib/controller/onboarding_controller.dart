import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/data/data_source/static/static.dart';
import 'package:shop_savvy/view/screen/auth/login.dart';

abstract class OnBoardingController extends GetxController {
  nextPage();

  onPageChanged(int index);

  skipOnBoarding();
}

class OnBoardingControllerImp extends OnBoardingController {
  late PageController pageController;
  int currentPage = 0;

  @override
  nextPage() {
    currentPage++;
    if (currentPage > onBoardingList.length - 1) {
      Get.offAllNamed(LoginScreen.routeName);
    } else {
      pageController.animateToPage(currentPage,
          duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
    }
  }
  @override
  skipOnBoarding(){
    Get.offAllNamed(LoginScreen.routeName);
  }

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }
}
