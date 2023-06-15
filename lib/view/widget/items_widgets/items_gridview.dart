import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/controller/favorite_controller.dart';
import 'package:shop_savvy/controller/items_controller.dart';
import 'package:shop_savvy/data/model/items_model.dart';
import 'package:shop_savvy/view/widget/items_widgets/items_gridview_builder.dart';

class ItemsGridBuilder extends GetView<ItemsControllerImp> {
  const ItemsGridBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    FavoriteController favController = Get.put(FavoriteController());
    return Expanded(
      child: GridView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: controller.data.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.55,
        ),
        itemBuilder: (context, index) {
          favController.isFavorite[controller.data[index]['items_id']] =
              controller.data[index]['favorite'];
          return ItemsGridViewBuilder(
            itemsMd: ItemsMd.fromJson(
              controller.data[index],
            ),
          );
        },
      ),
    );
  }
}
