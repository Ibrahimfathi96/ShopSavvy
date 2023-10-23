import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/core/localization/change_locale.dart';
import 'package:shop_savvy/core/localization/translations.dart';
import 'package:shop_savvy/core/services/services.dart';
import 'package:shop_savvy/initial_binding.dart';
import 'package:shop_savvy/routes.dart';

void main() async {
  await initServices();
  runApp(const ShopSavvy());
}

class ShopSavvy extends StatelessWidget {
  const ShopSavvy({super.key});

  @override
  Widget build(BuildContext context) {
    LocaleController localeController = Get.put(LocaleController());
    return GestureDetector(
      onTap: ()=>FocusManager.instance.primaryFocus?.unfocus(),
      child: GetMaterialApp(
        translations: MyTranslations(),
        debugShowCheckedModeBanner: false,
        locale: localeController.startingLanguage,
        title: 'ShopSavvy',
        theme: localeController.appTheme,
        getPages: routes,
        initialBinding: InitialBindings(),
      ),
    );
  }
}
