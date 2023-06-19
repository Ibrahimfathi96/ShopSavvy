import 'package:flutter/material.dart';
import 'package:shop_savvy/core/constants/color.dart';

class MethodDeliveryContainer extends StatelessWidget {
  final String imageUrl;
  final String text;
  final bool isActive;
  final void Function() onTap;

  const MethodDeliveryContainer({
    super.key,
    required this.imageUrl,
    required this.text,
    required this.isActive, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 120,
        height: 120,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isActive == true ? AppColors.primaryDark : Colors.green[50],
          borderRadius: BorderRadius.circular(26),
          border: Border.all(
            color: AppColors.primaryDark,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imageUrl,
              width: 70,
              height: 60,
              fit: BoxFit.fill,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              text,
              style: TextStyle(
                color: isActive == true ? Colors.white:AppColors.primaryDark,
              ),
            )
          ],
        ),
      ),
    );
  }
}
