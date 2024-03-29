import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/controller/orders_controllers/archive_orders_controller.dart';
import 'package:shop_savvy/controller/orders_controllers/pending_controller.dart';
import 'package:shop_savvy/core/class/handling_data_view.dart';
import 'package:shop_savvy/core/constants/color.dart';
import 'package:shop_savvy/view/widget/orders_widgets/appbar_leading_button.dart';
import 'package:shop_savvy/view/widget/orders_widgets/appbar_title.dart';
import 'package:shop_savvy/view/widget/orders_widgets/archived_orders_card_item.dart';
import 'package:shop_savvy/view/widget/orders_widgets/pending_orders_card_item.dart';

class MyOrdersView extends StatelessWidget {
  static const String routeName = '/my-orders-view';

  const MyOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PendingOrdersController());
    Get.put(ArchiveOrdersController());
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            AppBarItem(),
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: AppBarTitle(),
          bottom: const TabBar(
            indicatorColor: AppColors.secondaryColor,
            labelColor: AppColors.primaryDark,
            labelStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            tabs: [
              Tab(
                text: "Delivered",
              ),
              Tab(
                text: "Archived",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              child: GetBuilder<PendingOrdersController>(
                builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: controller.ordersList.length,
                    itemBuilder: (context, index) => PendingOrdersItemCard(
                      ordersMd: controller.ordersList[index],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: GetBuilder<ArchiveOrdersController>(
                builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: controller.ordersList.length,
                    itemBuilder: (context, index) => ArchivedOrdersItemCard(
                      ordersMd: controller.ordersList[index],
                    ),
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
