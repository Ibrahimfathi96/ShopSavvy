import 'package:flutter/material.dart';
import 'package:shop_savvy/view/widget/cart_widgets/cart_coupon_widget.dart';
import 'package:shop_savvy/view/widget/cart_widgets/cart_dots_divider.dart';
import 'package:shop_savvy/view/widget/cart_widgets/cart_elevated_button.dart';
import 'package:shop_savvy/view/widget/cart_widgets/cart_total_price_texts.dart';
import 'package:shop_savvy/view/widget/cart_widgets/custom_texts.dart';

class CartFAButtonWidgets extends StatelessWidget {
  const CartFAButtonWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CartCoupon(),
        CustomCartTexts(text1: "Subtotal", text2: "EGP 800"),
        CustomCartTexts(text1: "Delivery Free", text2: "EGP 25"),
        CustomCartTexts(text1: "Discount", text2: "25%"),
        CustomDotsDivider(),
        TotalPriceText(),
        CartCustomButton(),
        SizedBox(height: 8,),
      ],
    );
  }
}





