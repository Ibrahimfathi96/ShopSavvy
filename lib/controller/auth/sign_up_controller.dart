import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/view/screen/auth/sign_in.dart';
import 'package:shop_savvy/view/screen/auth/sign_up/verify_code_sign_up.dart';

abstract class SignUpController extends GetxController {
  singUp();

  goToSignIn();

  showPassword();

}

class SignUpControllerImp extends SignUpController {
  late TextEditingController fullNameController;
  late TextEditingController phoneController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isVisible = true;

 @override
  showPassword() {
    isVisible = isVisible == true ? false : true;
    update();
  }

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
  singUp() async{
    var formData = formKey.currentState;
    if (formData!.validate()) {
      Get.offAllNamed(SignUpVerifyCode.routeName);
      debugPrint("Valid");
    } else {
      debugPrint("Not Valid");
    }
  }
}
