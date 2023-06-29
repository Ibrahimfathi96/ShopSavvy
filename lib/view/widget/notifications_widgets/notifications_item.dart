import 'package:flutter/material.dart';
import 'package:shop_savvy/core/constants/color.dart';

class NotificationItem extends StatelessWidget {
  final String title;
  final String subTitle;
  final String dateTime;

  const NotificationItem({
    required this.title,
    required this.subTitle,
    required this.dateTime,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: Colors.grey[200],
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
            ),
            Text(
              dateTime,
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        subtitle: Text(
          subTitle,
        ),
      ),
    );
  }
}
