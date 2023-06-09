import 'package:get/get.dart';
import 'package:shop_savvy/view/screen/auth_view/sign_in.dart';

abstract class ForgetPasswordSuccessController extends GetxController{
  goToSignIn();
}

class ForgetPasswordSuccessControllerImp extends ForgetPasswordSuccessController{
  @override
  goToSignIn() {
    Get.offAllNamed(SignIn.routeName);
  }

}