import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/core/services/services.dart';

class LocaleController extends GetxController {
  Locale? startingLanguage;

  MyServices myServices = Get.find();

  changeLanguage(String langCode) {
    Locale locale = Locale(langCode);
    myServices.prefs.setString("lang", langCode);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String? langPrefs = myServices.prefs.getString("lang");
    if (langPrefs == "ar") {
      startingLanguage = const Locale("ar");
    } else if (langPrefs == "en") {
      startingLanguage = const Locale("en");
    } else {
      startingLanguage = Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }
}
