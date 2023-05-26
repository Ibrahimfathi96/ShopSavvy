import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/core/constants/theme.dart';
import 'package:shop_savvy/core/services/services.dart';

class LocaleController extends GetxController {
  Locale? startingLanguage;

  MyServices myServices = Get.find();

  ThemeData appTheme = englishTheme;

  changeLanguage(String langCode) {
    Locale locale = Locale(langCode);
    myServices.prefs.setString("lang", langCode);
    appTheme = langCode == 'ar'? arabicTheme : englishTheme;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String? langPrefs = myServices.prefs.getString("lang");
    if (langPrefs == "ar") {
      startingLanguage = const Locale("ar");
      appTheme = arabicTheme;
    } else if (langPrefs == "en") {
      startingLanguage = const Locale("en");
      appTheme = englishTheme;
    } else {
      startingLanguage = Locale(Get.deviceLocale!.languageCode);
      appTheme = englishTheme;
    }
    super.onInit();
  }
}
