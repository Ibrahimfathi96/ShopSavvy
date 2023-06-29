import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:shop_savvy/controller/orders_controllers/pending_controller.dart';
import 'package:shop_savvy/data/model/pending_orders_model.dart';
import 'package:shop_savvy/view/widget/orders_widgets/orders_id_and_date_time.dart';
import 'package:shop_savvy/view/widget/orders_widgets/orders_texts.dart';
import 'package:shop_savvy/view/widget/orders_widgets/orders_total_price.dart';

class OrdersItemCard extends GetView<PendingOrdersController> {
  final PendingOrdersMd ordersMd;

  const OrdersItemCard({
    super.key,
    required this.ordersMd,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OrdersTimeAndId(
              orderId: ordersMd.ordersId!,
              orderDateTime: "${Jiffy.parse(ordersMd.ordersDatetime!).fromNow()}",
            ),
            Divider(
              thickness: 2,
            ),
            OrdersRowOfText(
              text1: "Tracking Number: ",
              text2: "${controller.services.prefs.getString("phone")}",
            ),
            OrdersRowOfText(
              text1: "Order Type     : ",
              text2: controller.printOrderType(ordersMd.ordersType!),
            ),
            OrdersRowOfText(
              text1: "Delivery Taxes : ",
              text2: "${ordersMd.ordersPriceDelivery} EGP",
            ),
            OrdersRowOfText(
              text1: "Payment Method : ",
              text2:
                  controller.printPaymentMethod(ordersMd.ordersPaymentMethod!),
            ),
            Divider(thickness: 2),
            OrdersTotalPrice(
              onPressed: () {},
              text1: "Total Price",
              status: controller.printOrderStatus(ordersMd.ordersStatus!),
              color: controller.orderStatusColor(ordersMd.ordersStatus!),
              text2: "${ordersMd.ordersTotalPrice!.round()} EGP",
            ),
          ],
        ),
      ),
    );
  }
}
