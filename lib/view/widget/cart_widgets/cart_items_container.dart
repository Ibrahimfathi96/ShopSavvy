import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/core/constants/color.dart';
import 'package:shop_savvy/view/widget/cart_widgets/cart_listview_item.dart';

class CartItemsContainer extends StatelessWidget {
  const CartItemsContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.48,
      margin: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.4),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: AppColors.grey,
          width: 2,
        ),
      ),
      child: Scrollbar(
        thumbVisibility: true,
        thickness: 8,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: const [
            CartItem(),
            CartItem(),
            CartItem(),
            CartItem(),
            CartItem(),
            CartItem(),
            CartItem(),
            CartItem(),
          ],
        ),
      ),
    );
  }
}
