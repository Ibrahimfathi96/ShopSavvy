import 'package:flutter/material.dart';
import 'package:shop_savvy/view/widget/cart_widgets/cart_bottom_widgets.dart';
import 'package:shop_savvy/view/widget/cart_widgets/cart_items_container.dart';
import 'package:shop_savvy/view/widget/cart_widgets/cart_upper_text.dart';

class CartView extends StatelessWidget {
  static const String routeName = '/cart-view';

  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        toolbarHeight: 40,
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
      body: const Column(
        children: [
          CartUpperText(),
          CartItemsContainer(),
          Spacer(),
          CartFAButtonWidgets(),
        ],
      ),
    );
  }
}