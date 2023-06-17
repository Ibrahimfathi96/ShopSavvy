import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/controller/my_favorite_controller.dart';
import 'package:shop_savvy/core/class/handling_data_view.dart';
import 'package:shop_savvy/view/widget/home_widgets/custom_appbar.dart';
import 'package:shop_savvy/view/widget/home_widgets/home_notification_icon.dart';
import 'package:shop_savvy/view/widget/home_widgets/search_items_listview.dart';
import 'package:shop_savvy/view/widget/my_favorite_widgets/custom_favorite_list.dart';

class MyFavoriteView extends StatelessWidget {
  static const String routeName = '/my-favorite';

  const MyFavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteController());
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: GetBuilder<MyFavoriteController>(builder: (controller) {
            return Column(
              children: [
                CustomAppBar(
                  onClosePress: () {
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
                controller.searching == false
                    ? Expanded(
                        child: ListView(
                          physics: const BouncingScrollPhysics(),
                          children: [
                            HandlingDataView(
                              statusRequest: controller.statusRequest,
                              widget: GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 0.7,
                                        crossAxisSpacing: 2),
                                itemCount: controller.data.length,
                                itemBuilder: (context, index) {
                                  return FavoriteItemsGridViewBuilder(
                                    itemsMd: controller.data[index],
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      )
                    : ItemsListSearch(
                        searchDataList: controller.searchList,
                      ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
