import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/controller/orders_controllers/pending_controller.dart';
import 'package:shop_savvy/view/widget/orders_widgets/appbar_leading_button.dart';
import 'package:shop_savvy/view/widget/orders_widgets/appbar_title.dart';
import 'package:shop_savvy/view/widget/orders_widgets/orders_card_item.dart';

class PendingOrders extends StatelessWidget {
  static const String routeName = '/pending-orders';

  const PendingOrders({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PendingOrdersController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          AppBarItem(),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: AppBarTitle(),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: GetBuilder<PendingOrdersController>(
          builder: (controller) => ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: controller.pendingDataList.length,
            itemBuilder: (context, index) => OrdersItemCard(
              ordersMd: controller.pendingDataList[index],
            ),
          ),
        ),
      ),
    );
  }
}
