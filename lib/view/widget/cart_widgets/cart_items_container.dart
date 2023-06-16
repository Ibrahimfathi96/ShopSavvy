import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/controller/cart_controller.dart';
import 'package:shop_savvy/core/constants/color.dart';
import 'package:shop_savvy/view/widget/cart_widgets/cart_listview_item.dart';

class CartItemsContainer extends GetView<CartController> {
  const CartItemsContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.57,
      margin: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.4),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: AppColors.grey,
          width: 2,
        ),
      ),
      child: RawScrollbar(
        thumbColor: AppColors.primaryDark,
        thumbVisibility: true,
        radius: const Radius.circular(20),
        thickness: 5,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            ...List.generate(
              controller.data.length, (index) =>
            CartItem(
              productCount:"${controller.data[index].itemsTotalCount}",
              productName: "${controller.data[index].itemsName}         ",
              productPrice:"${controller.data[index].itemsTotalPrice} EGP" ,
              productImage: "${controller.data[index].itemsImage}",

            ),
            ),
          ],
        ),
      ),
    );
  }
}
