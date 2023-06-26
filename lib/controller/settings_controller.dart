import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/core/services/services.dart';
import 'package:shop_savvy/view/screen/auth/sign_in.dart';

class SettingsController extends GetxController {
  MyServices services = Get.find();

  userLogout() {
    String userId = services.prefs.getString("id")!;
    FirebaseMessaging.instance.unsubscribeFromTopic("users");
    FirebaseMessaging.instance.unsubscribeFromTopic("user${userId}");
    services.prefs.clear();
    Get.offAllNamed(SignIn.routeName);
  }


}