import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/view/screen/auth/sign_up.dart';

abstract class SignInController extends GetxController {
  singIn();
  goToSignUP();
}

class SignInControllerImp extends SignInController {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  goToSignUP() {
    Get.toNamed(SignUp.routeName);
  }

  @override
  singIn() {}
}
