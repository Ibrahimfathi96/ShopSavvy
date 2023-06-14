import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/controller/home_controllers/home_controller.dart';
import 'package:shop_savvy/core/constants/color.dart';
import 'package:shop_savvy/data/model/categories_model.dart';
import 'package:shop_savvy/view/widget/home_widgets/home_categories_listview_item.dart';

class HomeCategoriesListView extends GetView<HomeControllerImp> {
  const HomeCategoriesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: 130,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: controller.categories.length,
        separatorBuilder: (context, index) => const SizedBox(
          width: 10,
        ),
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.thirdColor,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: const Color(0xFF2c3e50),
                width: 2,
              ),
            ),
            child: HomeCategoriesListViewItem(
              categoriesMD: CategoriesMD.fromJson(controller.categories[index]),
              selectedCategory: index,
            ),
          );
        },
      ),
    );
  }
}