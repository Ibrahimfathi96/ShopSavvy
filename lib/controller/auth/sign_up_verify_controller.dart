import 'package:get/get.dart';
import 'package:shop_savvy/view/screen/auth/sign_up/sign_up_successfully.dart';

abstract class SignUpVerifyCodeController extends GetxController{
  checkCode();
  goToSignUpSuccess();
}

class SignUpVerifyCodeControllerImp extends SignUpVerifyCodeController{
  late String verifyCode;
  @override
  checkCode() {

  }

  @override
  goToSignUpSuccess() {
    Get.offAllNamed(SignUpSuccessfully.routeName);
  }

}