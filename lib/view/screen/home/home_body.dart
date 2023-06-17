import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/controller/home_controllers/home_controller.dart';
import 'package:shop_savvy/core/class/handling_data_view.dart';
import 'package:shop_savvy/core/constants/image_assets.dart';
import 'package:shop_savvy/view/screen/my_favorite.dart';
import 'package:shop_savvy/view/widget/home_widgets/custom_appbar.dart';
import 'package:shop_savvy/view/widget/home_widgets/home_cashback_widget.dart';
import 'package:shop_savvy/view/widget/home_widgets/home_categories_listview.dart';
import 'package:shop_savvy/view/widget/home_widgets/home_middle_text.dart';
import 'package:shop_savvy/view/widget/home_widgets/home_notification_icon.dart';
import 'package:shop_savvy/view/widget/home_widgets/home_offers_listview.dart';
import 'package:shop_savvy/view/widget/home_widgets/search_items_listview.dart';

class HomeBody extends StatelessWidget {
  static const String routeName = '/home-body';

  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
      builder: (controller) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            CustomAppBar(
              onChanged: (val) {
                controller.checkSearching(val);
              },
              myController: controller.searchController,
              onClosePress: (){
                controller.clearController(context);
              },
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
                  ? Expanded(
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        children: const [
                          HomeCashBackWidget(
                            homeBannerTitle: "A Summer Surprise",
                            homeBannerOffer: "Cashback 20%",
                            lottieFile: AppImageFromAssets.cashBack,
                          ),
                          HomeMiddleText(
                            text: "Categories",
                          ),
                          HomeCategoriesListView(),
                          HomeMiddleText(
                            text: "Offers for you",
                          ),
                          OffersListView(),
                          HomeMiddleText(
                            text: "Trending",
                          ),
                          OffersListView(),
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
    );
  }
}
