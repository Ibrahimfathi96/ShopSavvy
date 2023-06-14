import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/controller/product_details_controller.dart';
import 'package:shop_savvy/view/widget/product_details_widgets/add_to_cart.dart';
import 'package:shop_savvy/view/widget/product_details_widgets/product_details_body.dart';

class ProductDetails extends StatelessWidget {
  static const String routeName = '/product_details';

  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProductDetailsControllerImp());
    return const Scaffold(
      bottomNavigationBar: AddToCartWidget(),
      body: ProductDetailsBody(),
    );
  }
}



