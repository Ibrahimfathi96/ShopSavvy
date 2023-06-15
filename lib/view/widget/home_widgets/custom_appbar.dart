import 'package:flutter/material.dart';
import 'package:shop_savvy/view/widget/home_widgets/home_notification_icon.dart';
import 'package:shop_savvy/view/widget/home_widgets/home_search_textfield.dart';

class CustomAppBar extends StatelessWidget {
  final Widget? backButton;
  final String appBarTitle;
  final void Function() onSearchPress;

  final void Function() onNotificationPress;
  final void Function() onFavoritePress;

  const CustomAppBar(
      {super.key,
      this.backButton,
      required this.appBarTitle,
      required this.onSearchPress,
      required this.onFavoritePress,
      required this.onNotificationPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 4, bottom: 4),
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          backButton ?? const SizedBox(),
          HomeSearchTextField(
            appBarTitle: appBarTitle,
            onSearchPress: onSearchPress,
          ),
          HomeAppBarIcons(
            onPressed: onNotificationPress,
            iconData: Icons.notifications_active_outlined,
          ),
          HomeAppBarIcons(
            onPressed: onFavoritePress,
            iconData: Icons.favorite_border_outlined,
          ),
        ],
      ),
    );
  }
}
