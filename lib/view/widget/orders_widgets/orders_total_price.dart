import 'package:flutter/material.dart';
import 'package:shop_savvy/core/constants/color.dart';

class OrdersTotalPrice extends StatelessWidget {
  final String text1;
  final String text2;
  final void Function() onPressed;

  const OrdersTotalPrice({
    super.key,
    required this.text1,
    required this.text2, required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text(
              text1,
              style: TextStyle(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text(
              text2,
              style: TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ],
        ),
        MaterialButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(color: AppColors.primaryDark, width: 2)),
          onPressed: onPressed,
          child: Text(
            "Details",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
