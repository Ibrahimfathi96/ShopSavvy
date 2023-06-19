import 'package:flutter/material.dart';
import 'package:shop_savvy/core/constants/color.dart';

class MethodPaymentContainer extends StatelessWidget {
  final String imageUrl;
  final String text;
  final bool isActive;

  const MethodPaymentContainer({
    super.key,
    required this.imageUrl,
    required this.text,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 6),
      padding: EdgeInsets.only(left: 30),
      decoration: BoxDecoration(
        color:isActive == true ? AppColors.darkColor: Colors.green[50],
        border: Border.all(
            color: AppColors.primaryDark, width: 1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            imageUrl,
            width: 60,
            height: 60,
            fit: BoxFit.fill,
          ),
          const SizedBox(
            width: 30,
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isActive == true ? Colors.white:AppColors.primaryDark,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
