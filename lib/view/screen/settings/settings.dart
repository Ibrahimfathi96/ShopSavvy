import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/controller/settings_controller.dart';
import 'package:shop_savvy/core/constants/color.dart';
import 'package:shop_savvy/core/functions/changeLanguage.dart';
import 'package:shop_savvy/generated/assets.dart';
import 'package:shop_savvy/view/widget/settings_list_tile_item.dart';

class SettingsView extends StatelessWidget {
  static const String routeName = '/settings';

  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsController controller = Get.put(SettingsController());
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Container(
              height: Get.height / 4,
              width: Get.width,
              decoration: const BoxDecoration(color: AppColors.primaryColor),
            ),
            Positioned(
              top: Get.height / 5.3,
              child: const CircleAvatar(
                radius: 50,
                backgroundColor: AppColors.primaryColor,
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage(Assets.imagesAvatar),
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: ListView(
            children: [
              Card(
                margin: const EdgeInsets.symmetric(horizontal: 10).add(
                  EdgeInsets.only(
                    top: Get.height / 16,
                  ),
                ),
                elevation: 20,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SettingListTileItem(
                      titleText: "Disable Notifications",
                      iconData: Switch(
                        onChanged: (value) {},
                        value: true,
                      ),
                    ),
                    const SettingListTileItem(
                      titleText: "Address",
                      iconData: Icon(
                        Icons.location_on_outlined,
                        size: 30,
                        color: Colors.black
                      ),
                    ),
                    SettingListTileItem(
                      onTap: () {
                        changeLanguage(context);
                      },
                      titleText: "Change Language",
                      iconData: const Icon(
                        Icons.language_outlined,
                        size: 30,
                        color: Colors.black
                      ),
                      // iconData: ,
                    ),
                    const SettingListTileItem(
                      titleText: "About Us",
                      iconData: Icon(
                        Icons.help_outline_outlined,
                        size: 30,
                        color: Colors.black
                      ),
                    ),
                    const SettingListTileItem(
                      titleText: "Contact Us",
                      iconData: Icon(
                        Icons.phone_callback_outlined,
                        size: 30,
                        color: Colors.black
                      ),
                    ),
                    SettingListTileItem(
                      onTap: () {
                        controller.userLogout();
                      },
                      logoutStyle: true,
                      titleText: "Logout",
                      iconData: const Icon(
                        Icons.phone_callback_outlined,
                        size: 30,
                        color: Colors.white
                      ),
                      containerColor: Colors.red,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
