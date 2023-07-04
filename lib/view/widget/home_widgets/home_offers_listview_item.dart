import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marquee/marquee.dart';
import 'package:shop_savvy/controller/home_controllers/home_controller.dart';
import 'package:shop_savvy/core/constants/color.dart';
import 'package:shop_savvy/core/functions/translate_database.dart';
import 'package:shop_savvy/data/model/items_model.dart';
import 'package:shop_savvy/link_api.dart';

class OffersListViewItem extends GetView<HomeControllerImp> {
  final ItemsMd itemsMd;

  const OffersListViewItem({
    super.key,
    required this.itemsMd,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToProductDetails(itemsMd);
      },
      child: AspectRatio(
        aspectRatio: 0.8,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.darkColor, width: 2),
            color: Colors.grey.withOpacity(0.4),
            borderRadius: BorderRadius.circular(
              16,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  child: CachedNetworkImage(
                    imageUrl: "${AppLink.imagesItems}/${itemsMd.itemsImage}",
                    width: 250,
                    height: 150,
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  height: 35,
                  child: Marquee(
                    text:
                        "${translateDB(itemsMd.itemsName, itemsMd.itemsNameAr)}   ",
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
