import 'package:get/get.dart';
import 'package:shop_savvy/core/services/services.dart';
import 'package:shop_savvy/view/screen/auth_view/sign_in.dart';

class SettingsController extends GetxController {
  MyServices services = Get.find();

  userLogout() {
    services.prefs.clear();
    Get.offAllNamed(SignIn.routeName);
  }


}