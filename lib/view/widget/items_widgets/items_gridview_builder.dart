import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marquee/marquee.dart';
import 'package:shop_savvy/controller/items_controllers/items_controller.dart';
import 'package:shop_savvy/core/constants/color.dart';
import 'package:shop_savvy/data/model/items_model.dart';
import 'package:shop_savvy/link_api.dart';

class ItemsGridViewBuilder extends StatelessWidget {
  final ItemsMd itemsMd;

  // final int selectedItem;

  const ItemsGridViewBuilder({
    super.key,
    required this.itemsMd,
    // required this.selectedItem,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 150,
                child: CachedNetworkImage(
                  imageUrl: '${AppLink.imagesItems}/${itemsMd.itemsImage}',
                ),
              ),
              const SizedBox(height: 10,),
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
                  GetBuilder<ItemsControllerImp>(builder: (controller) {
                    return GestureDetector(
                      onTap: () {
                        // controller.addToFavourite();
                      },
                      child: Icon(
                        controller.addedToFavourite
                            ? Icons.favorite
                            : Icons.favorite_border_outlined,
                        color: AppColors.primaryColor,
                      ),
                    );
                  }),
                ],
              ),
              Expanded(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                      child: Marquee(
                        velocity: 50,
                        text: "${itemsMd.itemsName}    ",
                        style: const TextStyle(
                            color: Colors.black87, fontSize: 16),
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      "${itemsMd.itemsDesc}",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(color: Colors.grey[700], fontSize: 12),
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
