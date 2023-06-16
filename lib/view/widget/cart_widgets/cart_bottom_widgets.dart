import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/controller/cart_controller.dart';
import 'package:shop_savvy/view/widget/cart_widgets/cart_coupon_widget.dart';
import 'package:shop_savvy/view/widget/cart_widgets/cart_dots_divider.dart';
import 'package:shop_savvy/view/widget/cart_widgets/cart_elevated_button.dart';
import 'package:shop_savvy/view/widget/cart_widgets/cart_total_price_texts.dart';
import 'package:shop_savvy/view/widget/cart_widgets/custom_texts.dart';

class CartFAButtonWidgets extends GetView<CartController> {
  const CartFAButtonWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.29,
      child: Column(
        children: [
          const SizedBox(height: 8,),
          const CartCoupon(),
          CustomCartTexts(text1: "Subtotal", text2: "EGP ${controller.ordersPrice}"),
          const CustomCartTexts(text1: "Delivery Fees", text2: "EGP 25"),
          const CustomCartTexts(text1: "Discount", text2: "%25"),
          const CustomDotsDivider(),
          const TotalPriceText(),
          const CartCustomButton(),
        ],
      ),
    );
  }
}





