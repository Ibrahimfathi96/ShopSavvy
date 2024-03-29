import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/controller/cart_controller.dart';
import 'package:shop_savvy/core/class/handling_data_view.dart';
import 'package:shop_savvy/view/widget/cart_widgets/cart_bottom_widgets.dart';
import 'package:shop_savvy/view/widget/cart_widgets/cart_items_container.dart';
import 'package:shop_savvy/view/widget/cart_widgets/cart_upper_text.dart';

class CartView extends StatelessWidget {
  static const String routeName = '/cart-view';

  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CartController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          "My Cart",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: GetBuilder<CartController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              CartUpperText(),
              const CartItemsContainer(),
              CartFAButtonWidgets(),
            ],
          ),
        ),
      ),
    );
  }
}
