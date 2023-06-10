import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/controller/items_controllers/items_controller.dart';
import 'package:shop_savvy/core/constants/color.dart';
import 'package:shop_savvy/data/model/categories_model.dart';

class ItemsCategoriesListViewItem extends GetView<ItemsControllerImp> {
  final int selectedCategory;

  final CategoriesMD categoriesMD;

  const ItemsCategoriesListViewItem(
      {required this.selectedCategory, required this.categoriesMD, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.changeCategoryOnTap(selectedCategory);
      },
      child: GetBuilder<ItemsControllerImp>(builder: (logic) {
        return Material(
          borderRadius: BorderRadius.circular(16),
          elevation: controller.selectedCategory == selectedCategory ? 30 : 0,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 22),
            decoration: controller.selectedCategory == selectedCategory
                ? BoxDecoration(
                    color: AppColors.thirdColor,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: AppColors.darkColor,
                      width: 2,
                    ),
                  )
                : BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: AppColors.darkColor,
                      width: 1,
                    ),
                  ),
            child: Text(
              "${categoriesMD.categoriesName}",
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.black87, fontSize: 16),
            ),
          ),
        );
      }),
    );
  }
}