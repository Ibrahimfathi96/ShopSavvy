import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/view/screen/auth/forget_password/verify_code.dart';



abstract class ForgetPasswordController extends GetxController {
  checkEmail();

  goBackToSignIn();

  goToVerifyCode();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
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
  goBackToSignIn() {
    Get.back();
  }

  @override
  goToVerifyCode() {
    Get.offAllNamed(VerifyCode.routeName);
  }

  @override
  checkEmail() {}

}
