import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/core/services/services.dart';
import 'package:shop_savvy/view/screen/auth/sign_in.dart';

class SettingsController extends GetxController {
  MyServices services = Get.find();
  bool isActive = false;
  late String userName;
  late String email;

  switchToggle() {
    isActive = isActive == false? true:false;
    update();
  }

  userLogout() {
    String userId = services.prefs.getString("id")!;
    FirebaseMessaging.instance.unsubscribeFromTopic("users");
    FirebaseMessaging.instance.unsubscribeFromTopic("user${userId}");
    services.prefs.clear();
    Get.offAllNamed(SignIn.routeName);
  }

  @override
  void onInit() {
    userName = services.prefs.getString("userName")!;
    email    = services.prefs.getString("email")!;
    super.onInit();
  }

}