import 'package:flutter/material.dart';
import 'package:shop_savvy/core/constants/color.dart';

class SettingListTileItem extends StatelessWidget {
  final String titleText;
  final void Function()? onTap;
  final Color? containerColor;
  final bool? logoutStyle;
  final Widget iconData;

  const SettingListTileItem(
      {super.key,
      required this.titleText,
      this.containerColor,
      this.logoutStyle = false,
      required this.iconData, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30)
          .add(const EdgeInsets.only(top: 16)),
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.primaryDark,
        ),
      ),
      child: ListTile(
        onTap: onTap,
        trailing: iconData,
        title: Text(
          titleText,
          style: logoutStyle == false
              ? const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                )
              : const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
