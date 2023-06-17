import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/controller/items_controller.dart';
import 'package:shop_savvy/core/class/handling_data_view.dart';
import 'package:shop_savvy/view/screen/my_favorite.dart';
import 'package:shop_savvy/view/widget/home_widgets/custom_appbar.dart';
import 'package:shop_savvy/view/widget/home_widgets/home_notification_icon.dart';
import 'package:shop_savvy/view/widget/home_widgets/search_items_listview.dart';
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
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GetBuilder<ItemsControllerImp>(
            builder: (controller) => Column(
              children: [
                CustomAppBar(
                  onClosePress: (){
                    controller.clearController(context);
                  },
                  myController: controller.searchController,
                  onChanged: (val) {
                    controller.checkSearching(val);
                  },
                  backButton: GestureDetector(
                    onTap: () {
                      controller.goBack();
                    },
                    child: const Icon(Icons.arrow_back_ios),
                  ),
                  favouriteButton: HomeAppBarIcons(
                    onPressed: () {
                      Get.toNamed(MyFavoriteView.routeName);
                    },
                    iconData: Icons.favorite_border_outlined,
                  ),
                  appBarTitle: "Find your product..",
                  onSearchPress: () {
                    controller.onItemsSearching();
                  },
                  onNotificationPress: () {},
                ),
                HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: controller.searching == false
                      ? const Expanded(
                          child: Column(
                            children: [
                              ItemsCategoriesListView(),
                              ItemsGridBuilder(),
                            ],
                          ),
                        )
                      : ItemsListSearch(
                          searchDataList: controller.searchList,
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
