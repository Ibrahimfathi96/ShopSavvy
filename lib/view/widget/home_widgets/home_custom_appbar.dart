import 'package:flutter/material.dart';
import 'package:shop_savvy/view/widget/home_widgets/home_notification_icon.dart';
import 'package:shop_savvy/view/widget/home_widgets/home_search_textfield.dart';

class HomeCustomAppBar extends StatelessWidget {
  final Widget? backButton;
  final String appBarTitle;
  final void Function()? onSearchPress;

  final void Function()? onNotificationPress;

  const HomeCustomAppBar(
      {super.key,
      this.backButton,
      required this.appBarTitle,
      this.onSearchPress,
      this.onNotificationPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 4, bottom: 4),
      child: Row(
        children: [
          backButton ?? const SizedBox(),
          HomeSearchTextField(
            appBarTitle: appBarTitle,
            onSearchPress: onSearchPress,
          ),
          const SizedBox(
            width: 10,
          ),
          HomeNotificationIcon(
            onNotificationPress: onNotificationPress,
          ),
        ],
      ),
    );
  }
}
