import 'package:flutter/material.dart';
import 'package:shop_savvy/core/constants/color.dart';

class CheckoutBottomButton extends StatelessWidget {
  const CheckoutBottomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32),
      child: MaterialButton(
        padding: EdgeInsets.symmetric(vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        color: AppColors.primaryColor,
        textColor: Colors.white,
        onPressed: () {},
        child: Text(
          "Checkout",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
