import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_savvy/core/constants/color.dart';
import 'package:shop_savvy/generated/assets.dart';
import 'package:shop_savvy/view/widget/checkout_widgets/check_bottom_button.dart';
import 'package:shop_savvy/view/widget/checkout_widgets/check_main_texts.dart';
import 'package:shop_savvy/view/widget/checkout_widgets/checkout_delivery_container.dart';
import 'package:shop_savvy/view/widget/checkout_widgets/checkout_location_card.dart';
import 'package:shop_savvy/view/widget/checkout_widgets/checkout_payment_container.dart';

class CheckOutView extends StatelessWidget {
  static const String routeName = '/check-out';

  const CheckOutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CheckoutBottomButton(),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.primaryDark,
          ),
        ),
        title: Text(
          'CheckOut',
          style: TextStyle(
              color: AppColors.primaryDark,
              fontWeight: FontWeight.bold,
              fontSize: 22),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            CustomCheckText(
              text: "Choose Payment Method",
            ),
            const SizedBox(
              height: 10,
            ),
            MethodPaymentContainer(
              isActive: true,
              text: "Cash",
              imageUrl: Assets.imagesCash,
            ),
            MethodPaymentContainer(
              isActive: false,
              text: "Visa Card",
              imageUrl: Assets.imagesVisaRemovebgPreview,
            ),
            MethodPaymentContainer(
              isActive: false,
              text: "Master Card",
              imageUrl: Assets.imagesMasterCardRemovebgPreview,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomCheckText(
              text: "Choose Delivery Method",
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MethodDeliveryContainer(
                  isActive: true,
                  imageUrl: Assets.imagesDelivery,
                  text: "Delivery",
                ),
                SizedBox(
                  width: 20,
                ),
                MethodDeliveryContainer(
                  isActive: false,
                  imageUrl: Assets.imagesDrivethru,
                  text: "Drive Thru",
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            CustomCheckText(
              text: "Choose Shipping Location",
            ),
            CheckoutLocationCard(
              isActive: true,
              title: "Home",
              subtitle: "10 Ibrahim El-attar Street",
            ),
            CheckoutLocationCard(
              isActive: false,
              title: "Work",
              subtitle: "10 Ibrahim El-attar Street",
            ),
          ],
        ),
      ),
    );
  }
}
