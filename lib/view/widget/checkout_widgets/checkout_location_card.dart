import 'package:flutter/material.dart';
import 'package:shop_savvy/core/constants/color.dart';

class CheckoutLocationCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isActive;

  const CheckoutLocationCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isActive == true ? AppColors.primaryColor : Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: isActive == true ?10:1,
      child: Container(
        child: ListTile(
          title: Text(
            title,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: isActive == true ? Colors.white : Colors.black),
          ),
          subtitle: Text(
            subtitle,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: isActive == true ? Colors.white : Colors.black),
          ),
        ),
      ),
    );
  }
}
