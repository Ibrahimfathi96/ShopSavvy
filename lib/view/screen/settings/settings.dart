import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/controller/settings_controller.dart';
import 'package:shop_savvy/core/constants/color.dart';
import 'package:shop_savvy/view/widget/settings_widgets/settings_card_items.dart';
import 'package:shop_savvy/view/widget/settings_widgets/settins_stack.dart';

class SettingsView extends StatelessWidget {
  static const String routeName = '/settings';

  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SettingsController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        title: Text(
          "My Profile",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryDark,
          ),
        ),
      ),
      body: Column(
        children: [
          SettingsTopRow(),
          SettingsCardItems(),
        ],
      ),
    );
  }
}
