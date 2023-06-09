import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/controller/home/home_controller.dart';
import 'package:shop_savvy/core/class/handling_data_view.dart';
import 'package:shop_savvy/core/constants/image_assets.dart';
import 'package:shop_savvy/view/screen/home/widgets/home_cashback_widget.dart';
import 'package:shop_savvy/view/screen/home/widgets/home_categories_listview.dart';
import 'package:shop_savvy/view/screen/home/widgets/home_custom_appbar.dart';
import 'package:shop_savvy/view/screen/home/widgets/home_middle_text.dart';
import 'package:shop_savvy/view/screen/home/widgets/home_offers_listview.dart';

class HomeView extends StatelessWidget {
  static const String routeName = '/home';

  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return Scaffold(
      body: GetBuilder<HomeControllerImp>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: SafeArea(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  HomeCustomAppBar(
                    appBarTitle: "Find your product..",
                    onSearchPress: () {},
                    onNotificationPress: () {},
                  ),
                  Expanded(
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
                          text: "Offers for you",
                        ),
                        OffersListView(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
