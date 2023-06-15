import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/controller/my_favorite_controller.dart';
import 'package:shop_savvy/core/class/handling_data_view.dart';
import 'package:shop_savvy/view/widget/home_widgets/custom_appbar.dart';

class MyFavoriteView extends StatelessWidget {
  static const String routeName = '/my-favorite';

  const MyFavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteController());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: GetBuilder<MyFavoriteController>(builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView(
              children: [
                CustomAppBar(
                  onFavoritePress: () {
                    Get.toNamed(MyFavoriteView.routeName);
                  },
                  appBarTitle: "Find your product..",
                  onSearchPress: () {},
                  onNotificationPress: () {},
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: controller.data.length,
                  itemBuilder: (context, index) {
                    return Text(controller.data[index].itemsName!);
                  },
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
