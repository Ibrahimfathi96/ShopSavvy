import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/controller/items_controller.dart';
import 'package:shop_savvy/core/constants/color.dart';
import 'package:shop_savvy/core/functions/translate_database.dart';
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
        controller.changeCategoryOnTap(
            selectedCategory, categoriesMD.categoriesId.toString());
      },
      child: GetBuilder<ItemsControllerImp>(builder: (logic) {
        return Material(
          borderRadius: BorderRadius.circular(16),
          elevation: controller.selectedCategory == selectedCategory ? 30 : 0,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
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
              "${translateDB(categoriesMD.categoriesName, categoriesMD.categoriesNameAr)}",
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 14,
              ),
            ),
          ),
        );
      }),
    );
  }
}
