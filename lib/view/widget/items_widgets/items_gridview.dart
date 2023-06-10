import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/controller/items_controllers/items_controller.dart';
import 'package:shop_savvy/data/model/items_model.dart';
import 'package:shop_savvy/view/widget/items_widgets/items_gridview_builder.dart';

class ItemsGridBuilder extends GetView<ItemsControllerImp> {
  const ItemsGridBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 2,
      gridDelegate:
      const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.5,
      ),
      itemBuilder: (context, index) => ItemsGridViewBuilder(
        itemsMd: ItemsMd.fromJson(
          controller.data[index],
        ),
      ),
    );
  }
}
