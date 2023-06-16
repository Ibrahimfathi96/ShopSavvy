import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/controller/product_details_controller.dart';

class ProductDescription extends GetView<ProductDetailsControllerImp> {
  const ProductDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(
          height: 12,
        ),
        Text(
          "${controller.itemsMd.itemsDesc}",
          style: const TextStyle(
            color: Colors.black,
            height: 1.5,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
