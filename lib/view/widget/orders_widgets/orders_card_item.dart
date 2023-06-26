import 'package:flutter/material.dart';
import 'package:shop_savvy/data/model/pending_orders_model.dart';
import 'package:shop_savvy/view/widget/orders_widgets/orders_id_and_date_time.dart';
import 'package:shop_savvy/view/widget/orders_widgets/orders_texts.dart';
import 'package:shop_savvy/view/widget/orders_widgets/orders_total_price.dart';

class OrdersItemCard extends StatelessWidget {
  final PendingOrdersMd ordersMd;
  const OrdersItemCard({
    super.key, required this.ordersMd,
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
              orderDateTime: "${ordersMd.ordersDatetime}",
            ),
            Divider(),
            OrdersRowOfText(
              text1: "Tracking Number: ",
              text2: "+201156789207",
            ),
            OrdersRowOfText(
              text1: "Order Type     : ",
              text2: ordersMd.ordersType == 0 ? "Delivery":"Drive Thru",
            ),
            OrdersRowOfText(
              text1: "Delivery Taxes : ",
              text2: "${ordersMd.ordersPriceDelivery} EGP",
            ),
            OrdersRowOfText(
              text1: "Payment Method : ",
              text2: ordersMd.ordersPaymentMethod == 1 ? "Cash On Delivery":"Visa",
            ),
            Divider(),
            OrdersTotalPrice(
              onPressed: () {},
              text1: "Total Price",
              text2: "${ordersMd.ordersTotalPrice!.round()} EGP",
            ),
          ],
        ),
      ),
    );
  }
}
