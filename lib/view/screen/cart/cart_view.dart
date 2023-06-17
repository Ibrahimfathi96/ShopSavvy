import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/controller/cart_controller.dart';
import 'package:shop_savvy/core/class/handling_data_view.dart';
import 'package:shop_savvy/view/screen/home/home_screen.dart';
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
          leading: IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 30,
            ),
          ),
          actions: [
            IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              onPressed: () {
                Get.offAllNamed(HomeScreen.routeName);
              },
              icon: const Icon(
                Icons.home,
                color: Colors.black,
                size: 32,
              ),
            ),
          ],
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
        body: GetBuilder<CartController>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Column(
              children: [
                CartUpperText(
                  count: "${controller.countTotalItems}",
                ),
                CartItemsContainer(),
                CartFAButtonWidgets(
                  text1: "${controller.ordersPrice}",
                ),
              ],
            ),
          ),
        ));
  }
}
