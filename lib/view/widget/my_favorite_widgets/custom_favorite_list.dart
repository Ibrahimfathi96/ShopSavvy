import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marquee/marquee.dart';
import 'package:shop_savvy/controller/my_favorite_controller.dart';
import 'package:shop_savvy/core/constants/color.dart';
import 'package:shop_savvy/core/functions/translate_database.dart';
import 'package:shop_savvy/data/model/my_favorite_model.dart';
import 'package:shop_savvy/link_api.dart';

class FavoriteItemsGridViewBuilder extends GetView<MyFavoriteController> {
  final MyFavoriteMd itemsMd;

  const FavoriteItemsGridViewBuilder({
    super.key,
    required this.itemsMd,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // controller.goToProductDetails(itemsMd);
      },
      child: Card(
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 150,
                child: Hero(
                  tag: "${itemsMd.itemsId}",
                  child: CachedNetworkImage(
                    imageUrl: '${AppLink.imagesItems}/${itemsMd.itemsImage}',
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    "${itemsMd.itemsPrice}",
                    style: const TextStyle(
                        color: AppColors.darkColor, fontSize: 18),
                  ),
                  const Text(
                    "EGP",
                    style: TextStyle(
                      fontSize: 11,
                      color: AppColors.darkColor,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      controller.deleteData(itemsMd.favoriteId.toString());
                    },
                    child: const Icon(
                      Icons.delete_outline_rounded,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  children: [
                    SizedBox(
                      height: 25,
                      child: Marquee(
                        velocity: 30,
                        text:
                            "${translateDB(itemsMd.itemsName, itemsMd.itemsNameAr)}    ",
                        style: const TextStyle(
                            color: Colors.black87, fontSize: 16),
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            ...List.generate(
                              5,
                              (index) => Icon(
                                index < 3 ? Icons.star : Icons.star_border,
                                color:
                                    index < 3 ? Colors.orange : Colors.black87,
                                size: 15,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        const Text(
                          "3.5(50)",
                          style: TextStyle(fontSize: 13, color: Colors.black87),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
