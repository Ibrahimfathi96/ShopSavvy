import 'package:flutter/material.dart';
import 'package:shop_savvy/core/constants/color.dart';

class CustomHomeBottomNavBar extends StatelessWidget {
  final void Function() onPressed;
  final String buttonText;
  final IconData icon;
  final bool? isActive;

  const CustomHomeBottomNavBar({
    super.key,
    required this.onPressed,
    required this.buttonText,
    required this.icon,
    this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: SizedBox(
        height: 60,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isActive == true ? AppColors.brightYellow : Colors.white,
            ),
            Text(
              buttonText,
              style: TextStyle(
                color: isActive == true ? AppColors.brightYellow:Colors.white
              ),
            ),
          ],
        ),
      ),
    );
  }
}
