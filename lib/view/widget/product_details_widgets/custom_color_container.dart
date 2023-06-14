import 'package:flutter/material.dart';
import 'package:shop_savvy/core/constants/color.dart';

class CustomColorContainer extends StatelessWidget {
  final String text;
  final Color borderColor;

  const CustomColorContainer({
    super.key,
    required this.text,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6),
      alignment: Alignment.center,
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          color: AppColors.darkColor,
        ),
      ),
    );
  }
}
