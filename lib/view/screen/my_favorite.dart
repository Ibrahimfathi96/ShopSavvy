import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/controller/my_favorite_controller.dart';
import 'package:shop_savvy/core/class/handling_data_view.dart';
import 'package:shop_savvy/view/widget/home_widgets/custom_appbar.dart';
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
                    backButton: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(Icons.arrow_back_ios),
                    ),
                    appBarTitle: "Find your product..",
                    onSearchPress: () {},
                    onNotificationPress: () {},
                  ),
                  Expanded(
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
                  ),
                ],
              );
          }),
        ),
      ),
    );
  }
}
