import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/controller/items_controller.dart';
import 'package:shop_savvy/core/class/handling_data_view.dart';
import 'package:shop_savvy/view/widget/home_widgets/home_custom_appbar.dart';
import 'package:shop_savvy/view/widget/items_widgets/items_categories_listview.dart';
import 'package:shop_savvy/view/widget/items_widgets/items_gridview.dart';

class ItemsView extends StatelessWidget {
  static const String routeName = '/items-view';

  const ItemsView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: GetBuilder<ItemsControllerImp>(
            builder: (controller) => Column(
              children: [
                HomeCustomAppBar(
                  backButton: GestureDetector(
                    onTap: () {
                      controller.goBack();
                    },
                    child: const Icon(Icons.arrow_back_ios),
                  ),
                  appBarTitle: "Find your product..",
                  onSearchPress: () {},
                  onNotificationPress: () {},
                ),
                const ItemsCategoriesListView(),
                HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: const ItemsGridBuilder(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
