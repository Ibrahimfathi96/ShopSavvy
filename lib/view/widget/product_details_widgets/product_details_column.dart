import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/controller/product_details_controller.dart';
import 'package:shop_savvy/view/widget/product_details_widgets/product_colors.dart';
import 'package:shop_savvy/view/widget/product_details_widgets/product_description.dart';
import 'package:shop_savvy/view/widget/product_details_widgets/product_price.dart';
import 'package:shop_savvy/view/widget/product_details_widgets/terms_widget.dart';

class ProductDetailsColumn extends GetView<ProductDetailsControllerImp> {
  const ProductDetailsColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TermsWidget(),
          ProductPrice(
            price: "${controller.itemsMd.itemsPrice}",
            count: "1",
            onAddTap: (){},
            onRemoveTap: (){},
          ),
          const ProductDescription(),
          const ProductColors(),
        ],
      ),
    );
  }
}
