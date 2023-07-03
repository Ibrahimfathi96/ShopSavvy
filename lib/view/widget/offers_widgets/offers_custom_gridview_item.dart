import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marquee/marquee.dart';
import 'package:shop_savvy/controller/favorite_controller.dart';
import 'package:shop_savvy/controller/offers_controller.dart';
import 'package:shop_savvy/core/constants/color.dart';
import 'package:shop_savvy/core/functions/translate_database.dart';
import 'package:shop_savvy/data/model/items_model.dart';
import 'package:shop_savvy/generated/assets.dart';
import 'package:shop_savvy/link_api.dart';
import 'package:shop_savvy/view/widget/items_widgets/rating_widget.dart';

class OffersCustomGridViewItem extends GetView<OffersController> {
  final ItemsMd itemsMd;

  const OffersCustomGridViewItem({super.key, required this.itemsMd});

  @override
  Widget build(BuildContext context) {
    Get.put(FavoriteController());
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
                  const SizedBox(
                    height: 10,
                  ),
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
                            onTap: () {},
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
                        Container(
                          alignment: Alignment.center,
                          height: 60,
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
                        const SizedBox(
                          height: 6,
                        ),
                        const RatingWidget(),
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
