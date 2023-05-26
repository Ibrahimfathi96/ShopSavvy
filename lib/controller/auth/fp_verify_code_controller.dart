import 'package:get/get.dart';
import 'package:shop_savvy/view/screen/auth/forget_password/reset_password.dart';

abstract class ForgetPasswordVerifyCodeController extends GetxController{
  checkCode();
  goToResetPassword();
}

class ForgetPasswordVerifyCodeControllerImp extends ForgetPasswordVerifyCodeController{
  late String verifyCode;
  @override
  checkCode() {

  }

  @override
  goToResetPassword() {
    Get.offAllNamed(ResetPassword.routeName);
  }

}