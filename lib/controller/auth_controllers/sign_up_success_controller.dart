import 'package:get/get.dart';
import 'package:shop_savvy/core/class/status_request.dart';
import 'package:shop_savvy/view/screen/auth_view/sign_in.dart';

abstract class SignUpSuccessController extends GetxController{
  goToSignIn();
}

class SignUpSuccessControllerImp extends SignUpSuccessController{
  StatusRequest statusRequest = StatusRequest.none;
  @override
  goToSignIn() {
    statusRequest = StatusRequest.loading;
    Get.offAllNamed(SignIn.routeName);
  }

}