import 'package:flutter/material.dart';
import 'package:shop_savvy/core/constants/color.dart';

class MethodDeliveryContainer extends StatelessWidget {
  final String imageUrl;
  final String text;
  final bool isActive;

  const MethodDeliveryContainer({
    super.key,
    required this.imageUrl,
    required this.text,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: isActive == true ? AppColors.primaryColor : Colors.white,
        borderRadius: BorderRadius.circular(26),
        border: Border.all(
          color: AppColors.secondaryColor,
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
              color: isActive == true ? Colors.white:AppColors.secondaryColor,
            ),
          )
        ],
      ),
    );
  }
}
