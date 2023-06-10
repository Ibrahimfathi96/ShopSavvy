import 'package:flutter/material.dart';
import 'package:shop_savvy/core/constants/color.dart';
import 'package:shop_savvy/data/model/items_model.dart';
import 'package:shop_savvy/link_api.dart';

class OffersListViewItem extends StatelessWidget {
  final ItemsMd itemsMd;

  const OffersListViewItem({
    super.key,
    required this.itemsMd,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.only(
            top: 26,
            right: 12,
            left: 12,
            bottom: 8,
          ),
          child: Image.network(
            "${AppLink.laptops}/${itemsMd.itemsImage}",
            width: 250,
            height: 250,
            fit: BoxFit.fill,
          ),
        ),
        Container(
          height: 370,
          width: 270,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.darkColor,width: 2),
            color: Colors.black.withOpacity(0.2),
            borderRadius: BorderRadius.circular(
              16,
            ),
          ),
        ),
        Positioned(
          left: 8,
          top: 4,
          child: Text(
            "${itemsMd.itemsName}",
            style: const TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}
