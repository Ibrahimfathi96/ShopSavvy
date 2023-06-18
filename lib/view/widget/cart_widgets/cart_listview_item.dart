import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marquee/marquee.dart';
import 'package:shop_savvy/controller/cart_controller.dart';
import 'package:shop_savvy/core/constants/color.dart';
import 'package:shop_savvy/link_api.dart';

class CartItem extends GetView<CartController> {
  final void Function() onAdd;
  final void Function() onRemove;
  final String productName;
  final String productPrice;
  final String productCount;
  final String productImage;

  const CartItem({
    required this.onAdd,
    required this.onRemove,
    required this.productName,
    required this.productImage,
    required this.productPrice,
    required this.productCount,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 2, left: 2, right: 2),
      child: Column(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
              side: const BorderSide(color: AppColors.darkColor, width: 1),
            ),
            elevation: 6,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  color: Colors.grey.withOpacity(0.3),
                  child: CachedNetworkImage(
                    imageUrl: "${AppLink.imagesItems}/$productImage",
                    height: 90,
                    width: 90,
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: SizedBox(
                      height: 30,
                      child: Marquee(
                        velocity: 20,
                        text: productName,
                        style: const TextStyle(
                          color: AppColors.primaryDark,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    subtitle: Text(
                      productPrice,
                      style: const TextStyle(
                        color: AppColors.primaryDark,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 3,
                      ),
                      GestureDetector(
                        onTap: onAdd,
                        child: const Icon(
                          Icons.add_circle_outline,
                          size: 32,
                          color: AppColors.primaryDark,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Text(
                          productCount,
                          style: const TextStyle(
                            fontSize: 22,
                            color: AppColors.primaryDark,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: onRemove,
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
    );
  }
}
