import 'package:get/get.dart';
import 'package:shop_savvy/controller/auth/reset_password_controller.dart';
import 'package:shop_savvy/controller/auth/sign_in_controller.dart';
import 'package:shop_savvy/controller/auth/sign_up_controller.dart';

class MyBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>SignUpControllerImp(),fenix: true);
    Get.lazyPut(()=>SignInControllerImp(),fenix: true);
    Get.lazyPut(()=>ResetPasswordControllerImp(),fenix: true);
  }

}