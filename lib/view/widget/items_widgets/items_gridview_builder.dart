import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marquee/marquee.dart';
import 'package:shop_savvy/controller/favorite_controller.dart';
import 'package:shop_savvy/controller/items_controller.dart';
import 'package:shop_savvy/core/constants/color.dart';
import 'package:shop_savvy/core/functions/translate_database.dart';
import 'package:shop_savvy/data/model/items_model.dart';
import 'package:shop_savvy/generated/assets.dart';
import 'package:shop_savvy/link_api.dart';

class ItemsGridViewBuilder extends GetView<ItemsControllerImp> {
  final ItemsMd itemsMd;

  const ItemsGridViewBuilder({
    super.key,
    required this.itemsMd,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.goToProductDetails(itemsMd);
      },
      child: Card(
        elevation: 10,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 150,
                    child: Hero(
                      tag: "${itemsMd.itemsId}",
                      child: CachedNetworkImage(
                        imageUrl:
                            '${AppLink.imagesItems}/${itemsMd.itemsImage}',
                      ),
                    ),
                  ),
                  //delivery Timer
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Icon(
                  //       Icons.timer_outlined,
                  //       color: AppColors.primaryDark,
                  //     ),
                  //     const SizedBox(
                  //       width: 10,
                  //     ),
                  //     Text(
                  //       "${controller.deliveryTime} mins",
                  //       style: TextStyle(
                  //           fontSize: 14, color: AppColors.primaryDark),
                  //     ),
                  //   ],
                  // ),
                  Row(
                    children: [
                      Text(
                        "${itemsMd.itemsPriceAfterDiscount!.round()}",
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
                      GetBuilder<FavoriteController>(
                        builder: (favController) {
                          return GestureDetector(
                            onTap: () {
                              if (favController.isFavorite[itemsMd.itemsId] ==
                                  1) {
                                favController.setFavorite(itemsMd.itemsId, 0);
                                favController.removeFromFavorite(
                                    itemsMd.itemsId.toString());
                              } else {
                                favController.setFavorite(itemsMd.itemsId, 1);
                                favController
                                    .addToFavorite(itemsMd.itemsId.toString());
                              }
                            },
                            child: Icon(
                              favController.isFavorite[itemsMd.itemsId] == 1
                                  ? Icons.favorite
                                  : Icons.favorite_border_outlined,
                              color: AppColors.primaryColor,
                            ),
                          );
                        },
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
                        Expanded(
                          child: Marquee(
                            scrollAxis: Axis.vertical,
                            velocity: 10,
                            text:
                                "${translateDB(itemsMd.itemsDesc, itemsMd.itemsDescAr)}",
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 12,
                            ),
                          ),
                        ),
                        // const SizedBox(
                        //   height: 6,
                        // ),
                        // // const RatingWidget(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (itemsMd.itemsDiscount != 0)
              Image.asset(Assets.imagesSale, width: 50),
          ],
        ),
      ),
    );
  }
}
