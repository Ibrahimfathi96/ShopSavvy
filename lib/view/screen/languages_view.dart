import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/core/functions/exit_app_alert.dart';
import 'package:shop_savvy/core/localization/change_locale.dart';
import 'package:shop_savvy/view/screen/onboarding_view.dart';
import 'package:shop_savvy/view/widget/language_widgets/custom_lang_button.dart';

class Language extends GetView<LocaleController> {
  static const String routeName = '/';
  const Language({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: WillPopScope(
        onWillPop: exitAppAlert,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 4,
              color: Colors.green,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "1".tr,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 9,
                vertical: MediaQuery.of(context).size.height / 9,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomLangButton(
                    text: 'العربية',
                    name: "assets/flags/sa.png",
                    onTap: () {
                      controller.changeLanguage("ar");
                      Get.offNamed(OnBoarding.routeName);
                    },
                  ),
                  CustomLangButton(
                    text: 'English',
                    name: "assets/flags/en.png",
                    onTap: () {
                      controller.changeLanguage("en");
                      Get.offNamed(OnBoarding.routeName);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
