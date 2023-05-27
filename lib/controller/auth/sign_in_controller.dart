import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/view/screen/auth/forget_password/forget_password.dart';
import 'package:shop_savvy/view/screen/auth/sign_up/sign_up.dart';

abstract class SignInController extends GetxController {
  singIn();
  goToSignUP();
  goToForgetPassword();
}

class SignInControllerImp extends SignInController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
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
    Get.offNamed(SignUp.routeName);
  }

  @override
  singIn() {
    var formData = formKey.currentState;
    if(formData!.validate()){
      debugPrint("Valid");
    }else{
      debugPrint("Not Valid");
    }
  }

  @override
  goToForgetPassword() {
    Get.toNamed(ForgetPassword.routeName);
  }
}
