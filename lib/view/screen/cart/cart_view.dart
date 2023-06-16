import 'package:flutter/material.dart';
import 'package:shop_savvy/core/constants/color.dart';
import 'package:shop_savvy/generated/assets.dart';
import 'package:shop_savvy/view/widget/cart_widgets/cart_bottom_widgets.dart';

class CartView extends StatelessWidget {
  static const String routeName = '/cart-view';

  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: const CartFAButtonWidgets(),
      appBar: AppBar(
        //TODO Remove AppBar and make it custom or reduce its height and work on the cart items spacing and its view
        centerTitle: true,
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
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Card(
                  elevation: 16,
                  child: Row(
                    children: [
                      Image.asset(
                        Assets.imagesLogo,
                        height: 120,
                        width: 120,
                        fit: BoxFit.cover,
                      ),
                      const Expanded(
                        child: ListTile(
                          title: Text("Mac Book M1",
                              style: TextStyle(
                                  color: AppColors.primaryDark, fontSize: 18)),
                          subtitle: Text(
                            "98999 EGP",
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: const Icon(
                                Icons.add_circle_outline,
                                size: 32,
                                color: AppColors.primaryDark,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4.0),
                              child: Text(
                                "2",
                                style: TextStyle(
                                  fontSize: 22,
                                  color: AppColors.primaryDark,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: const Icon(
                                Icons.remove_circle_outline,
                                size: 32,
                                color: AppColors.primaryDark,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Card(
                  elevation: 16,
                  child: Row(
                    children: [
                      Image.asset(
                        Assets.imagesLogo,
                        height: 120,
                        width: 120,
                        fit: BoxFit.cover,
                      ),
                      const Expanded(
                        child: ListTile(
                          title: Text("Mac Book M1",
                              style: TextStyle(
                                  color: AppColors.primaryDark, fontSize: 18)),
                          subtitle: Text(
                            "98999 EGP",
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: const Icon(
                                Icons.add_circle_outline,
                                size: 32,
                                color: AppColors.primaryDark,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4.0),
                              child: Text(
                                "2",
                                style: TextStyle(
                                  fontSize: 22,
                                  color: AppColors.primaryDark,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: const Icon(
                                Icons.remove_circle_outline,
                                size: 32,
                                color: AppColors.primaryDark,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

