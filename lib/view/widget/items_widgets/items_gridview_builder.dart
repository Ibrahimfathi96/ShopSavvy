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
            children: [
              SizedBox(
                height: 120,
                child: CachedNetworkImage(
                  imageUrl:'${AppLink.imagesItems}/${itemsMd.itemsImage}',
                ),
              ),
              const SizedBox(height: 10,),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 20,
                      child: Marquee(
                        velocity: 50,
                        text:
                        "${itemsMd.itemsName}    ",
                        style: const TextStyle(
                            color: Colors.black87, fontSize: 16),
                      ),
                    ),
                    Text(
                      "${itemsMd.itemsDesc}",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.clip,
                      style: TextStyle(color: Colors.grey[700], fontSize: 12),
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${itemsMd.itemsPrice} EGP",
                            style: const TextStyle(
                                color: AppColors.secondaryColor),
                          ),
                          const Spacer(),
                          GetBuilder<ItemsControllerImp>(builder: (controller) {
                            return GestureDetector(
                              onTap: () {
                                // controller.addToFavourite();
                              },
                              child: Icon(
                                controller.addedToFavourite ?
                                Icons.favorite:Icons.favorite_border_outlined,
                                color: AppColors.primaryColor,
                              ),
                            );
                          }),
                        ],
                      ),
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
