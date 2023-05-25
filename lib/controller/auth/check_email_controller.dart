

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/view/screen/auth/sign_up/sign_up_successfully.dart';

abstract class CheckEmailController extends GetxController {
  checkEmail();
  goToSignUpSuccessfully();
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
  goToSignUpSuccessfully() {
    Get.offNamed(SignUpSuccessfully.routeName);
  }

  @override
  checkEmail() {}

}
