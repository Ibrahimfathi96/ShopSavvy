

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/view/screen/auth/sign_up/verify_code_sign_up.dart';

abstract class CheckEmailController extends GetxController {
  checkEmail();
  goToVerifyCode();
}

class CheckEmailControllerImp extends CheckEmailController {
  late TextEditingController emailController;


  @override
  void onInit() {
    emailController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  goToVerifyCode() {
    Get.offNamed(SignUpVerifyCode.routeName);
  }

  @override
  checkEmail() {}

}
