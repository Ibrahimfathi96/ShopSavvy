import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/view/screen/auth/sign_in.dart';
import 'package:shop_savvy/view/screen/auth/sign_up/check_email.dart';

abstract class SignUpController extends GetxController {
  singUp();
  goToSignIn();
}

class SignUpControllerImp extends SignUpController {
  late TextEditingController fullNameController;
  late TextEditingController phoneController;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void onInit() {
    fullNameController = TextEditingController();
    phoneController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    fullNameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  goToSignIn() {
    Get.offNamed(SignIn.routeName);
  }

  @override
  singUp() {
    Get.offAllNamed(CheckEmail.routeName);
  }
}
