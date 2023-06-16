import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/core/constants/color.dart';
import 'package:shop_savvy/view/widget/cart_widgets/cart_bottom_widgets.dart';
import 'package:shop_savvy/view/widget/cart_widgets/cart_listview_item.dart';

class CartView extends StatelessWidget {
  static const String routeName = '/cart-view';

  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: const CartFAButtonWidgets(),
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
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 6),
            padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 40),
            decoration: BoxDecoration(
              color: AppColors.purple,
              border: Border.all(color: AppColors.primaryDark),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Text(
              "You have 4 items in your cart",
              style: TextStyle(color: Colors.white),
            ),
          ),
          Container(
            height: Get.height * 0.41,
            margin: const EdgeInsets.symmetric(horizontal: 6),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.4),
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: AppColors.grey,width: 2)
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
          ),
        ],
      ),
    );
  }
}
