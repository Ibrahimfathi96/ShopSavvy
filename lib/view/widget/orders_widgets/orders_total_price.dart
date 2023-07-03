import 'package:flutter/material.dart';
import 'package:shop_savvy/core/constants/color.dart';

class OrdersTotalPrice extends StatelessWidget {
  final String text1;
  final String text2;
  final Color color;
  final void Function() onDetailsPress;
  final void Function() onDeletePress;
  final bool? isDelivered;

  const OrdersTotalPrice({
    super.key,
    required this.text1,
    required this.text2,
    required this.onDetailsPress,
    required this.color,
    required this.onDeletePress,
    this.isDelivered,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
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
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(color: AppColors.primaryDark, width: 2)),
              onPressed: onDetailsPress,
              child: Text(
                "Details",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        if (isDelivered == true)
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MaterialButton(
                color: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                onPressed: onDeletePress,
                child: Text(
                  "Delete",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          )
      ],
    );
  }
}
