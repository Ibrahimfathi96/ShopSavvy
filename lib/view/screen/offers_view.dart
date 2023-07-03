import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/controller/favorite_controller.dart';
import 'package:shop_savvy/controller/offers_controller.dart';
import 'package:shop_savvy/core/class/handling_data_view.dart';
import 'package:shop_savvy/core/constants/color.dart';
import 'package:shop_savvy/view/widget/home_widgets/custom_appbar.dart';
import 'package:shop_savvy/view/widget/home_widgets/search_items_listview.dart';
import 'package:shop_savvy/view/widget/offers_widgets/offers_custom_gridview_item.dart';

class OffersView extends StatelessWidget {
  static const String routeName = '/offers-view';

  const OffersView({super.key});

  @override
  Widget build(BuildContext context) {
    OffersController controller = Get.put(OffersController());
    Get.put(FavoriteController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomAppBar(
              onClosePress: () {
                controller.clearController(context);
              },
              myController: controller.searchController,
              onChanged: (val) {
                controller.checkSearching(val);
              },
              appBarTitle: "Find your product..",
              onSearchPress: () {
                controller.onItemsSearching();
              },
              onNotificationPress: () {},
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0).add(EdgeInsets.only(bottom: 8)),
              child: Text(
                "Offers For You",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryDark,
                  fontSize: 22,
                ),
              ),
            ),
            Expanded(
              child: GetBuilder<OffersController>(
                builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: controller.searching == false
                      ? Container(
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemCount: controller.itemsListData.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.55,
                            ),
                            itemBuilder: (context, index) {
                              return OffersCustomGridViewItem(
                                itemsMd: controller.itemsListData[index],
                              );
                            },
                          ),
                        )
                      : ItemsListSearch(
                          searchDataList: controller.searchList,
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
