import 'package:flutter/material.dart';
import 'package:shop_savvy/core/constants/color.dart';
import 'package:shop_savvy/generated/assets.dart';
import 'package:shop_savvy/view/widget/product_details_widgets/terms_widget_item.dart';

class TermsWidget extends StatelessWidget {
  const TermsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "On Delivery Terms:",
          textAlign: TextAlign.start,
          style: TextStyle(color: AppColors.primaryDark),
        ),
        SizedBox(height: 4,),
        Row(
          children: [
            TermsWidgetItem(
              title: "Cash on Delivery",
              imageUrl: Assets.imagesTerms1,
            ),
            TermsWidgetItem(
              title: "15 days Returnable",
              imageUrl: Assets.imagesTerms2,
            ),
            TermsWidgetItem(
              title: "Free Delivery",
              imageUrl: Assets.imagesTerms3,
            ),
            TermsWidgetItem(
              title: "Delivered by ShopSavvy",
              imageUrl: Assets.imagesTerms4,
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
