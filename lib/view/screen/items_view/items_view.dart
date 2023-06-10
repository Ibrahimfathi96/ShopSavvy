import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/controller/items_controllers/items_controller.dart';
import 'package:shop_savvy/core/constants/color.dart';
import 'package:shop_savvy/link_api.dart';
import 'package:shop_savvy/view/widget/home_widgets/home_custom_appbar.dart';
import 'package:shop_savvy/view/widget/items_widgets/items_categories_listview.dart';

class ItemsView extends StatelessWidget {
  static const String routeName = '/items-view';

  const ItemsView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
    return GetBuilder<ItemsControllerImp>(
      builder: (controller) => Scaffold(
        body: GetBuilder<ItemsControllerImp>(
          builder: (controller) => Container(
            padding: const EdgeInsets.all(16),
            child: ListView(
              physics: const BouncingScrollPhysics(),
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
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.5,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {},
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.network(
                                  '${AppLink.laptops}/lenovo-ideapad3.jpg'),
                              const Text(
                                "Product Title",
                                style: TextStyle(color: Colors.black87),
                              ),
                              Text(
                                "Product Description: How Are You My Friend Product Description: How Are You My Friend",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.grey[700]),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "80999\$",
                                      style: TextStyle(
                                          color: AppColors.secondaryColor),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.favorite_border_outlined,
                                        color: AppColors.primaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
