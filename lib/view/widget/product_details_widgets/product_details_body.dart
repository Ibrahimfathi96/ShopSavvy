import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/controller/product_details_controller.dart';
import 'package:shop_savvy/view/widget/product_details_widgets/product_details_column.dart';
import 'package:shop_savvy/view/widget/product_details_widgets/product_display_stack.dart';

class ProductDetailsBody extends GetView<ProductDetailsControllerImp> {
  const ProductDetailsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: const [
        ProductDisplayStack(),
        ProductDetailsColumn(),
      ],
    );
  }
}

