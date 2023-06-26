import 'package:flutter/material.dart';
import 'package:shop_savvy/core/constants/color.dart';

class AppBarLeadingItem extends StatelessWidget {
  const AppBarLeadingItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      onPressed: () {},
      icon: Icon(
        Icons.arrow_back_ios_new,
        color: AppColors.primaryDark,
        size: 28,
      ),
    );
  }
}
