import 'package:get/get.dart';
import 'package:shop_savvy/view/screen/auth/forget_password/reset_password.dart';

abstract class VerifyCodeController extends GetxController{
  checkCode();
  goToResetPassword();
}

class VerifyCodeControllerImp extends VerifyCodeController{
  late String verifyCode;
  @override
  checkCode() {

  }

  @override
  goToResetPassword() {
    Get.offAllNamed(ResetPassword.routeName);
  }

}