import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/core/constants/color.dart';
import 'package:shop_savvy/core/localization/change_locale.dart';
import 'package:shop_savvy/core/localization/translations.dart';
import 'package:shop_savvy/core/services/services.dart';
import 'package:shop_savvy/routes.dart';
import 'package:shop_savvy/view/screen/onboarding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(const ShopSavvy());
}

class ShopSavvy extends StatelessWidget {
  const ShopSavvy({super.key});

  @override
  Widget build(BuildContext context) {
    LocaleController localeController = Get.put(LocaleController());
    return GetMaterialApp(
      translations: MyTranslations(),
      debugShowCheckedModeBanner: false,
      locale: localeController.startingLanguage,
      title: 'ShopSavvy',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: "RobotoMono",
        textTheme: const TextTheme(
          displayMedium: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
          displayLarge: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 26,
          ),
          bodyLarge: TextStyle(
            height: 2,
            fontSize: 18,
            color: AppColors.grey,
            fontWeight: FontWeight.w600,
          ),
          bodyMedium: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.deepOrangeAccent,
            fontSize: 16,
          ),
          bodySmall: TextStyle(
            height: 1.5,
            fontSize: 12,
            color: AppColors.grey,
            fontWeight: FontWeight.w300,
          ),
        ),
        primarySwatch: Colors.blue,
      ),
      // home: const Test(),
      home: const OnBoarding(),
      routes: routes,
    );
  }
}
