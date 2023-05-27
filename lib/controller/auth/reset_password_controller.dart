import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/view/screen/auth/forget_password/reset_password_success.dart';

abstract class ResetPasswordController extends GetxController{
  resetPassword();
  goToResetPasswordSuccessfully();
  showPassword1();
  showPassword2();
}

class ResetPasswordControllerImp extends ResetPasswordController{
  late TextEditingController newPassword;
  late TextEditingController confirmPassword;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isVisible1 = true;
  bool isVisible2 = true;

  @override
  showPassword1(){
    isVisible1 = isVisible1 == true? false:true;
    update();
  }
  @override
  showPassword2(){
    isVisible2 = isVisible2 == true? false:true;
    update();
  }
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