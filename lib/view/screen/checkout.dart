import 'package:flutter/material.dart';
import 'package:shop_savvy/core/constants/color.dart';
import 'package:shop_savvy/generated/assets.dart';
import 'package:shop_savvy/view/widget/checkout_widgets/checkout_delivery_container.dart';
import 'package:shop_savvy/view/widget/checkout_widgets/checkout_payment_container.dart';

class CheckOutView extends StatelessWidget {
  static const String routeName = '/check-out';

  const CheckOutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 32),
        child: MaterialButton(
          padding: EdgeInsets.symmetric(vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          color: AppColors.primaryColor,
          textColor: Colors.white,
          onPressed: () {},
          child: Text(
            "Checkout",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
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
            Text(
              "Choose Payment Method",
              style: TextStyle(
                fontSize: 18,
                color: AppColors.darkColor,
                fontWeight: FontWeight.bold,
              ),
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
            Text(
              "Choose Delivery Method",
              style: TextStyle(
                fontSize: 18,
                color: AppColors.darkColor,
                fontWeight: FontWeight.bold,
              ),
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
            Text(
              "Choose Shipping Location",
              style: TextStyle(
                fontSize: 18,
                color: AppColors.darkColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              elevation: 6,
              child: Container(
                child: ListTile(
                  title: Text(
                    "Home",
                  ),
                  subtitle: Text(
                    "10 Ibrahim El-attar Street",
                  ),
                ),
              ),
            ),
            Card(
              color: AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              elevation: 1,
              child: Container(
                child: ListTile(
                  title: Text(
                    "Work",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 16),
                  ),
                  subtitle: Text(
                    "10 Ibrahim El-attar Street",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 16),
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
