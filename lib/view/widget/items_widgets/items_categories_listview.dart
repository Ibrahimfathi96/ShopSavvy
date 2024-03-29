import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/controller/items_controller.dart';
import 'package:shop_savvy/data/model/categories_model.dart';
import 'package:shop_savvy/view/widget/items_widgets/items_categories_listview_item.dart';

class ItemsCategoriesListView extends GetView<ItemsControllerImp> {
  const ItemsCategoriesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GridView.builder(
        padding: const EdgeInsets.symmetric(vertical: 10),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 2.2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 6,
        ),
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.categories.length,
        itemBuilder: (context, index) {
          return ItemsCategoriesListViewItem(
            categoriesMD: CategoriesMD.fromJson(controller.categories[index]),
            selectedCategory: index,
          );
        },
      ),
    );
  }
}
