import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/controller/settings_controller.dart';
import 'package:shop_savvy/core/functions/changeLanguage.dart';
import 'package:shop_savvy/view/widget/settings_widgets/settings_list_tile_item.dart';

class SettingsCardItems extends GetView<SettingsController> {
  const SettingsCardItems({
    super.key,

  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
    );
  }
}
