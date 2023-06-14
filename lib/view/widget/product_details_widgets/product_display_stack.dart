import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/controller/product_details_controller.dart';
import 'package:shop_savvy/link_api.dart';
import 'package:shop_savvy/view/widget/product_details_widgets/product_details_appbar.dart';

class ProductDisplayStack extends GetView<ProductDetailsControllerImp> {
  const ProductDisplayStack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(
            "assets/images/gradient_image.PNG",
          ),
        ),
      ),
      child: Column(
        children: [
          const ProductDetailsAppBar(),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 250,
                width: Get.width,
                padding: const EdgeInsets.all(16),
              ),
              Positioned(
                bottom: -10,
                left: Get.width / 8,
                right: Get.width / 8,
                child: Hero(
                  tag: "${controller.itemsMd.itemsId}",
                  child: CachedNetworkImage(
                    imageUrl:
                    '${AppLink.imagesItems}/${controller.itemsMd.itemsImage!}',
                    height: Get.height / 3,
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
