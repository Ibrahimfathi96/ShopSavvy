import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/view/screen/auth/forget_password/reset_password_success.dart';

abstract class ResetPasswordController extends GetxController{
  resetPassword();
  goToResetPasswordSuccessfully();
}

class ResetPasswordControllerImp extends ResetPasswordController{
  late TextEditingController newPassword;
  late TextEditingController confirmPassword;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void onInit() {
    newPassword = TextEditingController();
    confirmPassword = TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    newPassword.dispose();
    confirmPassword.dispose();
    super.dispose();
  }
  @override
  resetPassword() {
  }

  @override
  goToResetPasswordSuccessfully() {
    var formData = formKey.currentState;
    if(formData!.validate()){
      Get.offNamed(ResetPasswordSuccessfully.routeName);
      debugPrint("Valid");
    }else{
      debugPrint("Not Valid");
    }
  }
  
}