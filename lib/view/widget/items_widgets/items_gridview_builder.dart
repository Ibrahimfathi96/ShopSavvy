import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:shop_savvy/core/constants/color.dart';
import 'package:shop_savvy/data/model/items_model.dart';
import 'package:shop_savvy/link_api.dart';

class ItemsGridViewBuilder extends StatelessWidget {
  final ItemsMd itemsMd;

  const ItemsGridViewBuilder({
    super.key,
    required this.itemsMd,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              SizedBox(
                height: 120,
                child: Image.network(
                  '${AppLink.laptops}/${itemsMd.itemsImage}',
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: 6,),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 20,
                      child: Marquee(
                        velocity: 50,
                        text:
                          "${itemsMd.itemsName}    ",
                          style: const TextStyle(color: Colors.black87,fontSize: 16),
                      ),
                    ),
                    Text(
                      "${itemsMd.itemsDesc}",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey[700], fontSize: 13),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: 8.0, horizontal: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${itemsMd.itemsPrice} EGP",
                            style: const TextStyle(color: AppColors.secondaryColor),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {},
                            child: const Icon(
                              Icons.favorite_border_outlined,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
