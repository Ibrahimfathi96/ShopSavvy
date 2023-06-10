import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/controller/items_controllers/items_controller.dart';
import 'package:shop_savvy/data/model/categories_model.dart';
import 'package:shop_savvy/view/widget/items_widgets/items_categories_listview_item.dart';

class ItemsCategoriesListView extends GetView<ItemsControllerImp> {
  const ItemsCategoriesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      height: 50,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: controller.categories.length,
        separatorBuilder: (context, index) => const SizedBox(width: 2,),
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ItemsCategoriesListViewItem(
              categoriesMD: CategoriesMD.fromJson(controller.categories[index]),
              selectedCategory: index,
            ),
          );
        },
      ),
    );
  }
}
