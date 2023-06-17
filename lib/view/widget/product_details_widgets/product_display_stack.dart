import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/controller/product_details_controller.dart';
import 'package:shop_savvy/link_api.dart';

class ProductDisplayStack extends GetView<ProductDetailsControllerImp> {
  const ProductDisplayStack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFA7E1F9)
      ),
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 250,
                width: Get.width,
                padding: const EdgeInsets.all(16),
              ),
              Positioned(
                bottom: 2,
                left: Get.width / 8,
                right: Get.width / 8,
                child: Hero(
                  tag: "${controller.itemsMd.itemsId}",
                  child: CachedNetworkImage(
                    imageUrl:
                    '${AppLink.imagesItems}/${controller.itemsMd.itemsImage!}',
                    height: Get.height / 3.5,
                    width: Get.width,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
