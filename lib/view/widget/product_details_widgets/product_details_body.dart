import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/controller/product_details_controller.dart';
import 'package:shop_savvy/view/widget/product_details_widgets/product_colors.dart';
import 'package:shop_savvy/view/widget/product_details_widgets/product_description.dart';
import 'package:shop_savvy/view/widget/product_details_widgets/product_display_stack.dart';
import 'package:shop_savvy/view/widget/product_details_widgets/product_price.dart';
import 'package:shop_savvy/view/widget/product_details_widgets/terms_widget.dart';

class ProductDetailsBody extends GetView<ProductDetailsControllerImp> {
  const ProductDetailsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        const ProductDisplayStack(),
        Container(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TermsWidget(),
              ProductPrice(),
              ProductDescription(),
              ProductColors(),
            ],
          ),
        ),
      ],
    );
  }
}
