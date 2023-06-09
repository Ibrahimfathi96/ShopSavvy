import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/controller/home/home_controller.dart';
import 'package:shop_savvy/core/class/handling_data_view.dart';
import 'package:shop_savvy/core/constants/color.dart';
import 'package:shop_savvy/link_api.dart';
import 'package:shop_savvy/view/screen/home/widgets/home_cashback_widget.dart';
import 'package:shop_savvy/view/screen/home/widgets/home_custom_appbar.dart';

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
          widget: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                const HomeCustomAppBar(),
                const SizedBox(
                  height: 4,
                ),
                const HomeCashBackWidget(),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  height: 120,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: controller.categories.length,
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 10,
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: AppColors.thirdColor,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: const Color(0xFF2c3e50),
                            width: 2,
                          ),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 70,
                              width: 70,
                              child: SvgPicture.network(
                                "${AppLink.imagesCategories}/${controller.categories[index]['categories_image']}",
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              controller.categories[index]['categories_name'],
                              style: const TextStyle(color: Colors.black87),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const Text(
                  "Products for you",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  height: 250,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 8,
                    ),
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                              top: 26,
                              right: 12,
                              left: 12,
                              bottom: 8,
                            ),
                            child: Image.asset(
                              "assets/images/Mac-Book-Air.jpg",
                              width: 250,
                              height: 250,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Container(
                            height: 370,
                            width: 270,
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(
                                16,
                              ),
                            ),
                          ),
                          const Positioned(
                            left: 8,
                            top: 4,
                            child: Text(
                              "Asus ROG Zephyrus M16",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
