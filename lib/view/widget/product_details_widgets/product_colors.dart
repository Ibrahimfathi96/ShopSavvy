import 'package:flutter/material.dart';
import 'package:shop_savvy/core/constants/color.dart';
import 'package:shop_savvy/view/widget/product_details_widgets/custom_color_container.dart';

class ProductColors extends StatelessWidget {
  const ProductColors({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Colors Available:",
          textAlign: TextAlign.start,
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(color: AppColors.primaryDark),
        ),
        const SizedBox(
          height: 6,
        ),
        const Row(
          children: [
            CustomColorContainer(
              borderColor: Colors.red,
              text: "Red",
            ),
            CustomColorContainer(
              borderColor: Colors.black,
              text: "Black",
            ),
            CustomColorContainer(
              borderColor: Colors.grey,
              text: "Grey",
            ),
          ],
        ),
      ],
    );
  }
}
