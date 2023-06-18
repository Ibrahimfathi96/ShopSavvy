import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/controller/cart_controller.dart';
import 'package:shop_savvy/view/widget/cart_widgets/cart_listview_item.dart';

class CartItemsContainer extends StatelessWidget {
  const CartItemsContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.50,
      child: GetBuilder<CartController>(
        builder: (controller) {
          return ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              ...List.generate(
                controller.data.length,
                (index) => CartItem(
                  productCount: "${controller.data[index].itemsTotalCount}",
                  productName: "${controller.data[index].itemsName}         ",
                  productPrice:
                      "${controller.data[index].itemsTotalPrice!.round()} EGP",
                  productImage: "${controller.data[index].itemsImage}",
                  onAdd: ()async {
                    await controller
                        .addToCart(controller.data[index].itemsId.toString());
                    controller.refreshPage();
                  },
                  onRemove: ()async {
                    await controller.deleteFromCart(
                        controller.data[index].itemsId.toString());
                    controller.refreshPage();
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
