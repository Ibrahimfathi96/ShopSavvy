import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/controller/home/home_controller.dart';
import 'package:shop_savvy/data/model/ItemsMD.dart';
import 'package:shop_savvy/view/screen/home/widgets/home_offers_listview_item.dart';

class OffersListView extends GetView<HomeControllerImp> {
  const OffersListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      padding: const EdgeInsets.symmetric(vertical: 10),
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

