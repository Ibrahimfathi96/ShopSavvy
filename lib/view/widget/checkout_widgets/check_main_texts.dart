import 'package:flutter/material.dart';
import 'package:shop_savvy/core/constants/color.dart';

class CustomCheckText extends StatelessWidget {
  final String text;

  const CustomCheckText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 18,
        color: AppColors.darkColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
