import 'package:get/get.dart';
import 'package:shop_savvy/view/screen/auth/sign_in.dart';

abstract class SignUpSuccessController extends GetxController{
  goToSignIn();
}

class SignUpSuccessControllerImp extends SignUpSuccessController{
  @override
  goToSignIn() {
    Get.offAllNamed(SignIn.routeName);
  }

}