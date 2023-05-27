import 'package:get/get.dart';
import 'package:shop_savvy/controller/auth/sign_up_controller.dart';

class MyBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>SignUpControllerImp(),fenix: true);
  }

}