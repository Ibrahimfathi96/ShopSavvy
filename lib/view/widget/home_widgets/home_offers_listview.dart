import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/controller/home_controllers/home_controller.dart';
import 'package:shop_savvy/data/model/items_model.dart';
import 'package:shop_savvy/view/widget/home_widgets/home_offers_listview_item.dart';

class OffersListView extends GetView<HomeControllerImp> {
  const OffersListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width * 0.7,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: controller.items.length,
        separatorBuilder: (context, index) => const SizedBox(
          width: 8,
        ),
        itemBuilder: (context, index) {
          return OffersListViewItem(
            itemsMd: ItemsMd.fromJson(controller.items[index]),
          );
        },
      ),
    );
  }
}

