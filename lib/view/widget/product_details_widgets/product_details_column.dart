import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/controller/product_details_controller.dart';
import 'package:shop_savvy/core/class/handling_data_view.dart';
import 'package:shop_savvy/core/constants/color.dart';
import 'package:shop_savvy/view/widget/items_widgets/rating_widget.dart';
import 'package:shop_savvy/view/widget/product_details_widgets/add_to_cart.dart';
import 'package:shop_savvy/view/widget/product_details_widgets/product_description.dart';
import 'package:shop_savvy/view/widget/product_details_widgets/product_price.dart';
import 'package:shop_savvy/view/widget/product_details_widgets/terms_widget.dart';

class ProductDetailsColumn extends StatelessWidget {
  const ProductDetailsColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailsControllerImp>(builder: (controller) {
      return HandlingDataView(
        statusRequest: controller.statusRequest,
        widget: Container(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${controller.itemsMd.itemsName}",
                style: const TextStyle(
                  color: AppColors.purple,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const RatingWidget(),
              const ProductDescription(),
              ProductPrice(
                price: "${controller.itemsMd.itemsPrice}",
                count: "${controller.itemsCount}",
                onAddTap: () {
                  controller.cartItemCounterIncrement();
                },
                onRemoveTap: () {
                  controller.cartItemCounterDecrement();
                },
              ),
              SizedBox(
                height: Get.height * 0.06,
              ),
              const TermsWidget(),
              const SizedBox(
                height: 10,
              ),
              const AddToCartWidget(),
            ],
          ),
        ),
      );
    });
  }
}
